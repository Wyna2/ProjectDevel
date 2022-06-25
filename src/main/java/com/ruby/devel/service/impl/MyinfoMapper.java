package com.ruby.devel.service.impl;

import org.apache.ibatis.annotations.Mapper;
import com.ruby.devel.model.MemberDto;

@Mapper
public interface MyinfoMapper {
	
	//로그인한 회원 정보 가져오기
	public MemberDto getData(String userKey);
	
	//회원정보 수정하기
	public void updateInfo(MemberDto dto);
	
	

}
