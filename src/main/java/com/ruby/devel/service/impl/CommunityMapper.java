package com.ruby.devel.service.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ruby.devel.model.CommunityDto;
import com.ruby.devel.model.CommunityScrapDto;

@Mapper
public interface CommunityMapper {
	
	//전체 게시글 수 출력
	public int getTotalCount();
	
	//게시글 insert
	public void insertCommunity(CommunityDto c_dto);
	
	//게시글 출력
	public List<CommunityDto> getAllDatas();
	
	//게시글 삭제
	public void deleteCommunity(String community_idx);
	
	//게시글 수정
	public void updateCommunity(CommunityDto c_dto);
	
	//idx값 갖고오기
	public CommunityDto getData(String community_idx);
	
	//조회수 증가
	public void updateReadCount(String community_idx);
	
	//페이징 처리
	public List<CommunityDto> getList(HashMap<String, Integer> map);
	
	//추천수 증가
	public void updateLikeCount(String community_idx);
	
	//qna타입 증가
	public void updateQnaType(String community_idx);
	
	//베스트게시글 출력
	public List<CommunityDto> bestList();
	
	//최신 qna 출력
	public List<CommunityDto> recentList();
	
	//start scrap
	public List<CommunityScrapDto> getScrapDatas();
	
	public void insertCommunityScrap(CommunityScrapDto cs_dto);
	
	public void updateCommunityScrap(CommunityScrapDto cs_dto);
	
	public int getScrapData(HashMap<String, String> map);	
	//end scrap
	
	//글 type에 따른  출력 
	public List<CommunityDto> getList_normal(HashMap<String, Integer> map);
	
	public List<CommunityDto> getList_qna(HashMap<String, Integer> map);
	
	//검색어 입력
	public List<CommunityDto> SearchGetList(HashMap<String, Object> map);
	
	public int getSearchCount(String SearchText);

	//홈의 게시글 리스트
	public List<CommunityDto> getHomeList();
	
}
