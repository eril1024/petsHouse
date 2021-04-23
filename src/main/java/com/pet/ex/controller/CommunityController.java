package com.pet.ex.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.pet.ex.page.Criteria;
import com.pet.ex.page.PageVO;
import com.pet.ex.service.CommunityService;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/commu")
public class CommunityController {

	@Autowired
	private CommunityService service;

	// 노하우 메인 페이지
	@RequestMapping("/tips")
	public ModelAndView tips(Criteria cri, ModelAndView mav) {
		mav.addObject("tips", service.getTipsList(cri));
		mav.addObject("rate", service.getTipsRate()); // 인기 노하우 슬라이드
		mav.setViewName("community/tips");
		return mav;
	}

	// 노하우 특정 글 페이지 출력
	@GetMapping("/tips/{board_id}")
	public ModelAndView tips_view(@PathVariable("board_id") int board_id, BoardVO boardVO, Criteria cri,
			ModelAndView mav) throws Exception {

		boardVO = service.getBoardInfo(board_id);

		log.info("tips_view()실행");
		int count = service.tcount(board_id);

		mav.addObject("tips_view", service.getBoard(boardVO.getBoard_id()));
		mav.addObject("img", service.getImg(board_id));
		mav.addObject("count", count);
		service.hit(boardVO.getBoard_id());
		mav.setViewName("community/tips_view");

		return mav;
	}

	// 노하우 동물 글 페이지 출력
	@GetMapping("/tips/pet")
	public List<ImageVO> tips_pet(int category_id, Criteria cri) throws Exception {

		List<ImageVO> list = new ArrayList<ImageVO>();  
		if (category_id == 0) {                       //0번이면 전체 리스트를 뿌려준다
			list = service.getTipsList(cri);
		} else {
			list = service.getPetTips(category_id);  
		}

		log.info("tips_pet()실행");
		return list;
	}

	// 노하우 글쓰기 페이지
	@GetMapping("/tips/write")
	public ModelAndView tips_write(ModelAndView mav) throws Exception {
		log.info("tips_write()실행");
		mav.setViewName("community/tips_write");
		return mav;
	}

	// 노하우 글 작성
	@PostMapping("/tips/write")
	public ModelAndView write(MultipartHttpServletRequest multi, BoardVO boardVO, ImageVO imageVO, ModelAndView mav)
			throws IllegalStateException, IOException {
		log.info("tipswrite()실행");
		service.writeTips(boardVO);

		String path = multi.getSession().getServletContext().getRealPath("/static/img/tips");
		path = path.replace("webapp", "resources");
		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}

		List<MultipartFile> mf = multi.getFiles("file");

		for (int i = 0; i < mf.size(); i++) { // 파일명 중복 검사

			UUID uuid = UUID.randomUUID(); // 파일명 랜덤으로 변경

			String originalfileName = mf.get(i).getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalfileName);
			// 저장 될 파일명
			String imgname = uuid + "." + ext;

			String savePath = path + "\\" + imgname; // 저장 될 파일 경로

			mf.get(i).transferTo(new File(savePath)); // 파일 저장
			imageVO.setImgname(imgname);
			BoardVO board = service.getTipsBoard_id();
			imageVO.getBoardVO().setBoard_id(board.getBoard_id());
			service.ImgInput(imageVO);

		}
		mav.setView(new RedirectView("/commu/tips", true));
		return mav;
	}

	// 노하우 글 수정 페이지
	@GetMapping("/tmodify_page")
	public ModelAndView tmodify_page(@RequestParam("board_id") int board_id, BoardVO boardVO, ModelAndView mav)
			throws Exception {
		log.info("tmodify_page()실행");
		mav.addObject("tips_view", service.getBoard(boardVO.getBoard_id()));
		mav.addObject("img", service.getImg(board_id));
		mav.setViewName("community/tips_modify");
		return mav;
	}

	// 노하우 글 수정하기
	@PostMapping("/tmodify")
	public ModelAndView tmodify(BoardVO boardVO, ModelAndView mav) throws Exception {
		log.info("tmodify()실행");
		service.tmodify(boardVO);
		mav.setView(new RedirectView("/commu/tips", true));
		return mav;
	}

	// 노하우 글 삭제하기
	@DeleteMapping("/tdelete/{board_id}")
	public ResponseEntity<String> tipsDelete(BoardVO boardVO, Model model) {

		ResponseEntity<String> entity = null;
		log.info("delete");

		try {
			service.ImgDelete(boardVO.getBoard_id());
			service.tipsdelete(boardVO.getBoard_id());

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();

			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;

	}

	// 노하우 댓글 작성
	@PostMapping("/tips_view/insert")
	public BoardVO insertTipsComment(BoardVO boardVO, @RequestParam("member_id") String member_id) {
		MemberVO member = new MemberVO();
		boardVO.setMemberVO(member);
		boardVO.getMemberVO().setMember_id(member_id);
		service.insertTipsComment(boardVO);
		BoardVO tcomment = service.getTipsComment(boardVO.getPgroup());
		System.out.println(tcomment);
		return tcomment;
	}

	// 댓글 더보기
	@PostMapping("/tmorelist")
	public Map<String, Object> tipscomment(@RequestParam("board_id") int board_id, Criteria cri) {
		log.info("commentmorelist");
		Map<String, Object> list = new HashMap<>();
		List<BoardVO> tcomment = service.getTipsCommentList(board_id, cri);
		list.put("tcomment", tcomment);
		list.put("commentTotal", service.tcount(board_id));
		return list;
	}

	// 노하우 더보기
	@PostMapping("/morelist")
	public Map<String, Object> tips(Criteria cri) {
		log.info("morelist");
		Map<String, Object> list = new HashMap<>();
		List<ImageVO> tips = service.getTipsList(cri);
		list.put("tips", tips);
		return list;
	}

	// 질문과 답변 메인 페이지
	@RequestMapping("/qna")
	public ModelAndView qna(Criteria cri, ModelAndView mav) {
		mav.addObject("qna", service.getQnaList(cri));
		int total = service.getTotal(cri);
		mav.addObject("pageMaker", new PageVO(cri, total));
		mav.setViewName("community/qna");
		return mav;

	}

	// 질문과 답변 특정 글 페이지
	@GetMapping("/qna/{board_id}")
	public ModelAndView qna_view(@PathVariable("board_id") int board_id, BoardVO boardVO, Criteria cri,
			ModelAndView mav) throws Exception {
		boardVO = service.getQnaInfo(board_id);
		log.info("qna_view()실행");
		mav.addObject("qna_view", service.getQnaBoard(boardVO.getBoard_id()));
		mav.addObject("img", service.getImg(board_id));
		int qcount = service.qcount(board_id);
		mav.addObject("qcount", qcount);
		service.hit(boardVO.getBoard_id());
		mav.setViewName("community/qna_view");
		return mav;
	}

	// 질문과 답변 동물 글 페이지 출력
	@GetMapping("/qna/pet")
	public List<BoardVO> qna_pet(int category_id, Criteria cri) throws Exception {
		List<BoardVO> list = new ArrayList<BoardVO>();
		if (category_id == 0) {
			list = service.getQnaList(cri);
		} else {
			list = service.getPetQna(category_id);
		}

		log.info("qna_pet()실행");
		return list;
	}

	// 질문과 답변 글쓰기 페이지
	@GetMapping("/qna/write")
	public ModelAndView qna_write(ModelAndView mav) throws Exception {
		log.info("qna_write()실행");
		mav.setViewName("community/qna_write");
		return mav;
	}

	// 글 작성하기 질문과답변
	@PostMapping("/qna/write")
	public ModelAndView write(MultipartHttpServletRequest multi, ImageVO imageVO, BoardVO boardVO, ModelAndView mav)
			throws IllegalStateException, IOException {
		log.info("write()실행");
		service.writeQna(boardVO);
		BoardVO board = service.getQnaBoard_id();
		System.out.println(board.getBoard_id());

		String path = multi.getSession().getServletContext().getRealPath("/static/img/qna");
		path = path.replace("webapp", "resources");
		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}

		List<MultipartFile> mf = multi.getFiles("file");

		for (int i = 0; i < mf.size(); i++) { // 파일명 중복 검사

			UUID uuid = UUID.randomUUID(); // 파일명 랜덤으로 변경

			String originalfileName = mf.get(i).getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalfileName);
			// 저장 될 파일명
			String imgname = uuid + "." + ext;

			String savePath = path + "\\" + imgname; // 저장 될 파일 경로

			mf.get(i).transferTo(new File(savePath)); // 파일 저장
			imageVO.setImgname(imgname);
			
			imageVO.getBoardVO().setBoard_id(board.getBoard_id());
			service.ImgInput(imageVO);

		}
		mav.setView(new RedirectView("/commu/qna", true));
		return mav;
	}

	// 질문과 답변 글 검색
	@PostMapping("/qnasearch")
	public ModelAndView qnasearch(@RequestParam("keyword") String keyword, ModelAndView mav, BoardVO boardVO)
			throws Exception {
		log.info("qsearch()실행");
		mav.addObject("qsearch", service.getQnasearch(keyword));
		mav.setViewName("/community/qnasearch");
		return mav;
	}

	// 질문과 답변 태그 검색
	@GetMapping("/qnatag")
	public ModelAndView qtag(@RequestParam("keyword") String keyword, ModelAndView mav, BoardVO boardVO)
			throws Exception {
		log.info("qtag()실행");
		mav.addObject("qtag", service.getQnatag(keyword));
		mav.setViewName("/home/search");
		return mav;
	}

	// 질문과 답변 글 수정 페이지
	@GetMapping("/modify_page")
	public ModelAndView modify_page(@RequestParam("board_id") int board_id, BoardVO boardVO, ModelAndView mav)
			throws Exception {
		log.info("modify_page()실행");
		mav.addObject("qna_view", service.getQnaBoard(boardVO.getBoard_id()));
		mav.setViewName("community/qna_modify");
		return mav;
	}

	// 질문과 답변 글 수정하기
	@PostMapping("/modify")
	public ModelAndView modify(BoardVO boardVO, ModelAndView mav) throws Exception {
		log.info("modify()실행");
		service.modify(boardVO);
		mav.setView(new RedirectView("/commu/qna", true));
		return mav;
	}

	// 질문과 답변 댓글 작성
	@PostMapping("/qna_view/insert")
	public BoardVO insertComment(BoardVO boardVO, @RequestParam("member_id") String member_id) {
		MemberVO member = new MemberVO();
		boardVO.setMemberVO(member);
		boardVO.getMemberVO().setMember_id(member_id);
		service.insertComment(boardVO);
		BoardVO comments = service.getComment(boardVO.getPgroup());
		System.out.println(comments);
		return comments;
	}

	// 댓글 더보기
	@PostMapping("/cmorelist")
	public Map<String, Object> comments(@RequestParam("board_id") int board_id, Criteria cri) {
		log.info("commentsmorelist");
		Map<String, Object> list = new HashMap<>();
		List<BoardVO> comments = service.getcommentsList(cri, board_id);
		list.put("comments", comments);
		list.put("commentTotal", service.qcount(board_id));
		return list;
	}


	// 질문과 답변 글 삭제하기
	@DeleteMapping("/qdelete/{board_id}")
	public ResponseEntity<String> qnaDelete(BoardVO boardVO, Model model) {

		ResponseEntity<String> entity = null;
		log.info("delete");

		try {
			service.ImgDelete(boardVO.getBoard_id());
			service.qnadelete(boardVO.getBoard_id());

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();

			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;

	}

	// 질문과 답변 댓글 삭제 
	@DeleteMapping("/qna/comment/delete/{board_id}")
	public ResponseEntity<String> deletQnaComment(BoardVO boardVO) {

		ResponseEntity<String> entity = null;
		log.info("delete");

		try {

			service.deleteQnaComment(boardVO);

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();

			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;

	}

	// 노하우 댓글 삭제
	@DeleteMapping("/tips/comment/delete/{board_id}")
	public ResponseEntity<String> deleteTipsComment(BoardVO boardVO) {

		ResponseEntity<String> entity = null;
		log.info("delete");

		try {

			service.deleteTipsComment(boardVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();

			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;

	}

}
