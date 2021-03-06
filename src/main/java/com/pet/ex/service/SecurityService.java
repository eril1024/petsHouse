package com.pet.ex.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.pet.ex.vo.MemberVO;

public interface SecurityService extends UserDetailsService {

	// 유저네임으로 멤버조회
	UserDetails loadUserByUsername(String id);

	// 멤버조회
	MemberVO getMember(String id);

	// 회원가입
	int insertMember(MemberVO member);

	// 비밀번호 틀린횟수 증가
	int updateTryCount(String id);

	// 로그인 성공시 비밀번호 틀린횟수 초기화
	int updateResetTryCount(String id);

	// 멤버조회 (닉네임)
	MemberVO getMemberByNickname(String nickname);

	// 멤버조회 (전화번호)
	MemberVO getMemberByTel(int tel);

	// 회원가입 후 포인트 지급
	void insertRegisterPoint(String member_id);

	// 비밀번호 변경
	void updatePassword(String member_id, String password);

}
