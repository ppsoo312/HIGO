package common;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.higo.gosu.GosuService;
import com.higo.gosu.GosuVO;
import com.higo.member.MemberService;
import com.higo.member.MemberVO;

public class Setting {

	//견적서 금액 세팅
	public static final int QUOTEPRICE = 1000;


	//login 세션 처리 static method
	public static void status(HttpServletRequest request) {
		Integer status =(Integer)request.getSession().getAttribute("status");

		//MemberVO vo = (MemberVO) request.getAttribute("vo");
		//GosuVO gvo = (GosuVO) request.getAttribute("gvo");
		//			GosuVO gvo = null;
		//			MemberVO vo = null;
		//			try {
		//				vo = memberService.selectOne(mlogin);
		//				gvo = gosuService.selectOneGosu(glogin);
		//				if(gvo != null) {
		//					request.setAttribute("gvo", gvo);
		//				}
		//				if(vo != null) {
		//					request.setAttribute("vo", vo);
		//				}
		//			}catch(NullPointerException e) {
		//				e.printStackTrace();
		//			}
	}
	// alert 띄우고 이전 페이지로 가기
	public static void alertAndBack(HttpServletResponse response, String msg) {
		try {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter w = response.getWriter();
			w.write("<script>alert('"+msg+"');history.go(-1);</script>");
			w.flush();
			w.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	// alert 띄우고 원하는 페이지로 이동
	public static void alertAndGo(HttpServletResponse response, String msg, String url) {
		try {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter w = response.getWriter();
			w.write("<script>alert('"+msg+"');location.href='"+url+"';</script>");
			w.flush();
			w.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public static int goToLogin(HttpServletRequest request, HttpServletResponse response) {
		Integer mlogin = 0;
		try {
			if((mlogin = (Integer) request.getSession().getAttribute("mlogin"))==null) {

				response.setContentType("text/html; charset=utf-8");
				PrintWriter w = response.getWriter();
				w.write("<script>alert('로그인 후 이용해주세요!');location.href='/higo/login/loginForm';</script>");
				w.flush();
				w.close();
			};
		} catch(Exception e) {
			e.printStackTrace();
		}
		return mlogin;
	}
	//status == 1 ( 고수)
	public static void gosuSession(HttpServletRequest request, HttpServletResponse response) {
		Integer glogin = null;
		Integer status = 0;
		try {
			status = (Integer) request.getSession().getAttribute("status");

			if((glogin = (Integer) request.getSession().getAttribute("glogin")) == null) {
				Setting.alertAndGo(response, "고수님이 되신 후 이용가능합니다", "/higo/gosu/join" );
			}else if(status != 1) {
				Setting.alertAndGo(response, "고수모드로 전환합니다", "/higo/change");
			}
		}catch(NullPointerException e) {
			e.printStackTrace();
		}
	}
	//status == 0( 멤버)
	public static void memberSession(HttpServletRequest request, HttpServletResponse response) {

	}
}
