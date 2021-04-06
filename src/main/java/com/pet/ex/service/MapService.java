package com.pet.ex.service;

import java.util.List;

import com.pet.ex.page.Criteria;

import com.pet.ex.vo.BoardVO;



public interface MapService {

	public List<BoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
}