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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ruby.devel.model.MarketDto;
import com.ruby.devel.model.MarketLikeDto;
import com.ruby.devel.model.MemberDto;
import com.ruby.devel.service.impl.MarketMapper;
import com.ruby.devel.service.impl.MemberMapper;


@Controller
public class MarketplaceController {
   
   @Autowired //Market 자동주입
   MarketMapper MPmapper;
   
   @Autowired //Member 자동주입
   MemberMapper Mmapper;

   
   //마켓 기본 페이지
   @GetMapping({"/marketplace","/marketplace/market_main"})
   public ModelAndView marketplace_home(
         @RequestParam (value = "currentPage",defaultValue = "1") int currentPage)
   {
      ModelAndView mview = new ModelAndView();
      
      /* 페이징 */
      int totalCount = MPmapper.getTotalCount();
      
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
                  
      //service 안 넣을 경우
      //데이타 가져오기..map처리
      HashMap<String, Integer> map = new HashMap<>();
      map.put("start", start);
      map.put("perPage", perPage);
                  
      //각페이지에서 필요한 게시글 가져오기
      List<MarketDto> list=MPmapper.getList(map);
      
      //각 글앞에 붙일 시작번호 구하기
      //총글이 20개면? 1페이지 20 2페이지 15부터 출력해서 1씩 감소
      int no=totalCount-(currentPage-1)*perPage;
                        
      //출력에 필요한 변수들을 request 에 저장
      mview.addObject("list",list);
      mview.addObject("startPage",startPage);
      mview.addObject("endPage",endPage);
      mview.addObject("totalPage",totalPage);
      mview.addObject("totalCount",totalCount);
      mview.addObject("no",no);
      mview.addObject("currentPage",currentPage);
      mview.addObject("totalCount",totalCount);
      
      /* like */
      List<MarketLikeDto> likelist = MPmapper.getLikeDatas();
      mview.addObject("likelist",likelist);
      
      mview.setViewName("m/marketplace/market_main");
            
      //System.out.println("totalCount ="+totalCount);
      
      return mview;
   }
   
   //마켓 검색후 테이블 테스트
   @GetMapping("/marketplace/searchtest")
   public ModelAndView search(
         @RequestParam (value = "currentPage",defaultValue = "1") int currentPage,
         @RequestParam(value = "SearchText",required = false) String SearchText,
         HttpSession session){
      
      session.setAttribute("SearchText", SearchText);
      ModelAndView mview = new ModelAndView();
      int totalCount=MPmapper.getSearchCount(SearchText);
      
      
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
      
      
      //데이터 가져오기
      HashMap<String, Object> map = new HashMap<>();
      map.put("SearchText", SearchText);
      map.put("start", start);
      map.put("perPage", perPage);
      
      
      //각페이지에서 필요한 게시글 가져오기
      List<MarketDto> Searchlist=MPmapper.SearchGetList(map);
      
      
      //총글이 20개면? 1페이지 20 2페이지 15부터 출력해서 1씩 감소
      int no=totalCount-(currentPage-1)*perPage;
      
      
      //출력에 필요한 변수들 request 저장
      mview.addObject("Searchlist",Searchlist);
      mview.addObject("startPage",startPage);
      mview.addObject("endPage",endPage);
      mview.addObject("totalPage",totalPage);
      mview.addObject("totalCount",totalCount);
      mview.addObject("no",no);
      mview.addObject("currentPage",currentPage);
            
      mview.addObject("totalCount",totalCount);
      
      
      mview.setViewName("/marketplace/market_searchresult");
      
      return mview;
   }
   
   //마켓 검색 후 테이블
   @GetMapping("/marketplace/search")
   public ModelAndView MarketPlaceSearch(
         @RequestParam (value = "currentPage",defaultValue = "1") int currentPage,
         @RequestParam(value = "SearchText",required = false) String SearchText,
         HttpSession session)
   {
      session.setAttribute("SearchText", SearchText);
      ModelAndView mview = new ModelAndView();
      int totalCount=MPmapper.getSearchCount(SearchText);
      
      
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
      
      //데이터 가져오기
      HashMap<String, Object> map = new HashMap<>();
      map.put("SearchText", SearchText);
      map.put("start", start);
      map.put("perPage", perPage);
      
      //각페이지에서 필요한 게시글 가져오기
      List<MarketDto> Searchlist=MPmapper.SearchGetList(map);
      
      //총글이 20개면? 1페이지 20 2페이지 15부터 출력해서 1씩 감소
      int no=totalCount-(currentPage-1)*perPage;
      
      //출력에 필요한 변수들 request 저장
      mview.addObject("Searchlist",Searchlist);
      mview.addObject("startPage",startPage);
      mview.addObject("endPage",endPage);
      mview.addObject("totalPage",totalPage);
      mview.addObject("totalCount",totalCount);
      mview.addObject("no",no);
      mview.addObject("currentPage",currentPage);
      
      mview.addObject("totalCount",totalCount);
      
      /* like */
      List<MarketLikeDto> likelist = MPmapper.getLikeDatas();
      mview.addObject("likelist",likelist);
      
      mview.setViewName("m/marketplace/market_searchresult");
      
         
      return mview;
   }
   
   
   //마켓 사이드메뉴 매핑
   @GetMapping("/marketplace/sidesearchtest")
   public ModelAndView MarketSideSearchText(
         @RequestParam (value = "currentPage", defaultValue = "1") int currentPage,
         @RequestParam (value = "subtitle",required = false) String subtitle,
         @RequestParam (value = "colorradio",required = false) String colorradio,
         @RequestParam (value = "marketprice",required = false) String marketprice,
         HttpSession session)
   {
      session.setAttribute("subtitle", subtitle);
      session.setAttribute("colorradio", colorradio);
      session.setAttribute("marketprice", marketprice);
      
      //System.out.println(colorradio);
      ModelAndView mview = new ModelAndView();
      
      
      int totalCount=MPmapper.getSideSearchCount(subtitle,colorradio,marketprice);
      
      
      ///페이징처리에 필요한 변수
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
      
      
      //데이터 가져오기
      HashMap<String, Object> map = new HashMap<>();
      map.put("subtitle",subtitle);
      map.put("colorradio", colorradio);
      map.put("marketprice", marketprice);
      map.put("start", start);
      map.put("perPage", perPage);
      
      
      //각 페이지에서 필요한 게시글 가져오기
      List<MarketDto> SideSearchlist=MPmapper.SideSearchGetList(map);
      
      //총글이 20개면? 1페이지 20 2페이지 15부터 출력해서 1씩 감소
      int no=totalCount-(currentPage-1)*perPage;
      
      //출력에 필요한 변수들 request 저장
      mview.addObject("SideSearchlist",SideSearchlist);
      mview.addObject("startPage",startPage);
      mview.addObject("endPage",endPage);
      mview.addObject("totalPage",totalPage);
      mview.addObject("totalCount",totalCount);
      mview.addObject("no",no);
      mview.addObject("currentPage",currentPage);
      mview.addObject("totalCount",totalCount);
      
      /* like */
      List<MarketLikeDto> likelist = MPmapper.getLikeDatas();
      mview.addObject("likelist",likelist);
        
      mview.setViewName("m/marketplace/market_sidesearchresult");
        
      return mview;
   }
   
     //마켓 사이드메뉴 검색
     @GetMapping("/marketplace/sidesearch")
     public ModelAndView MarketSideSearch(
     
     @RequestParam (value = "currentPage", defaultValue = "1") int currentPage,
    
     @RequestParam (value = "subtitle",required = false) String subtitle,
     
     @RequestParam (value = "colorradio",required = false) String colorradio,
     
     @RequestParam (value = "marketprice",required = false) String marketprice,
     HttpSession session) 
     { 
        session.setAttribute("subtitle", subtitle);
        session.setAttribute("colorradio", colorradio);
        session.setAttribute("marketprice", marketprice);
     
        ModelAndView mview = new ModelAndView();
     
        int totalCount=MPmapper.getSideSearchCount(subtitle, colorradio,marketprice);
        
        ///페이징처리에 필요한 변수
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
       
        
        
       
        //데이터 가져오기
        HashMap<String, Object> map = new HashMap<>();
        map.put("subtitle",subtitle);
        map.put("colorradio", colorradio);
        map.put("marketprice", marketprice);
        map.put("start", start);
        map.put("perPage", perPage);
        
        //각 페이지에서 필요한 게시글 가져오기
        List<MarketDto> SideSearchlist=MPmapper.SideSearchGetList(map);
        
        //총글이 20개면? 1페이지 20 2페이지 15부터 출력해서 1씩 감소
        int no=totalCount-(currentPage-1)*perPage;
        
        
        //출력에 필요한 변수들 request 저장
        mview.addObject("SideSearchlist",SideSearchlist);
        mview.addObject("startPage",startPage);
        mview.addObject("endPage",endPage);
        mview.addObject("totalPage",totalPage);
        mview.addObject("totalCount",totalCount);
        mview.addObject("no",no);
        mview.addObject("currentPage",currentPage);
        mview.addObject("totalCount",totalCount);
        
        /* like */
        List<MarketLikeDto> likelist = MPmapper.getLikeDatas();
        mview.addObject("likelist",likelist);
        
        mview.setViewName("m/marketplace/market_sidesearchresult");
        
        return mview;
    }
    
   
    
   //상품등록 페이지 mapping
   @GetMapping("/marketplace/productadd")
   public String marketplace_productadd() {
      return "/marketplace/market_productAddForm";
   }
   
   //상품등록 insert
   @PostMapping("/marketplace/insert")
   public String insert(
         HttpSession session,
         @RequestParam ArrayList<MultipartFile> photos,
         @ModelAttribute MarketDto dto)
   {
      
      //이미지 저장 경로
      String path = session.getServletContext().getRealPath("/photo"); //webapp/photo 에 바로 넣기
      System.out.println(path);
      
      String photo="";
      if(photos.get(0).getOriginalFilename().equals("")) //첫번째가 빈 문자열이면
         photo="no";
      else {
         for(MultipartFile f:photos)
         {
            String fName = f.getOriginalFilename();
            photo += fName+","; //photo에 fName을 누적
            
            try {
               f.transferTo(new File(path+"\\"+fName));
            } catch (IllegalStateException | IOException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
         }
         
         photo = photo.substring(0, photo.length()-1);
      }
      
      dto.setPhoto(photo);
      
      //insert
      MPmapper.insertMarket(dto);
            
      //완료 후 목록 이동
      return "redirect:market_main";
   }

   
   //상품 상세페이지
   @GetMapping("/marketplace/productdetail")
   public ModelAndView marketplace_productdetail(
         @RequestParam String market_place_idx,
         @RequestParam int currentPage,
         @RequestParam (value = "colorradio",required = false) String colorradio,
         @RequestParam(value = "SearchText",required = false) String SearchText,
         @RequestParam(value = "checkall",required = false) String checkall,
         @RequestParam(value = "checksearch",required = false) String checksearch,
         @RequestParam(value = "checkside",required = false) String checkside,
         HttpSession session)
   {
      session.setAttribute("SearchText", SearchText);
      session.setAttribute("colorradio", colorradio);
      session.setAttribute("checkall", checkall);
      session.setAttribute("checksearch", checksearch);
      session.setAttribute("checkside", checkside);
      
      ModelAndView mview = new ModelAndView();
      
      List<MarketDto> list = MPmapper.getAllDatas();
      List<MarketDto> randomlist = MPmapper.getRandomlist();
   
      
      //idx에 해당하는 dto 얻기
      MarketDto dto = MPmapper.getData(market_place_idx);
      mview.addObject("dto", dto);
      mview.addObject("currentPage",currentPage);
      mview.addObject("list", list);
      mview.addObject("randomlist",randomlist);
             
      /* like */
      List<MarketLikeDto> likelist = MPmapper.getLikeDatas();
      mview.addObject("likelist",likelist);
      System.out.println(likelist);      
      
       //dto의 name에 작성자 이름 넣기
      String seller = Mmapper.getName(dto.getMember_idx());
       dto.setSeller(seller);
      System.out.println(seller);
      
      //포워드
      mview.setViewName("/marketplace/market_productDetail");
      
      return mview;
   }
   
   //거래 가능 상품페이지
   @GetMapping("/marketplace/market_tradeable")
   public String tradeable()
   {
      return "m/marketplace/market_tradeable";
   }
   
   //거래가능 상품페이지 매핑
   @GetMapping("/marketplace/market_tradeabletest")
   public ModelAndView marketplaceTrade(
         @RequestParam (value = "currentPage",defaultValue = "1") int currentPage)
   {
      ModelAndView mview = new ModelAndView();
      
      int totalCount = MPmapper.getTradeCount();
      
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
       
       //각페이지에서 필요한 게시글 가져오기
       HashMap<String, Integer> map = new HashMap<>();
       map.put("start", start);
       map.put("perPage", perPage);
      
       List<MarketDto> Tradelist=MPmapper.getTradeList(map);
       
       //총글이 20개면? 1페이지 20 2페이지 15부터 출력해서 1씩 감소
       int no=totalCount-(currentPage-1)*perPage;
       
       //출력에 필요한 변수들 request에 저장
       mview.addObject("Tradelist",Tradelist);
       mview.addObject("startPage",startPage);
       mview.addObject("endPage",endPage);
       mview.addObject("totalPage",totalPage);
       mview.addObject("totalCount",totalCount);
       mview.addObject("no",no);
       mview.addObject("currentPage",currentPage);
       mview.addObject("totalCount",totalCount);
       
       /* like */
      List<MarketLikeDto> likelist = MPmapper.getLikeDatas();
      mview.addObject("likelist",likelist);
       
       mview.setViewName("m/marketplace/market_tradeable");
      
      return mview;
   }
   
   
   //거래 가능 검색기능 사용 후
   @GetMapping("/marketplace/market_tradeablesearch")
   public String tradeableSearch()
   {
      return "m/marketplace/market_tradeable_search";
   }
   
   //거래 가능 검색기능 사용 후 매핑
   @GetMapping("/marketplace/market_tradeablesearchtest")
   public ModelAndView marketplaceTradeSearch(
         @RequestParam (value = "currentPage",defaultValue = "1") int currentPage,
         @RequestParam (value = "SearchText", required = false) String SearchText,
         HttpSession session)
   {
      session.setAttribute("SearchText", SearchText);
      ModelAndView mview = new ModelAndView();
      int totalCount=MPmapper.getTradeSearchCount(SearchText);
      
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
      
      //데이터 가져오기
      HashMap<String, Object> map = new HashMap<>();
      map.put("SearchText", SearchText);
      map.put("start", start);
      map.put("perPage", perPage);
      
      //각페이지에서 필요한 게시글 가져오기
      List<MarketDto> tradeSearchList=MPmapper.getTradeSearchList(map);
      
      //총글이 20개면? 1페이지 20 2페이지 15부터 출력해서 1씩 감소
      int no=totalCount-(currentPage-1)*perPage;
      
      //출력에 필요한 변수들 request 저장
      mview.addObject("tradeSearchList",tradeSearchList);
      mview.addObject("startPage",startPage);
      mview.addObject("endPage",endPage);
      mview.addObject("totalPage",totalPage);
      mview.addObject("totalCount",totalCount);
      mview.addObject("no",no);
      mview.addObject("currentPage",currentPage);
               
      mview.addObject("totalCount",totalCount);
      
      /* like */
      List<MarketLikeDto> likelist = MPmapper.getLikeDatas();
      mview.addObject("likelist",likelist);
      
      
      mview.setViewName("m/marketplace/market_tradeable_search");
      
      return mview;
   }
   
   
   //거래 가능 사이드메뉴 검색 사용 후
   @GetMapping("/marketplace/market_tradeableside")
   public String tradeableSide()
   {
         return "m/marketplace/market_tradeable_side";
   }
   
   @GetMapping("/marketplace/market_tradeablesidetest")
   public ModelAndView marketplaceTradeSide(
         @RequestParam (value = "currentPage", defaultValue = "1") int currentPage,
         @RequestParam (value = "subtitle",required = false) String subtitle,
         @RequestParam (value = "colorradio",required = false) String colorradio,
         @RequestParam (value = "marketprice",required = false) String marketprice,
         HttpSession session)
   {
      session.setAttribute("subtitle", subtitle);
      session.setAttribute("colorradio", colorradio);
      session.setAttribute("marketprice", marketprice);
      
      
      ModelAndView mview = new ModelAndView();
      
      int totalCount = MPmapper.getTradeSideCount(subtitle, colorradio, marketprice);
      
      ///페이징처리에 필요한 변수
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
      
      //데이터 가져오기
      HashMap<String, Object> map = new HashMap<>();
      map.put("subtitle", subtitle);
      map.put("colorradio", colorradio);
      map.put("marketprice", marketprice);
      map.put("start", start);
      map.put("perPage", perPage);
      
      //각 페이지 필요한 글 가져오기
      List<MarketDto> TradeSideList=MPmapper.getTradeSideList(map);
      
      //총글이 20개면? 1페이지 20 2페이지 15부터 출력해서 1씩 감소
      int no=totalCount-(currentPage-1)*perPage;
      
      //출력에 필요한 변수 저장
      mview.addObject("TradeSideList",TradeSideList);
      mview.addObject("startPage",startPage);
      mview.addObject("endPage",endPage);
      mview.addObject("totalPage",totalPage);
      mview.addObject("totalCount",totalCount);
      mview.addObject("no",no);
      mview.addObject("currentPage",currentPage);
      mview.addObject("totalCount",totalCount);
      
      /* like */
      List<MarketLikeDto> likelist = MPmapper.getLikeDatas();
      mview.addObject("likelist",likelist);
      
      mview.setViewName("m/marketplace/market_tradeable_side");
      
      return mview;
   }
   
   
}