package com.ruby.devel.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommunityController {
	
	@GetMapping("/community")  // 메뉴 선택 시 이동하는 기본 페이지
	public String community_main() {
		
		return "/community/community_main";	// /community/(파일명)
	}
	
	@GetMapping("/community/contentadd")  // 글쓰기 페이지
	public String community_contentadd()
	{
		return "/community/community_contentAddForm";
	}
	
	@GetMapping("/community/contentdetail")  // 일반글 상세 페이지
	public String community_contentdetail()
	{
		return "/community/community_contentDetail";
	}
	
	@GetMapping("/community/contentdetail_logout")  // 일반글 상세보기(로그아웃) [임시]
	public String community_contentdetail_logout()
	{
		return "/community/community_contentDetail_logout";
	}
	
	@GetMapping("/community/qnadetail")  // Q&A글 상세 페이지
	public String community_qnadetail()
	{
		return "/community/community_qnaDetail";
	}

}
