package com.pet.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;


import com.pet.ex.mapper.MapMapper;
import com.pet.ex.page.Criteria;
import com.pet.ex.page.PageVO;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class MapServiceImpl implements MapService {

	private MapMapper mapper;
	
	@Override
	public List<BoardVO> getList(Criteria cri) {
	log.info("getList...");
		return mapper.getList(cri);
	}

	

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return  mapper.getTotal(cri);
	}



	@Override
	public void write(BoardVO boardVO) {
		
		
		
	mapper.write(boardVO);
		
	}



	@Override
	public BoardVO content_view(int board_id) {
		
		return mapper.content_view(board_id);
	}



	@Override
	public void inputDelete(int board_id) {
		
		mapper.inputDelete(board_id);
		
	}



	@Override
	public void insertLoc(MemberVO memberVO) {
		
		mapper.insertLoc(memberVO);
		
	}



	@Override
	public List<MemberVO> getMemberList(String getMember_id) {
		
		return mapper.getMemberList(getMember_id);
	}



	



	

}
