<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<div class="header text-center">
	<div class="container">
		<div class="row">
			<div class="col-lg-9 mx-auto">
				<h1 class="mb-4"></h1>
				<ul class="list-inline">
					<li class="list-inline-item"><a class="text-default"
						href="${ pageContext.request.contextPath }">홈 &nbsp; &nbsp; /</a></li>
					<li class="list-inline-item text-primary">커뮤니티</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!--  지역검색 -->
<div align="center">
	<div class="container">
		<div class="row">
			<div class="col-lg-9 mx-auto">
				<h1 class="mb-5">
					전국 숨은 고수<br> 믿을 수 있는 전문가를 숨고 단 한곳에서 찾으세요
				</h1>
				<ul class="list-inline widget-list-inline">
					<c:forEach var="i" items="${mlist }">
						<li class="list-inline-item"><a
							href="${ pageContext.request.contextPath }/metro?metro_seq=${i.metro_seq}&metro_name=${i.metro_name }">${i.metro_name }</a></li>
					</c:forEach>

				</ul>
				<div class="widget widget-categories">
					<h4 class="widget-title">
						<span>${vo }</span>
					</h4>
					<ul class="list-unstyled widget-list">
						<c:forEach var="i" items="${llvo}">
							<li><a
								href="${ pageContext.request.contextPath }/metro?metro_seq=${i.get('SUBSVC_SEQ')}"
								class="d-flex">${i.get('SUBSVC_NAME')}<small class="ml-auto">${i.get('COUNT')}</small></a></li>
						</c:forEach>
					</ul>
				</div>
			</div>

		</div>
	</div>
</div>

