package com.ruby.devel.service.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ruby.devel.model.CommunityDto;
import com.ruby.devel.model.MemberDto;

@Mapper
public interface CommunityMapper {
	
	//전체 게시글 수 출력
	public int getTotalCount();
	
	//게시글 insert
	public void insertCommunity(CommunityDto c_dto);
	
	//게시글 출력
	public List<CommunityDto> getAllDatas();
	
	//idx값 갖고오기
	public CommunityDto getData(String community_idx);
	
	//조회수 증가
	public void updateReadCount(String community_idx);
	
	//페이징 처리
	public List<CommunityDto> getList(HashMap<String, Integer> map);
	
	//게시글 삭제
	public void deleteCommunity(String community_idx);
	
	//추천수 증가
	public void updateLikeCount(String community_idx);
	


}
