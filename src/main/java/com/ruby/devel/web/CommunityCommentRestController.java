package com.ruby.devel.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ruby.devel.model.CommunityCommentDto;
import com.ruby.devel.service.impl.CommunityCommentMapper;
import com.ruby.devel.service.impl.MemberMapper;

@RestController
public class CommunityCommentRestController {
	
	@Autowired
	CommunityCommentMapper CMmapper;
	
	@Autowired
	MemberMapper Mmapper;
	
	//댓글 입력
	@PostMapping("/community/commentinsert")
	public void insert(
			@ModelAttribute CommunityCommentDto cm_dto,
			HttpSession session) {
		
		String member_idx=(String)session.getAttribute("userKey");
		
		System.out.println(member_idx);
		
		cm_dto.setMember_idx(member_idx);
		
		CMmapper.insertComment(cm_dto);
		
	}
	
	//리스트 출력
	@GetMapping("/community/commentlist")
	public List<CommunityCommentDto> commentlist(
			String community_idx)
	{
		//@RestController 이기 때문에
		//list에 대한 반환이 json으로 반환해준것
		return CMmapper.getAllComments(community_idx);
	}

	
	//삭제
	@GetMapping("/community/deletecomment")
	public void commentdelete(String community_comment_idx)
	{
			CMmapper.deleteComment(community_comment_idx);
	}
	
	//하나의 idx에 관한 dto 반환
	@GetMapping("/community/commentdata")
	public CommunityCommentDto data(String community_comment_idx) {
		
		return CMmapper.getComment(community_comment_idx);
	}
	
	//수정
	@PostMapping("/community/updatecomment")
	public void commentupdate(@ModelAttribute CommunityCommentDto cm_dto) {
		CMmapper.updateComment(cm_dto);
	}
	
	
	
}
