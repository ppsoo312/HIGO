<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<div class="container">
	<div class="row">
		<div class="col-lg-9 mx-auto">
			<h1 class="mb-4">마이페이지</h1>
			<ul class="list-inline">
				<li class="list-inline-item"><a class="text-default"
					href="${ pageContext.request.contextPath }">홈 &nbsp; &nbsp; /</a></li>
				<li class="list-inline-item text-primary">충전하기</li>
			</ul>
		</div>
	</div>
</div>
<div align="center">
	<div class="container">
		<div class="row">
			<div class="col-lg-9 mx-auto">
				<div class="mypage">
					<h1>캐시충전</h1>
					<div>
						<h3>보유캐시 ${vo.cash }캐시</h3>
					</div>
					<a href="${ pageContext.request.contextPath}/cash/autoCharge">
						<img
						src="${ pageContext.request.contextPath}/resources/img/etc/autoChargeAD.png" />
					</a>
				</div>
				<a href="${ pageContext.request.contextPath}/cash/autoCharge"> <img
					src="${ pageContext.request.contextPath}/resources/img/etc/autoCharge01.png" /></a>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
