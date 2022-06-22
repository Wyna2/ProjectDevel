package com.ruby.devel.service;

import org.apache.ibatis.annotations.Mapper;

import com.ruby.devel.model.MemberDto;

@Mapper
public interface MemberMapper {

	//num값을 통해 data 얻기
	public MemberDto getData(String num);
}
