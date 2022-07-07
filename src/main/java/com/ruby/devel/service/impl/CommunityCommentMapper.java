package com.ruby.devel.service.impl;



import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ruby.devel.model.CommunityCommentDto;





@Mapper
public interface CommunityCommentMapper {
	//댓글 전체 개수 가져오기
	public int getTotalCount(String community_idx);
	
	//댓글 출력 리스트
	public List<CommunityCommentDto> getAllCommentsList(HashMap<String, Object> map);
	
	//댓글 입력
	public void insertComment(CommunityCommentDto cm_dto);
	
	//댓글 출력
	public List<CommunityCommentDto> getAllComments(String community_idx);
	
	//댓글 삭제
	public void deleteComment(String community_comment_idx);
	
	//댓글 넘버 갖고오기
	public CommunityCommentDto getComment(String community_comment_idx);
	
	//댓글 수정
	public void updateComment(CommunityCommentDto cm_dto);
	
	//답변 채택시 +1
	public void answerChoose(String community_comment_idx);
	
}
