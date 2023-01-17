<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/layout/header.jsp" %>
<div class="header text-center">
  <div class="container">
    <div class="row">
      <div class="col-lg-9 mx-auto">
        <h1 class="mb-4"> 커뮤니티</h1>
        <ul class="list-inline">
         <li class="list-inline-item"><a class="text-default"
						href="${ pageContext.request.contextPath }">홈 &nbsp; &nbsp;
							/</a></li>
          <li class="list-inline-item text-primary">커뮤니티</li>
        </ul>
      </div>
    </div>
  </div>
</div>

<div align="center">
	<strong>내 요청서</strong><br>
	${msg }<br>
	<br>
	${quoteReqVO.req_text }<br>
	
	<input type="submit" value="내 견적요청서 모음서로 이동" onclick="location.href='/higo/quote/receiveQuote?kind=1'">
</div>