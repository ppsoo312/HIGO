package com.increpas.higo;

import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.higo.gosu.GosuService;
import com.higo.gosu.GosuVO;
import com.higo.local.LocalService;
import com.higo.local.LocalVO;
import com.higo.majorSvc.MajorSvcVO;
import com.higo.member.MemberService;
import com.higo.member.MemberVO;
import com.higo.metro.MetroVO;
import com.higo.post.PostService;
import com.higo.post.PostVO;
import com.higo.quoteReq.QuoteReqService;

import common.ViewPath;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	//private GosuService gosuService;
	private LocalService localService;
	private QuoteReqService quoteReqService;
	private GosuService gosuService;
	private MemberService memberService;
	private PostService postService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	public HomeController(LocalService localService, QuoteReqService quoteReqService, GosuService gosuService, MemberService memberService, PostService postService) {
		this.localService =localService;
		this.gosuService = gosuService;
		this.quoteReqService=quoteReqService;
		this.memberService = memberService;
		this.postService = postService;
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, HttpServletResponse response,HttpSession session) {
		//홈에서 세션값 처리해주기 
		Integer status =(Integer)session.getAttribute("status");
		Integer mlogin = (Integer) session.getAttribute("mlogin");
		Integer glogin = (Integer) session.getAttribute("glogin");
		System.out.println(session.getAttribute("login"));
		System.out.println("status : " + status);
		//header이름 처리 
		
		System.out.println(glogin + "TQ");
		if(glogin !=null) {
			GosuVO gosu = gosuService.selectOne(mlogin);
			System.out.println(mlogin);
			session.setAttribute("login", gosu);
			System.out.println(gosu.getGosu_seq());
		}else if(mlogin != null) {
			MemberVO m = memberService.selectOne(mlogin);
			session.setAttribute("login", m);
			System.out.println("mlog???");
		}
		
		List<Map<String,PostVO>> pv = postService.posting();
		int i = (int)(Math.random() * pv.size());
		int j = (int)(Math.random() * pv.size());
		System.out.println(i);
		request.setAttribute("pv", pv.get(i));
		request.setAttribute("jv", pv.get(j));
		
		System.out.println(pv.size());
		List<Map<String,MajorSvcVO>> mlist = quoteReqService.majorSvcSelect();
		request.setAttribute("mlist", mlist);
		
		
		// 지역 카테고리 
		List<MetroVO> lvo = localService.metroList();
		//System.out.println(lvo.get(0));
		request.setAttribute("lvo", lvo);
	
		
		return ViewPath.MAIN + "index.jsp";
	}
	
}
