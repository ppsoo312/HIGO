<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<div class="header text-center">
  <div class="container">
    <div class="row">
      <div class="col-lg-9 mx-auto">
        <h1 class="mb-4"> 고수매칭</h1>
        <ul class="list-inline">
         <li class="list-inline-item"><a class="text-default"
						href="${ pageContext.request.contextPath }">홈 &nbsp; &nbsp;
							/</a></li>
          <li class="list-inline-item text-primary">고수매칭</li>
        </ul>
      </div>
    </div>
  </div>
</div>



<div class="container">
	<div class="row no-gutters justify-content-center">
		<a class="mypageName" href="${ pageContext.request.contextPath}/gosu/mypage">
			<div class="col-lg-3 col-md-4 mb-4 mb-md-0">
			<img name="profile" class="author-image" src="${ pageContext.request.contextPath}/resources/images/bi.png">	
		</div>
		<div class="col-md-8 col-lg-6 text-center text-md-left">
			<h3 class="mb-2">마이페이지</h2>
				<strong class="mb-2 d-block"><h2>${mvo.name}고수님</h2></strong>
				<h6>${mvo.email }</h6>
				<h5>계정설정</h5>
				
				<a class="post-count mb-1" href="author-single.html#post"><i class="ti-pencil-alt mr-2"></i><span
						class="text-primary">2</span> Posts by this author</a>
				<ul class="list-inline social-icons">
					
					<li class="list-inline-item"><a href="#"><i class="ti-facebook"></i></a></li>
					
					<li class="list-inline-item"><a href="#"><i class="ti-twitter-alt"></i></a></li>
					
					<li class="list-inline-item"><a href="#"><i class="ti-github"></i></a></li>
					
					<li class="list-inline-item"><a href="#"><i class="ti-link"></i></a></li>
					
				</ul>
		</div>
		</a>			
	</div>
</div>
<br>
<div class="container">
	<div class="row no-gutters justify-content-center">
		<div class="col-md-8 col-lg-6 text-center text-md-left">
			<strong class="mb-2 d-block"><h2>숨고캐시</h2></strong><hr><br>
			<h4 class="mb-2"><a href="${ pageContext.request.contextPath}/mypage/cash/store">스토어</a></h4><br>
			<h4><fmt:formatNumber value="${vo.cash + vo.bonus_cash}" pattern="#,###"/>캐시</h4><br>
			<h4 class="mb-2"><a href="${ pageContext.request.contextPath}/mypage/cash/chargeList">충전/사용내역</a></h4><br>
			<h3 class="mb-2">커뮤니티</h3><hr><br>
			<h4 class="mb-2"><a href="${ pageContext.request.contextPath}/mypage/mypost">숨고생활 작성글/댓글</a></h4>
		</div>			
	</div>
</div>
<br><br><br><br><br>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>


