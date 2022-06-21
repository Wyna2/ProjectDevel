package com.ruby.devel.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MarketplaceController {
	
	@GetMapping("/marketplace")		// 메뉴 선택 시 이동하는 기본 페이지
	public String marketplace_home()
	{
		return "m/marketplace/market_main";  // m/marketplace/(파일명)
	}
	
	@GetMapping("/marketplace/productadd")		// 상품등록 페이지
	public String marketplace_productadd() {
		
		return "/marketplace/market_productAddForm";
	}
	
	@GetMapping("/marketplace/productdetail")		// 상품 상세 페이지
	public String marketplace_productdetail() {
		return "/marketplace/market_productDetail";
	}
	
}
