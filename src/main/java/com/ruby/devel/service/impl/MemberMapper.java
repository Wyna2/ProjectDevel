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

	// 로그인 
	public int login(HashMap<String, String> user);
	
	// 회원 이름 가져오기(by ID)
	public String getName(String id);
	
	// 회원 이름 가져오기(by ID)
	public String getNickname(String id);
	
	public String getUserKey(String id);
	
	public String findIdByEmail(HashMap<String, String> finder);
	
	public String findIdByContactNumber(HashMap<String, String> finder);
}
