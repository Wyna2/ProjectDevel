package com.ruby.devel.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ruby.devel.model.CommunityCommentDto;
import com.ruby.devel.model.CommunityDto;
import com.ruby.devel.model.CommunityScrapDto;
import com.ruby.devel.service.impl.CommunityCommentMapper;
import com.ruby.devel.service.impl.CommunityMapper;
import com.ruby.devel.service.impl.MemberMapper;



@Controller
public class CommunityController {
	
	@Autowired
	CommunityMapper Cmapper;
	
	@Autowired
	MemberMapper Mmapper;
	
	@Autowired
	CommunityCommentMapper CMmapper;
	
	@GetMapping("/community")  // 메뉴 선택 시 이동하는 기본 페이지
	public ModelAndView main(
			@RequestParam (value = "currentPage",defaultValue = "1") int currentPage) 
	{
		
		ModelAndView mview=new ModelAndView();
		int totalCount=Cmapper.getTotalCount(); //총 글의 수
		
		// 페이징처리에 필요한 변수
	      int totalPage; // 총 페이지수
	      int startPage; // 각블럭의 시작페이지
	      int endPage; // 각블럭의 끝페이지
	      int start; // 각페이지의 시작번호
	      int perPage = 9; // 한페이지에 보여질 글 갯수
	      int perBlock = 5; // 한블럭당 보여지는 페이지 개수

	      // 총페이지 개수구하기
	      totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

	      // 각블럭의 시작페이지
	      // 예:현재페이지가 3인경우 startpage=1,endpage= 5
	      // 현재페이지가 6인경우 startpage=6,endpage= 10
	      startPage = (currentPage - 1) / perBlock * perBlock + 1;
	      endPage = startPage + perBlock - 1;

	      // 만약 총페이지가 8 -2번째블럭: 6-10 ..이럴경우는 endpage가 8로 수정되어야함
	      if (endPage > totalPage)
	         endPage = totalPage;

	      // 각페이지에서 불러올 시작번호
	      start = (currentPage - 1) * perPage;

	      // service 안 넣을 경우
	      // 데이타 가져오기..map처리
	      HashMap<String, Integer> map = new HashMap<>();
	      map.put("start", start);
	      map.put("perPage", perPage);

	    //리스트 출력
	      List<CommunityDto> list = Cmapper.getList(map);
		
	    //list에 각글에 대하 작성자 추가하기..board db에 작성자 안넣으므로
			for(CommunityDto c:list)
			{
				String nickName = Mmapper.getNickname(c.getMember_idx());
				c.setWriter(nickName);
				String teamName = Mmapper.getMemberTeamName(c.getMember_idx());
				c.setTeam_name(teamName);
				String teamColor = Mmapper.getMemberTeamColor(c.getMember_idx());
				c.setTeam_color(teamColor);
				
				c.setMcount(CMmapper.getAllComments(c.getCommunity_idx()).size());
			} 
	      // 각 글앞에 붙일 시작번호 구하기
	      // 총글이 20개면? 1페이지 20 2페이지 15부터 출력해서 1씩 감소
	      int no = totalCount - (currentPage - 1) * perPage;

	      // 출력에 필요한 변수들을 request 에 저장
	      mview.addObject("list", list);
	      mview.addObject("startPage", startPage);
	      mview.addObject("endPage", endPage);
	      mview.addObject("totalPage", totalPage);
	      mview.addObject("totalCount", totalCount);
	      mview.addObject("no", no);
	      mview.addObject("currentPage", currentPage);
	      mview.addObject("totalCount", totalCount);
	      
	      
	      //작성자 이름, 닉네임 갖고오기
	      String nickName=Mmapper.getNickname(null);
		
	    mview.addObject("nickName", nickName); 
	    
	    /* scrap */
	    List<CommunityScrapDto> scraplist = Cmapper.getScrapDatas();
	    mview.addObject("scraplist",scraplist);
	    
	    //추천게시글 갖고오기
	    List<CommunityDto> b_list= Cmapper.bestList();
	    
	    //최신 qna 갖고오기
	    List<CommunityDto> r_list=Cmapper.recentList();
	    
		mview.addObject("r_list", r_list);
	    mview.addObject("b_list", b_list);
	    
	    
	    mview.setViewName("/community/community_main");
		
		return mview;
	}
	
	//일반 게시글 출력 페이지
	@GetMapping("/community_n")  
	public ModelAndView main_n(
			@RequestParam (value = "currentPage",defaultValue = "1") int currentPage) 
	{
		
		ModelAndView mview=new ModelAndView();
		int totalCount=Cmapper.getTotalCount(); //총 글의 수
		
		// 페이징처리에 필요한 변수
	      int totalPage; // 총 페이지수
	      int startPage; // 각블럭의 시작페이지
	      int endPage; // 각블럭의 끝페이지
	      int start; // 각페이지의 시작번호
	      int perPage = 9; // 한페이지에 보여질 글 갯수
	      int perBlock = 5; // 한블럭당 보여지는 페이지 개수

	      // 총페이지 개수구하기
	      totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

	      // 각블럭의 시작페이지
	      // 예:현재페이지가 3인경우 startpage=1,endpage= 5
	      // 현재페이지가 6인경우 startpage=6,endpage= 10
	      startPage = (currentPage - 1) / perBlock * perBlock + 1;
	      endPage = startPage + perBlock - 1;

	      // 만약 총페이지가 8 -2번째블럭: 6-10 ..이럴경우는 endpage가 8로 수정되어야함
	      if (endPage > totalPage)
	         endPage = totalPage;

	      // 각페이지에서 불러올 시작번호
	      start = (currentPage - 1) * perPage;

	      // service 안 넣을 경우
	      // 데이타 가져오기..map처리
	      HashMap<String, Integer> map = new HashMap<>();
	      map.put("start", start);
	      map.put("perPage", perPage);

	    //리스트 출력
	      List<CommunityDto> list = Cmapper.getList_normal(map);
		
	    //list에 각글에 대하 작성자 추가하기..board db에 작성자 안넣으므로
	      for(CommunityDto c:list)
			{
				String nickName = Mmapper.getNickname(c.getMember_idx());
				c.setWriter(nickName);
				String teamName = Mmapper.getMemberTeamName(c.getMember_idx());
				c.setTeam_name(teamName);
				String teamColor = Mmapper.getMemberTeamColor(c.getMember_idx());
				c.setTeam_color(teamColor);
				
				c.setMcount(CMmapper.getAllComments(c.getCommunity_idx()).size());
			} 
	      
	      // 각 글앞에 붙일 시작번호 구하기
	      // 총글이 20개면? 1페이지 20 2페이지 15부터 출력해서 1씩 감소
	      int no = totalCount - (currentPage - 1) * perPage;

	      // 출력에 필요한 변수들을 request 에 저장
	      mview.addObject("list", list);
	      mview.addObject("startPage", startPage);
	      mview.addObject("endPage", endPage);
	      mview.addObject("totalPage", totalPage);
	      mview.addObject("totalCount", totalCount);
	      mview.addObject("no", no);
	      mview.addObject("currentPage", currentPage);
	      mview.addObject("totalCount", totalCount);
	      
	      
	      //작성자 이름, 닉네임 갖고오기
	      String nickName=Mmapper.getNickname(null);
		
	    mview.addObject("nickName", nickName); 
	    
	    //추천게시글 갖고오기
	    List<CommunityDto> b_list= Cmapper.bestList();
	    
	    //최신 qna 갖고오기
	    List<CommunityDto> r_list=Cmapper.recentList();
	    
		mview.addObject("r_list", r_list);
	    mview.addObject("b_list", b_list);
	    
	    /* scrap */
	    List<CommunityScrapDto> scraplist = Cmapper.getScrapDatas();
	    mview.addObject("scraplist",scraplist);
	    
	    
	    mview.setViewName("/community/community_main");
		
		return mview;
	}
	
	//qna글 출력 페이지
	@GetMapping("/community_q")  
	public ModelAndView main_q(
			@RequestParam (value = "currentPage",defaultValue = "1") int currentPage) 
	{
		
		ModelAndView mview=new ModelAndView();
		int totalCount=Cmapper.getTotalCount(); //총 글의 수
		
		// 페이징처리에 필요한 변수
	      int totalPage; // 총 페이지수
	      int startPage; // 각블럭의 시작페이지
	      int endPage; // 각블럭의 끝페이지
	      int start; // 각페이지의 시작번호
	      int perPage = 9; // 한페이지에 보여질 글 갯수
	      int perBlock = 5; // 한블럭당 보여지는 페이지 개수

	      // 총페이지 개수구하기
	      totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

	      // 각블럭의 시작페이지
	      // 예:현재페이지가 3인경우 startpage=1,endpage= 5
	      // 현재페이지가 6인경우 startpage=6,endpage= 10
	      startPage = (currentPage - 1) / perBlock * perBlock + 1;
	      endPage = startPage + perBlock - 1;

	      // 만약 총페이지가 8 -2번째블럭: 6-10 ..이럴경우는 endpage가 8로 수정되어야함
	      if (endPage > totalPage)
	         endPage = totalPage;

	      // 각페이지에서 불러올 시작번호
	      start = (currentPage - 1) * perPage;

	      // service 안 넣을 경우
	      // 데이타 가져오기..map처리
	      HashMap<String, Integer> map = new HashMap<>();
	      map.put("start", start);
	      map.put("perPage", perPage);

	    //리스트 출력
	      List<CommunityDto> list = Cmapper.getList_qna(map);
		
	    //list에 각글에 대하 작성자 추가하기..board db에 작성자 안넣으므로
	      for(CommunityDto c:list)
			{
				String nickName = Mmapper.getNickname(c.getMember_idx());
				c.setWriter(nickName);
				String teamName = Mmapper.getMemberTeamName(c.getMember_idx());
				c.setTeam_name(teamName);
				String teamColor = Mmapper.getMemberTeamColor(c.getMember_idx());
				c.setTeam_color(teamColor);
				
				c.setMcount(CMmapper.getAllComments(c.getCommunity_idx()).size());
			} 
	      
	      // 각 글앞에 붙일 시작번호 구하기
	      // 총글이 20개면? 1페이지 20 2페이지 15부터 출력해서 1씩 감소
	      int no = totalCount - (currentPage - 1) * perPage;

	      // 출력에 필요한 변수들을 request 에 저장
	      mview.addObject("list", list);
	      mview.addObject("startPage", startPage);
	      mview.addObject("endPage", endPage);
	      mview.addObject("totalPage", totalPage);
	      mview.addObject("totalCount", totalCount);
	      mview.addObject("no", no);
	      mview.addObject("currentPage", currentPage);
	      mview.addObject("totalCount", totalCount);
	      
	      
	      //작성자 이름, 닉네임 갖고오기
	      String nickName=Mmapper.getNickname(null);
		
	    mview.addObject("nickName", nickName); 
	      
	    //추천게시글 갖고오기
	    List<CommunityDto> b_list= Cmapper.bestList();
	    
	    //최신 qna 갖고오기
	    List<CommunityDto> r_list=Cmapper.recentList();
	    
		mview.addObject("r_list", r_list);
	    mview.addObject("b_list", b_list);
	    
	    /* scrap */
	    List<CommunityScrapDto> scraplist = Cmapper.getScrapDatas();
	    mview.addObject("scraplist",scraplist);
	    
	    mview.setViewName("/community/community_main");
		
		return mview;
	}
	

	//insert
	@PostMapping("/community/insert") //매핑주소 수정필요
	public String insert(@ModelAttribute CommunityDto c_dto, 
			@RequestParam ArrayList<MultipartFile> upload, 
			HttpSession session ) {	
		//업로드 경로
		String path=session.getServletContext().getRealPath("/communityimage");	
				
		//포토명 구해서 넣기
		String communityimage="";

		//첫번째가 빈 문자열이면
		if(upload.get(0).getOriginalFilename().equals("")) {
			communityimage="no";
		}else {
			for(MultipartFile f:upload) {
				String fName=f.getOriginalFilename();
				communityimage +=fName+",";
				
				try {
					f.transferTo(new File(path+"\\"+fName));
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}		
			communityimage=communityimage.substring(0, communityimage.length()-1);		
		}
		c_dto.setPhoto(communityimage);
		//insert
		Cmapper.insertCommunity(c_dto);
		
		return "redirect:";
	}

	// 게시글 상세 페이지	
	@GetMapping("/community/contentdetail") 
	public ModelAndView community_contentdetail(
			@RequestParam String community_idx, 
			@RequestParam (value = "currentPage",defaultValue = "1") int currentPage,
			@RequestParam (value = "c_currentPage",defaultValue = "1") int c_currentPage,
			HttpSession session
			
			)
	{
		
		session.setAttribute("c_currentPage", c_currentPage);
		
		ModelAndView mview =new ModelAndView();
		
		//조회수 증가
		Cmapper.updateReadCount(community_idx);

		//idx에 해당 dto 얻기
		CommunityDto c_dto= Cmapper.getData(community_idx);
		
		c_dto.setMcount(CMmapper.getAllComments(c_dto.getCommunity_idx()).size());
		//의 name에 작성자 닉네임 넣기
		String writer = Mmapper.getNickname(c_dto.getMember_idx());
		String teamName = Mmapper.getMemberTeamName(c_dto.getMember_idx());
		String teamColor = Mmapper.getMemberTeamColor(c_dto.getMember_idx());
	
		mview.addObject("c_dto", c_dto);
		mview.addObject("writer", writer);
		mview.addObject("teamName", teamName);
		mview.addObject("teamColor", teamColor);
		mview.addObject("currentPage", currentPage);
		
		/* like */
		List<CommunityScrapDto> scraplist = Cmapper.getScrapDatas();
		mview.addObject("scraplist",scraplist);

		//포워드 
		mview.setViewName("/community/community_contentDetail");
		
		return mview;
	}	
	
		//게시글 삭제
		@GetMapping("/community/del_content")
		public String delete(
				@RequestParam String community_idx,
				@RequestParam String currentPage,
				HttpSession session)
		{
			
			//업로드 할 폴더 지정
			String path = session.getServletContext().getRealPath("/communityimage");
			System.out.println(path);		
			
			//업로드된 파일명 구하기
			String uploadfile = Cmapper.getData(community_idx).getPhoto();
			
			//파일객체 생성
			File file = new File(path+"\\"+uploadfile);
			
			//해당 파일 삭제
			file.delete();
			
			//DB 삭제
			Cmapper.deleteCommunity(community_idx);
			return "redirect:?currentPage="+currentPage;
		}
	
		//updateform
		@GetMapping("/community/update_content")
		public ModelAndView updateform(
				@RequestParam String community_idx,
				@RequestParam String currentPage)
		{
			ModelAndView model = new ModelAndView();
			CommunityDto c_dto = Cmapper.getData(community_idx);
			model.addObject("c_dto", c_dto);
			model.addObject("currentPage", currentPage);
			model.setViewName("/community/community_contentUpdateForm");
			
			return model;
		}
		
		//update
		@PostMapping("/community/update")
		public String update(
				@ModelAttribute CommunityDto c_dto,
				@RequestParam String currentPage,
				HttpSession session)
		{
			
			//업로드 할 폴더 지정
			String path = session.getServletContext().getRealPath("/photo");
			
			//업로드 안하면 no라고 db에 저장
			if(c_dto.getUpload().getOriginalFilename().equals(""))
				c_dto.setPhoto("no"); //db에 no로 저장
			else {
				String photo = c_dto.getUpload().getOriginalFilename();
				c_dto.setPhoto(photo);
				
				//실제 업로드
				try {
					c_dto.getUpload().transferTo(new File(path+"\\"+photo));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
			
			//세션에서 아이디를 얻어서 dto에 저장(반드시 필요)
			String myid=(String)session.getAttribute("myid");
			c_dto.setMember_idx(myid); //db에 저장
			
			//update
			Cmapper.updateCommunity(c_dto);
			
			//update에서 해당 content로 가기
			return "redirect:contentdetail?community_idx="+c_dto.getCommunity_idx()+"&currentPage="+currentPage;
		}
		  
		//추천수 증가
		@PostMapping("/community/likecount")
		@ResponseBody
		public int recommend(@RequestParam String community_idx) {
			
			HashMap<String, Integer> hashMap= new HashMap<>();
			Cmapper.updateLikeCount(community_idx);
			/* CommunityDto c_dto=new CommunityDto(); */
			int like_cnt=Cmapper.getData(community_idx).getLike_count();
			hashMap.put("like_cnt", like_cnt);
			
			return like_cnt;

		}
		
		//qna 타입 +1 증가 (채택글인지 아닌지 확인용)
		@PostMapping("/community/answerchoose")
		@ResponseBody
		public void answerChoose(
				@RequestParam String community_idx,
				@RequestParam String community_comment_idx) {
			
			Cmapper.updateQnaType(community_idx);
			CMmapper.answerChoose(community_comment_idx);
			
		}
		
	
		//scrap 이벤트..main
		   @PostMapping("/communityscrap.event")
		   public ModelAndView communityscrap(
		         @RequestParam(value="community_idx", required=false) String community_idx,
		         @RequestParam(value="scrap_count", required=false) String scrap_count,
		         @SessionAttribute String userKey,
		         HttpSession session)
		   {
		      ModelAndView mview = new ModelAndView();
		      
		      HashMap<String, String> map = new HashMap<>();
		      map.put("community_idx", community_idx);
		      map.put("member_idx", userKey);
		      map.put("scrap_count", scrap_count);
		      
		      //data 존재하는지 확인(1일 경우 데이타 있음)
		      int data = Cmapper.getScrapData(map);
		            
		      CommunityScrapDto cs_dto = new CommunityScrapDto();
		      cs_dto.setCommunity_idx(community_idx);
		      cs_dto.setMember_idx(userKey);
		      cs_dto.setScrap_count(scrap_count);
		      
		      if(data==0) {
		         Cmapper.insertCommunityScrap(cs_dto);
		         System.out.println("insert");
		      } else if(data==1) {
		         Cmapper.updateCommunityScrap(cs_dto);
		         System.out.println("update");
		      }
		      
		      System.out.println("community_idx: "+community_idx+", member_idx: "+userKey);
		      System.out.println("cs_dto: "+cs_dto);
		      System.out.println("map: "+map);
		      
		      return mview;
		   }
		
		   
	  //scrap 이벤트..datail
		@PostMapping("/community/communityScrapDetail.event")
		public ModelAndView CommunityScrapDetail(
				@RequestParam(value="community_idx", required=false) String community_idx,
				@RequestParam(value="scrap_count", required=false) String scrap_count,
				@SessionAttribute String userKey,
				HttpSession session)
		{
			System.out.println("확인");
				
			ModelAndView mview = new ModelAndView();
				
			HashMap<String, String> map = new HashMap<>();
			map.put("community_idx", community_idx);
			map.put("member_idx", userKey);
			map.put("scrap_count", scrap_count);
				
				//data 존재하는지 확인(1일 경우 데이타 있음)
			int data = Cmapper.getScrapData(map);
						
			CommunityScrapDto c_dto = new CommunityScrapDto();
			c_dto.setCommunity_idx(community_idx);
			c_dto.setMember_idx(userKey);
			c_dto.setScrap_count(scrap_count);
				
			if(data==0) {
				Cmapper.insertCommunityScrap(c_dto);
				System.out.println("insert");
			} else if(data==1) {
				Cmapper.updateCommunityScrap(c_dto);
				System.out.println("update");
			}
			
			System.out.println("community_idx: "+community_idx+", member_idx: "+userKey);
			System.out.println("map: "+map);
				
			return mview;
		}	   
		   
	// 디테일페이지 댓글 페이징 처리
	@GetMapping("/community/contentdetailcomment")
	@ResponseBody
	public ModelAndView contentDetailComment(
			@RequestParam (value = "c_currentPage",defaultValue = "1") int c_currentPage,
			@RequestParam String community_idx,
			@RequestParam int content_type,
			HttpSession session)
	{
		session.setAttribute("c_currentPage", c_currentPage);
		ModelAndView mview = new ModelAndView();
		int totalCount = CMmapper.getTotalCount(community_idx);
		
		//페이징처리에 필요한 변수
		int totalPage; //총 페이지수
		int startPage; //각블럭의 시작페이지
		int endPage; //각블럭의 끝페이지
		int start; //각페이지의 시작번호..한페이지에서 보여질 시작 글 번호(인덱스에서 보여지는 번호)
		int perPage=0;
		int perBlock=0;
		
		if(content_type==0) {
			perPage=5; //한페이지에 보여질 글 갯수
			perBlock=3; //한블럭당 보여지는 페이지 개수
		} else {
			perPage=3; //한페이지에 보여질 글 갯수
			perBlock=3; //한블럭당 보여지는 페이지 개수
		}
		
		
		//총페이지 개수구하기
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
											
		//각블럭의 시작페이지
		startPage=(c_currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
											
		if(endPage>totalPage)
			endPage=totalPage;
								
		//각페이지에서 불러올 시작번호
		start=(c_currentPage-1)*perPage;
		
		//데이터 가져오기
		HashMap<String, Object> map = new HashMap<>();
		map.put("community_idx", community_idx);
		map.put("start", start);
		map.put("perPage", perPage);
				
		//각페이지에서 필요한 게시글 가져오기
		List<CommunityCommentDto> commentlist=CMmapper.getAllCommentsList(map);
		
		for(CommunityCommentDto c:commentlist) {
			c.setComment_writer(Mmapper.getNickname(c.getMember_idx()));
		}
		
		int no=totalCount-(c_currentPage-1)*perPage;
		
		//출력에 필요한 변수 저장
		mview.addObject("commentlist",commentlist);
		mview.addObject("startPage",startPage);
		mview.addObject("endPage",endPage);
		mview.addObject("totalPage",totalPage);
		mview.addObject("totalCount",totalCount);
		mview.addObject("no",no);
		mview.addObject("c_currentPage",c_currentPage);
		mview.addObject("totalCount",totalCount);
		
		
		
		mview.setViewName("jsonView");
		return mview;
	}
	
	
	//검색어 입력
	   @GetMapping("/community/search")
	   public ModelAndView CommunitySearch(
	         @RequestParam (value = "currentPage",defaultValue = "1") int currentPage,
	         @RequestParam(value = "SearchText",required = false) String SearchText,
	         HttpSession session)
	   {
	      session.setAttribute("SearchText", SearchText);
	      ModelAndView mview = new ModelAndView();
	      int totalCount=Cmapper.getSearchCount(SearchText);
	      
	      //페이징처리에 필요한 변수
	      int totalPage; //총 페이지수
	      int startPage; //각블럭의 시작페이지
	      int endPage; //각블럭의 끝페이지
	      int start; //각페이지의 시작번호..한페이지에서 보여질 시작 글 번호(인덱스에서 보여지는 번호)
	      int perPage=8; //한페이지에 보여질 글 갯수
	      int perBlock=2; //한블럭당 보여지는 페이지 개수
	      
	      //총페이지 개수구하기
	      totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
	                           
	      //각블럭의 시작페이지
	      startPage=(currentPage-1)/perBlock*perBlock+1;
	      endPage=startPage+perBlock-1;
	                           
	      if(endPage>totalPage)
	         endPage=totalPage;
	                  
	      //각페이지에서 불러올 시작번호
	      start=(currentPage-1)*perPage;
	      
	      HashMap<String, Integer> map = new HashMap<>();
	      map.put("start", start);
	      map.put("perPage", perPage);
		          
	      //데이터 가져오기
	      HashMap<String, Object> map2 = new HashMap<>();
	      map2.put("SearchText", SearchText);
	      map2.put("start", start);
	      map2.put("perPage", perPage);
	     
	      
	      //각페이지에서 필요한 게시글 가져오기
	      List<CommunityDto> Searchlist=Cmapper.SearchGetList(map2);
	      
	      for(CommunityDto c:Searchlist)
			{
				String nickName = Mmapper.getNickname(c.getMember_idx());
				c.setWriter(nickName);
				
				c.setMcount(CMmapper.getAllComments(c.getCommunity_idx()).size());

			} 
			
			//작성자 이름, 닉네임 갖고오기
			
		      String nickName=Mmapper.getNickname(null);
	      
	      //추천게시글 갖고오기
		  List<CommunityDto> b_list= Cmapper.bestList();
		  
		  //최신 qna 갖고오기
		  List<CommunityDto> r_list=Cmapper.recentList();   
	      
	      //총글이 20개면? 1페이지 20 2페이지 15부터 출력해서 1씩 감소
	      int no=totalCount-(currentPage-1)*perPage;
	      
	      //출력에 필요한 변수들 request 저장
	      mview.addObject("r_list", r_list);
		  mview.addObject("b_list", b_list);
	      mview.addObject("Searchlist",Searchlist);
	      mview.addObject("startPage",startPage);
	      mview.addObject("endPage",endPage);
	      mview.addObject("totalPage",totalPage);
	      mview.addObject("totalCount",totalCount);
	      mview.addObject("no",no);
	      mview.addObject("currentPage",currentPage);
	      mview.addObject("nickName", nickName); 
	      mview.addObject("totalCount",totalCount);
	      
	      
	      mview.setViewName("/community/community_searchresult");
	      
	         
	      return mview;
	   }
	
	@GetMapping("/community/contentadd")  // 글쓰기 페이지
	public String community_contentadd()
	{
		return "/community/community_contentAddForm";
	}
	

}
