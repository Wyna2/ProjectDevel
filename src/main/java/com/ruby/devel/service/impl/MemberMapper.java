package com.ruby.devel.service.impl;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.ruby.devel.model.MemberDto;

@Mapper
public interface MemberMapper {

	// 회원가입
	public void addMember(MemberDto m_dto);
	
	// 아이디 중복체크
	public int checkVaildId(String id);
	
	// 닉네임 중복체크
	public int checkVaildNickname(String nickname); 
	
	// 회원가입 추가정보 
	public int addMemberInfo(MemberDto m_dto);
	public int signupComplete(String id);

	// 로그인 
	public int login(HashMap<String, String> user);

	public int checkVaildSignup(HashMap<String, String> user);
	
	// 회원 Key, 이름, 닉네임 가져오기
	public String getName(String id);
	public String getNickname(String id);
	public String getUserKey(String id);
	
	// 연락처, 이메일로 아이디 찾기
	public String findIdByEmail(HashMap<String, String> finder);
	public String findIdByContactNumber(HashMap<String, String> finder);
	
	// 비밀번호 재설정
	public String searchForResetPw(MemberDto m_dto);
	public void modMemberPw(MemberDto m_dto);
	
	public MemberDto getMemberDatas(String member_idx);
	public String getMemberAge(String member_idx);
  
}
