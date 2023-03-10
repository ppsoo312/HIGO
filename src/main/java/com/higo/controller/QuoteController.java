package com.higo.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.reflect.MemberSignature;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.higo.gosu.GosuService;
import com.higo.gosu.GosuVO;
import com.higo.gosuMainSvc.GosuMainSvcService;
import com.higo.gosuMainSvc.GosuMainSvcVO;
import com.higo.member.MemberService;
import com.higo.member.MemberVO;
import com.higo.myQuoteadd.MyQuoteAddService;
import com.higo.quote.QuoteService;
import com.higo.quoteReq.QuoteReqService;
import com.higo.quoteReq.QuoteReqVO;
import com.higo.subSvc.SubSvcService;

import common.ViewPath;

@Controller
public class QuoteController {
	
	private MemberService memberService;
	private GosuService gosuService;
	private SubSvcService subSvcService;
	private GosuMainSvcService gosuMainSvcService;
	private QuoteReqService quoteReqService;
	private QuoteService quoteService;
	private MyQuoteAddService myQuoteAddService;
	
	public QuoteController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	public QuoteController(GosuService gosuService) {
		this.gosuService = gosuService;
	}
	
	public QuoteController(MemberService memberService, GosuService gosuService, SubSvcService subSvcService, GosuMainSvcService gosuMainSvcService, QuoteReqService quoteReqService, QuoteService quoteService, MyQuoteAddService myQuoteAddService) {
		this.memberService = memberService;
		this.gosuService = gosuService;
		this.subSvcService = subSvcService;
		this.gosuMainSvcService = gosuMainSvcService;
		this.quoteReqService = quoteReqService;
		this.quoteService = quoteService;
		this.myQuoteAddService = myQuoteAddService;
	}
	
	
	
	@RequestMapping("/quote/receiveRequestQuote")
	public String receiveRequestQuote(HttpServletRequest request, GosuVO gosuVO, QuoteReqVO quoteReqVO) {

		
	System.out.println(request.getSession().getAttribute("login"));
		
		//?????? ????????? ????????????
		int gosu_seq = (int)request.getSession().getAttribute("glogin");
		System.out.println("2???" + gosu_seq);
		//?????? vo ????????????
		gosuVO = gosuService.selectOneGosu(gosu_seq);
		System.out.println("????????????" + gosuVO.getGosu_seq());
		//?????? vo?????? ??????????????? ????????? ????????????
		int gosuMS_seq = gosuVO.getGosuMS_seq();
		System.out.println("?????????????????????" + gosuMS_seq);
		//????????????????????? ??????????????? ?????? ?????? ????????????
		GosuMainSvcVO gosuMainVO = gosuMainSvcService.selectGosuMS(gosuMS_seq);
		//????????? ??????????????? ??????????????? ???????????? ????????????.
		System.out.println(gosuMainVO.getGosuMS_seq());
		int gosuMainSubSvc_seq = gosuMainVO.getSubSvc_seq();
		System.out.println("gosuMainSubSvc_seq" + gosuMainSubSvc_seq);
		//??????????????? ???????????? ??? ??????????????? ????????? ?????? ????????? ????????????
		List<Map<String, Object>> qvo = quoteReqService.receiveQuoteRequest(gosuMainSubSvc_seq);
		System.out.println(qvo.size());
//		List<MemberVO> mvo = new ArrayList<MemberVO>();  
//		
//		for(int i = 0; i < qvo.size(); i++) {
//			//????????? ????????? qvo??? ????????? ????????? ?????? ????????? member_Seq ?????? ????????????.
//		
//			int member_seq = ((BigDecimal)qvo.get(i).get("MEMBER_SEQ")).intValue();
//			// member_Seq??? ???????????? mem??????????????? memberVO ??? ????????????.
//			System.out.println(member_seq);
//			mvo.add(memberService.selectOne(member_seq));
//			
//		}
		
//		for(Map<String, Object> map: qvo) {
//			int member_seq = ((BigDecimal)map.get("MEMBER_SEQ")).intValue();
//			mvo.add(memberService.selectOne(member_seq));
//		}
		
//		request.setAttribute("mvo", mvo);
		request.setAttribute("qvo", qvo);
		
		//mvo.get(0);
		
		return ViewPath.QUOTE + "receiveRequestQuote.jsp";
	}
	
	@RequestMapping("/quote/receiveQuote")
	public String receiveQuote(HttpServletRequest request) {
		
		int kind = Integer.parseInt(request.getParameter("kind"));
		
		if(kind == 2) {
			int quote_seq = Integer.parseInt(request.getParameter("quote_seq"));
			int d = quoteService.quoteDelete(quote_seq);
		}else if(kind == 3) {
			int quote_seq = Integer.parseInt(request.getParameter("quote_seq"));
			int b = quoteService.updateQuote(quote_seq);
			int gosu_seq = Integer.parseInt(request.getParameter("gosu_seq"));
			int re = gosuService.updateHireCnt(gosu_seq);
			
			
		}
		Integer member_seq = (Integer)request.getSession().getAttribute("mlogin");
		
		List<Map<String, Object>> qvo = quoteService.selectQuote(member_seq);
//		System.out.println(qvo.size());
		String subSvcName[] = new String[qvo.size()];
		for(int i=0; i < qvo.size(); i++) {
			// QUTEreq????????? ????????? ????????????
			int quoteReq_seq = ((BigDecimal)qvo.get(i).get("QUOTEREQ_SEQ")).intValue();
			//System.out.println(quoteReq_seq);
			//qutereq??????????????? subsvc_seq ??? ????????????
			int subSvc_seq = quoteReqService.selectSubSeq(quoteReq_seq);
			//System.out.println(subSvc_seq);
			//subsvc ??????????????? subsvc_name??? ????????????
			String subSvc = subSvcService.selectSubName(subSvc_seq);
			//System.out.println(subSvc);
			// ??? ?????? ???????????? ????????????.
			subSvcName[i] = subSvc;
			
		}
		request.setAttribute("subSvcName", subSvcName);
		request.setAttribute("qvo", qvo);
		
		
		return ViewPath.QUOTE + "receiveQuote.jsp";
	}
	
	@RequestMapping("/quote/receiveQuoteDetail")
	public String receiveQuoteDetail(HttpServletRequest request, QuoteReqVO vo, GosuVO gvo, MemberVO mvo) {
		//?????????????????? ????????????.
		int quote_seq = Integer.parseInt(request.getParameter("quote_seq"));
		int quoteReq_seq = Integer.parseInt(request.getParameter("quoteReq_seq"));
		String options = request.getParameter("options");
		int gosu_seq = Integer.parseInt(request.getParameter("gosu_seq"));
		int price = Integer.parseInt(request.getParameter("price"));
		int qStatus = Integer.parseInt(request.getParameter("qStatus"));
		
		//System.out.println(options);
		//System.out.println(price);
		vo = quoteReqService.showQuoteRequest(quoteReq_seq);
		gvo = gosuService.selectOneGosu(gosu_seq);

		int member_seq = gvo.getMember_seq();
		mvo = memberService.selectOne(member_seq);
		
		request.setAttribute("gvo", gvo);
		request.setAttribute("vo", vo);
		request.setAttribute("mvo", mvo);
		request.setAttribute("price", price);
		request.setAttribute("options", options);
		request.setAttribute("quote_seq", quote_seq);
		request.setAttribute("gosu_seq", gosu_seq);
		request.setAttribute("qStatus", qStatus);
		
		
		return ViewPath.QUOTE + "receiveQuoteDetail.jsp";
	}
	
	
	
	
}

