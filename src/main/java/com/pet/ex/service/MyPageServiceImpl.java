package com.pet.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.pet.ex.mapper.MyPageMapper;
import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.PayGoodsVO;
import com.pet.ex.vo.PayVO;
import com.pet.ex.vo.PointVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageMapper myPageMapper;

	@Autowired
	private PasswordEncoder passwordEncoder;

	// 장바구니 목록 상품 가져오기
	@Override
	public BoardVO getBoard(String board_id) {
		log.info("getBoard()");
		return myPageMapper.getBoard(board_id);
	}

	// 사용가능한 포인트 가져오기
	@Override
	public PointVO getPoint(String member_id) {
		log.info("getPoint()");
		return myPageMapper.getPoint(member_id);
	}

	// 결제 완료 후 pay테이블에 정보 저장 및 포인트 사용 내역 저장
	@Override
	public void insertPay(PayVO pay) {
		log.info("insertPay()");
		myPageMapper.insertPay(pay);
		if (pay.getUsepoint() != 0) {
			myPageMapper.insertUsePoint(pay);
		}

		myPageMapper.insertEarningPoint(pay);
	}

	// 결제 완료 후 pay_id 가져오기
	@Override
	public PayVO getPay_id(String member_id) {
		log.info("getPay_id()");
		return myPageMapper.getPay_id(member_id);
	}

	// 결제 완료 후 payGoods테이블에 상품 목록 저장
	@Override
	public void insertPayGoods(PayGoodsVO payGoods) {
		log.info("insertPayGoods()");
		myPageMapper.insertPayGoods(payGoods);
	}

	// 주문 리스트 불러오기
	@Override
	public List<PayVO> listOrder(Criteria cri, String member_id) {
		log.info("listOrder()");
		return myPageMapper.listOrder(cri, member_id);
	}

	// 총 결제 내역 갯수 가져오기
	@Override
	public int getPayTotal(String member_id) {
		log.info("getPayTotal()");
		return myPageMapper.getPayTotal(member_id);
	}

	// payGoods리스트 가져오기
	@Override
	public List<PayGoodsVO> listPayGoods(int pay_id) {
		log.info("listPayGoods()");
		return myPageMapper.listPayGoods(pay_id);
	}

	// 결제 상태별 주문 리스트
	@Override
	public List<PayVO> listPaystateOrder(Criteria cri, String member_id, String paystate_id) {
		log.info("listPaystateOrder()");
		return myPageMapper.listPaystateOrder(cri, member_id, paystate_id);
	}

	// 결제 상태별 갯수 가져오기
	@Override
	public int getPaystateTotal(String member_id, int paystate_id) {
		log.info("getPaystateTotal");
		return myPageMapper.getPaystateTotal(member_id, paystate_id);

	}

	// 리뷰 작성
	@Override
	public void insertReview(BoardVO boardVO) {
		log.info("insertReview()");
		myPageMapper.insertReview(boardVO);
	}

	// 리뷰 이미지 저장
	@Override
	public void insertImg(ImageVO imageVO, int board_id) {
		log.info("insertImg()");
		myPageMapper.insertImg(imageVO, board_id);
	}

	// 리뷰 작성 후 포인트 저장
	@Override
	public void insertPoint(int pscore, int pointtype_id, String member_id) {
		log.info("insertPoint()");
		myPageMapper.insertPoint(pscore, pointtype_id, member_id);
	}

	// 결제 취소 후 결제상태 변경
	@Override
	public void updatePayCancel(String receipt_id) {
		log.info("updatePayCancel()");
		myPageMapper.updatePayCancel(receipt_id);
	}

	// 결제내역 가져오기
	@Override
	public PayVO getPay(String pay_id) {
		log.info("getPay()");
		return myPageMapper.getPay(pay_id);
	}

	// 가장 최신의 리뷰게시물 1개 가져오기
	@Override
	public BoardVO getReview() {
		log.info("getReview()");
		return myPageMapper.getReview();
	}

	// 회원 정보 수정
	@Override
	public void updateMember(MemberVO member) {
		log.info("updateMember()");
		System.out.println(!member.getPassword().equals(""));
		if (!member.getPassword().equals("")) {
			String password = member.getPassword();
			String encodedPassword = passwordEncoder.encode(password);
			member.setPassword(encodedPassword);
			myPageMapper.updateMember(member);
		} else {
			myPageMapper.updateMemberNoPw(member);
		}

	}

	// 포인트 리스트
	@Override
	public List<PointVO> getPointList(String member_id) {
		log.info("getPointList()");
		return myPageMapper.getPointList(member_id);
	}

	// 포인트 리스트 (날짜)
	@Override
	public List<PointVO> getPointList(String member_id, String startDate, String endDate, Criteria cri) {
		log.info("getPointList()");
		return myPageMapper.getPointListByDate(member_id, startDate, endDate, cri);
	}

	// 회원 탈퇴
	@Override
	public void deleteMember(String member_id) {
		log.info("getPointList()");
		myPageMapper.deleteMember(member_id);
	}

	// 날짜별 포인트 내역 총합 가져오기
	@Override
	public int getPointTotalByDate(String member_id, String startDate, String endDate, Criteria cri) {
		log.info("getPointTotalByDate()");
		return myPageMapper.getPointTotalByDate(member_id, startDate, endDate);
	}

	// 구매확정 및 포인트 지급
	@Override
	public void updatePaystate_id(String pay_id) {
		log.info("updatePaystate_id()");
		myPageMapper.updatePaystate_id(pay_id);

	}

	@Override
	public void updatePayGoodsReview(String paygoods_id) {
		log.info("updatePayGoodsReview()");
		myPageMapper.updatePayGoodsReview(paygoods_id);

	}

}
