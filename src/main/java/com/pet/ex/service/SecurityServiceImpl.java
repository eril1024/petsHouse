package com.pet.ex.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.pet.ex.mapper.LoginMapper;
import com.pet.ex.security.handlers.MyAuthentication;
import com.pet.ex.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SecurityServiceImpl implements SecurityService {

	@Autowired
	private LoginMapper loginMapper;

	@Autowired
	private PasswordEncoder passwordEncoder;

	// 멤버 가져오기
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		log.info("loadUserByUsername()");
		MemberVO member = loginMapper.getMember(id);
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		MyAuthentication myInfo = null;
		if (member != null) {
			authorities.add(new SimpleGrantedAuthority(member.getRoleVO().getRolename()));
			myInfo = new MyAuthentication(id, member.getPassword(), authorities, member);
		}

		return myInfo;
	}

	// 회원가입
	@Override
	public int insertMember(MemberVO member) {
		log.info("insertMember()");
		// 패스워드 암호화
		String password = member.getPassword();
		String encodedPassword = passwordEncoder.encode(password);
		member.setPassword(encodedPassword);

		// 이메일 인증 키 삽입
		if (member.getCertify() == null) {
			member.setCertify(certified_key());
		}
		return loginMapper.insertMember(member);
	}

	// 이메일 인증키 생성
	private String certified_key() {
		log.info("certified_Key()");
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = random.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < 10);
		return sb.toString();
	}

	// 멤버조회
	@Override
	public MemberVO getMember(String id) {
		log.info("getMember()");
		return loginMapper.getMember(id);
	}

	// 비밀번호 틀린횟수 증가
	@Override
	public int updateTryCount(String id) {
		log.info("updateTryCount()");
		return loginMapper.updateTryCount(id);
	}

	// 로그인 성공시 비밀번호 틀린횟수 초기화
	@Override
	public int updateResetTryCount(String id) {
		log.info("updateTryCountReset()");
		return loginMapper.updateResetTryCount(id);
	}

	// 회원 정보 조회 (닉네임)
	@Override
	public MemberVO getMemberByNickname(String nickname) {
		log.info("getMemberByNickname()");
		return loginMapper.getMemberByNickname(nickname);
	}

	@Override
	public MemberVO getMemberByTel(int tel) {
		log.info("getMemberByTel()");
		return loginMapper.getMemberByTel(tel);
	}

	@Override
	public void insertRegisterPoint(String member_id) {
		log.info("insertRegisterPoint()");
		loginMapper.insertRegisterPoint(member_id);
	}

	@Override
	public void updatePassword(String member_id, String password) {
		log.info("updatePassword");
		String encodedPassword = passwordEncoder.encode(password);
		password = encodedPassword;
		loginMapper.updatePassword(member_id, password);

	}

}
