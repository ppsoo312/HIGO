package com.higo.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.higo.cash.CashService;
import com.higo.gosu.GosuService;
import com.higo.gosu.GosuVO;
import com.higo.gosuMainSvc.GosuMainSvcService;
import com.higo.gosuMainSvc.GosuMainSvcVO;
import com.higo.majorSvc.MajorSvcVO;
import com.higo.member.MemberService;
import com.higo.member.MemberVO;
import com.higo.myQuoteadd.MyQuoteAddService;
import com.higo.myQuoteadd.MyQuoteAddVO;
import com.higo.quote.QuoteService;
import com.higo.quote.QuoteVO;
import com.higo.quoteReq.QuoteReqService;
import com.higo.quoteReq.QuoteReqVO;
import com.higo.subSvc.SubSvcService;
import com.higo.subSvc.SubSvcVO;

import common.Setting;
import common.ViewPath;

@Controller
public class MatchingController {

	private QuoteReqService quoteReqService;
	private MemberService memberService;
	private SubSvcService subSvcService;
	private QuoteService quoteService;
	private MyQuoteAddService myQuoteAddService;
	private GosuMainSvcService gosuMainSvcService;
	private GosuService gosuService;
	private CashService cashService;
	
	public MatchingController(QuoteReqService quoteReqService, MemberService memberService, SubSvcService subSvcService, QuoteService quoteService, MyQuoteAddService myQuoteAddService, GosuMainSvcService gosuMainSvcService, GosuService gosuService, CashService cashService) {
		this.quoteReqService = quoteReqService;
		this.memberService = memberService;
		this.subSvcService = subSvcService;
		this.quoteService = quoteService;
		this.myQuoteAddService = myQuoteAddService;
		this.gosuMainSvcService = gosuMainSvcService;
		this.gosuService = gosuService;
		this.cashService = cashService;
	}
	

	
	@RequestMapping("/match/quoteWrite")
	public String quoteWrite(Model model, HttpServletRequest request, QuoteReqVO quoteReqVO, MemberVO memberVO, SubSvcVO subSvcVO) {
		
		int quoteRequest_seq = 0;
		int member_seq = 0;
		
		try {
			quoteRequest_seq = Integer.parseInt(request.getParameter("quoteRequest"));
			member_seq = Integer.parseInt(request.getParameter("member_seq"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		

		//??????????????? vo??? ?????????????????? ????????????
		quoteReqVO = quoteReqService.showQuoteRequest(quoteRequest_seq);
		//?????? vo ???????????????????????? ????????????
		memberVO = memberService.selectOne(member_seq);
		
		int subSvc_seq = quoteReqVO.getSubSvc_seq();
		// ???vo ???????????????????????? ????????????
		subSvcVO = subSvcService.subSvcSelectVO(subSvc_seq);
		
		//???????????? ????????? ????????? ????????????
		List<Map<String, Object>> myQuoteAdd = myQuoteAddService.selectAddQuote();
		
		System.out.println(myQuoteAdd.get(0));
		
		request.setAttribute("myQuoteAdd", myQuoteAdd);
		model.addAttribute("quoteReqVO", quoteReqVO);
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("subSvcVO", subSvcVO);
		
		return ViewPath.MATCHING + "quoteWrite.jsp";
	}
	
	@RequestMapping("/match/quoteSend")
	public String quoteSend(HttpServletRequest request, HttpServletResponse response, QuoteVO vo, GosuMainSvcVO gmsvo, MyQuoteAddVO mqavo) {
		int kind = Integer.parseInt(request.getParameter("kind"));
		int gosu_seq = (int)request.getSession().getAttribute("glogin");
		int member_seq = Integer.parseInt(request.getParameter("member_seq"));
		String[] option_name = request.getParameterValues("option_name");
		String[] option_priceS = request.getParameterValues("option_price");
		String quote_detail = request.getParameter("quote_detail");
		int quoteReq_seq = Integer.parseInt(request.getParameter("quoteReq_seq"));
		
		String option = "";
		int option_price = 0;
		int price = 0;
		
		if(kind == 1) {
			//???????????? ?????? ????????? ????????? ??????
			//?????? ?????? ?????? ????????????
			int qPrice = Setting.QUOTEPRICE;
			GosuVO gcvo = gosuService.myCash(gosu_seq);
			int cash = gcvo.getCash();
			int bonus = gcvo.getBonus_cash();
			int total = cash+ bonus;
			String msg ="" ;
			String url ="" ;

			// ??????????????? ?????? ?????? ?????? ????????? ?????? ????????? ????????????
			if(total >= qPrice ) {
				if(cash >= qPrice) {
					cash -= qPrice;
				}else{
					// total ????????? ??????????????? ?????????, 	
					// ??????????????????????????? ????????? ????????? ?????? ?????????, ??????????????? ??????
					bonus -= (qPrice-cash);
					cash = 0;			
				}
				gcvo.setGosu_seq(gosu_seq);
				gcvo.setCash(cash);
				gcvo.setBonus_cash(bonus);
				System.out.println(cash);
				System.out.println(bonus);
				int result = cashService.setCash(gcvo);
				msg = "????????? ?????? ??????!!";
			}else {
				msg = " ?????? ?????? , ?????????????????? ??????";
				Setting.alertAndGo(response, msg, "/higo/mypage/cash/store");
				System.out.println("?????? ??????..");
				return "/quote/receiveRequestQuote";
			}
			
			int price_type = Integer.parseInt(request.getParameter("price_type"));
			price = Integer.parseInt(request.getParameter("price"));
			vo.setPrice_type(price_type);
			vo.setMember_seq(member_seq);
			vo.setGosu_seq(gosu_seq);
			vo.setPrice(price);
			vo.setQuote_detail(quote_detail);
			vo.setQStatus(0);
			// ????????????????????? ?????? = on ?????? = null
			String chb = request.getParameter("chb");
			System.out.println(chb);
			if(chb != null) {
				String myQuote_name = request.getParameter("jaju");
				System.out.println(myQuote_name);
				System.out.println("??????????????? ???????????? ????????? ??????????????? ??? ???????????????~");
				vo.setMember_seq(member_seq);
				gmsvo = gosuMainSvcService.selectSMM(gosu_seq);
				System.out.println(gmsvo.getSubSvc_seq());
				mqavo.setGosu_seq(gosu_seq);
				mqavo.setSubSvc_seq(gmsvo.getSubSvc_seq());
				mqavo.setMiddleSvc_seq(gmsvo.getMiddleSvc_seq());
				mqavo.setMajorSvc_seq(gmsvo.getMajorSvc_seq());
				mqavo.setPrice(price);
				mqavo.setQuote_detail(quote_detail);
				mqavo.setPrice_type(price_type);
				mqavo.setMyQuote_name(myQuote_name);
				
				int a = quoteService.insertMyQuoteAdd(mqavo);
			}
			
		}else if(kind == 2) {
			//???????????? ?????? ????????? ????????? ??????
			int count = Integer.parseInt(request.getParameter("count"));
			vo.setMember_seq(member_seq);
			vo.setGosu_seq(gosu_seq);
			for(int i = 0; i < count; i++) {
				option += option_name[i];
				option += "\n";
				option += option_priceS[i];
				option_price = Integer.parseInt(option_priceS[i]);
				price += option_price;
			}
			
			vo.setPrice(price);
			vo.setQuote_detail(quote_detail);
			vo.setQuoteReq_seq(quoteReq_seq);
			vo.setOptions(option);
			vo.setQStatus(0);
			
			System.out.println(vo.getMember_seq());
			System.out.println(vo.getGosu_seq());
			System.out.println(vo.getPrice());
			System.out.println(vo.getQuote_detail());
			System.out.println(vo.getQuoteReq_seq());
			System.out.println(vo.getOptions());
			
			
		}
		
		int su = quoteService.optionQuote(vo);
		//????????? ?????? ?????? ?????????????????? status ?????? 1??????
		//????????? ??? ????????? ?????? ??????????????? ?????????
		int no = quoteReqService.statusUpdate(quoteReq_seq);
		if(su != 0) {
			System.out.println("??????");
		}
		if(no != 0) {
			System.out.println("??????");
		}
		return "/quote/receiveRequestQuote";
	}
	
	@RequestMapping("/match/myQuoteSend")
	public String myQuoteSend(HttpServletRequest request,HttpServletResponse response, MyQuoteAddVO myQuoteAddVO) {
		
		Setting.gosuSession(request, response);
		int myQuote_seq = Integer.parseInt(request.getParameter("myQuote_seq"));

		int member_seq = Integer.parseInt(request.getParameter("member_seq"));
		int quoteReq_seq = Integer.parseInt(request.getParameter("quoteReq_seq"));
		myQuoteAddVO = myQuoteAddService.selectAddQuoteSeq(myQuote_seq);
		
		
		request.setAttribute("member_seq", member_seq);
		request.setAttribute("quoteReq_seq", quoteReq_seq);
		request.setAttribute("myQuoteAddVO", myQuoteAddVO);
		request.setAttribute("price", myQuoteAddVO.getPrice());
		request.setAttribute("quote_detail", myQuoteAddVO.getQuote_detail());
	
		return ViewPath.MATCHING + "myQuoteWrite.jsp";
	}
	
	@RequestMapping("/matching/main")
	public String main(HttpServletRequest request) {
		
		List<Map<String,MajorSvcVO>> mlist = quoteReqService.majorSvcSelect();
		request.setAttribute("mlist", mlist);
		
		
		return ViewPath.MATCHING + "matching.jsp";
	}
	

}



