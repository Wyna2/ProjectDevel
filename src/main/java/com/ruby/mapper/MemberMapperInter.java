package com.ruby.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.ruby.dto.MemberDto;

@Mapper
public interface MemberMapperInter {

	//num값을 통해 data 얻기
	public MemberDto getData(String num);
}
