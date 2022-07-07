package com.ruby.devel.web;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ruby.devel.model.CommunityDto;
import com.ruby.devel.model.MarketDto;
import com.ruby.devel.model.TeamDto;
import com.ruby.devel.service.impl.ActivityMapper;
import com.ruby.devel.service.impl.MemberMapper;
import com.ruby.devel.service.impl.TeamMapper;

@Controller
public class ActivityController {
	
	@Autowired //Member 자동주입
	MemberMapper Mmapper;
	
	@Autowired //Activity 자동주입
	ActivityMapper Amapper;
	
	@Autowired //Tean 자동주입
	TeamMapper Tmapper;
	
	
	//모아보기 페이지
	@GetMapping("/activity")  // 'activity' 아이콘 선택 시 기본 페이지(모아보기) 이동
	public ModelAndView activity_home(
			@SessionAttribute String userKey)
	{
		ModelAndView mview = new ModelAndView();
		
		//나의크보기 dto 얻기
		String team_idx = Tmapper.selectTeamIdx(userKey); 
		
		TeamDto tdto = Tmapper.getData(team_idx);
		mview.addObject("tdto", tdto);
		
		//나의작성글목록 dto 얻기
		List<CommunityDto> clist = Amapper.getWriteDatas(userKey);
		int clistsize = clist.size();
		System.out.println(clistsize);
		mview.addObject("clist", clist);
		mview.addObject("clistsize", clistsize);
		
		//나의거래목록 dto 얻기
		List<MarketDto> mplist = Amapper.getMarketDatas(userKey);
		int mplistsize = mplist.size();
		System.out.println(mplistsize);
		mview.addObject("mplist", mplist);
		mview.addObject("mplistsize", mplistsize);

		//포워딩
		mview.setViewName("a/activity/activity_main");
		
		return mview;  // /a/activity/(파일명)
	}
	
	
	//작성글 목록 페이지
	@GetMapping("/activity/mycommunity")
	public ModelAndView activity_write(
			@RequestParam (value = "currentPage",defaultValue = "1") int currentPage,
			@SessionAttribute String userKey)
	{
		ModelAndView mview = new ModelAndView();
				
		//페이징처리에 필요한 변수
		int totalPage; //총 페이지수
		int startPage; //각블럭의 시작페이지
		int endPage; //각블럭의 끝페이지
		int start; //각페이지의 시작번호..한페이지에서 보여질 시작 글 번호(인덱스에서 보여지는 번호)
		int perPage=5; //한페이지에 보여질 글 갯수
		int perBlock=3; //한블럭당 보여지는 페이지 개수
		int totalCount = Amapper.getWriteCount(userKey);
		
		//총페이지 개수구하기
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
									
		//각블럭의 시작페이지
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
								
		if(endPage>totalPage)
			endPage=totalPage;
						
		//각페이지에서 불러올 시작번호
		start=(currentPage-1)*perPage;

		//데이타 가져오기..map처리
		HashMap<String, Object> map = new HashMap<>();
		map.put("userKey", userKey);
		map.put("start", start);
		map.put("perPage", perPage);
		
		//나의작성목록 dto 얻기
		List<CommunityDto> clist = Amapper.getWritePageDatas(map);
		
		mview.addObject("clist", clist);
		//출력에 필요한 변수들을 request 에 저장
		mview.addObject("startPage",startPage);
		mview.addObject("endPage",endPage);
		mview.addObject("totalPage",totalPage);
		mview.addObject("totalCount",totalCount);
		mview.addObject("currentPage",currentPage);
		mview.addObject("totalCount",totalCount);
		
		//포워딩
		mview.setViewName("a/activity/activity_myCommunity");

		return mview;  // /a/activity/(파일명)
	}
	
	//작성글 삭제 writeDel
	@PostMapping("/activity/writeDel")
	public String activity_writeDel(
			@RequestParam String cnum)
	{
		String[] cnums = cnum.split(",");
		if(cnums.length>1) {
			for(int i=0; i<cnums.length; i++) {
				String community_idx = cnums[i];
				Amapper.getWriteDelete(community_idx);
			}
		} else {
			String community_idx = cnum;
			Amapper.getWriteDelete(community_idx);
		}

		//완료 후 목록 이동
		return "redirect:mycommunity";
	}
	
	//거래 목록 페이지
	@GetMapping("/activity/mymarketplace")
	public ModelAndView activity_market(
			@SessionAttribute String userKey)
	{
		ModelAndView mview = new ModelAndView();
		
		//나의거래목록(SoldOut list) dto 얻기
		List<MarketDto> mpsoldlist = Amapper.getMarketSoldDatas(userKey);
		int mpsolidlistsize = mpsoldlist.size();
		List<MarketDto> mpnotsoldlist = Amapper.getMarketNotSoldDatas(userKey);
		int mpnotsolidlistsize = mpnotsoldlist.size();
		
		mview.addObject("mpsoldlist", mpsoldlist);
		mview.addObject("mpsolidlistsize", mpsolidlistsize);
		mview.addObject("mpnotsoldlist", mpnotsoldlist);
		mview.addObject("mpnotsolidlistsize", mpnotsolidlistsize);
		
		System.out.println(mpsolidlistsize);
		System.out.println(mpnotsolidlistsize);

		//포워딩
		mview.setViewName("a/activity/activity_myMarketplace");

		return mview;  // /a/activity/(파일명)
	}	
	
	
	//챌린지 페이지
	@GetMapping("/activity/mychallenge")
	public String activity_challenge()
	{
		return "a/activity/activity_myChallenge";  
	}
	
	
	//스크랩 페이지
	@GetMapping("/activity/myscrap")
	public ModelAndView activity_scrap(
			@RequestParam (value = "currentPage",defaultValue = "1") int currentPage,
			@SessionAttribute String userKey)
	{
		ModelAndView mview = new ModelAndView();
		
		//페이징처리에 필요한 변수
		int totalPage; //총 페이지수
		int startPage; //각블럭의 시작페이지
		int endPage; //각블럭의 끝페이지
		int start; //각페이지의 시작번호..한페이지에서 보여질 시작 글 번호(인덱스에서 보여지는 번호)
		int perPage=3; //한페이지에 보여질 글 갯수
		int perBlock=3; //한블럭당 보여지는 페이지 개수
		int totalCount = Amapper.getScrapWriteCount(userKey);
		
		//총페이지 개수구하기
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
											
		//각블럭의 시작페이지
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
										
		if(endPage>totalPage)
			endPage=totalPage;
								
		//각페이지에서 불러올 시작번호
		start=(currentPage-1)*perPage;

		//데이타 가져오기..map처리
		HashMap<String, Object> map = new HashMap<>();
		map.put("userKey", userKey);
		map.put("start", start);
		map.put("perPage", perPage);

		//출력에 필요한 변수들을 request 에 저장
		mview.addObject("startPage",startPage);
		mview.addObject("endPage",endPage);
		mview.addObject("totalPage",totalPage);
		mview.addObject("totalCount",totalCount);
		mview.addObject("currentPage",currentPage);
		mview.addObject("totalCount",totalCount);
		
		//스크랩 얻기
		List<MarketDto> scraplist = Amapper.ScrapMarketDatas(userKey);
		mview.addObject("scraplist",scraplist);
		//나의작성목록 dto 얻기(우선 스크랩 대체)
		List<CommunityDto> clist = Amapper.ScrapWriteDatas(map);
		mview.addObject("clist", clist);
		
		//포워딩
		mview.setViewName("a/activity/activity_myScrap");
		
		return mview; 
	}

}
