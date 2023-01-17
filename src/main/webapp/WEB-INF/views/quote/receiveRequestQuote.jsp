<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
    .word {
        outline: 1px solid black;
        display: block;
        color: black;
        width: 300px;
        font-size: 15px;
        font-weight: bolder !important;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: normal;
        line-height: 1.2;
/*        height: 4.8em;*/
        text-align: left;
        word-wrap: break-word;
        display: -webkit-box;
        -webkit-line-clamp: 1 ;
        -webkit-box-orient: vertical;
    }
    
    .table {
    	height: 50px;
    }
    
</style>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<div class="header text-center">
  <div class="container">
    <div class="row">
      <div class="col-lg-9 mx-auto">
        <h1 class="mb-4"> 받은 요청서</h1>
        <ul class="list-inline">
         <li class="list-inline-item"><a class="text-default"
						href="${ pageContext.request.contextPath }">홈 &nbsp; &nbsp;
							/</a></li>
          <li class="list-inline-item text-primary">받은 요청서</li>
        </ul>
      </div>
    </div>
  </div>
</div>


<section class="section">
  <div class="container">
       <article class="card mb-4">
    <div class="row justify-content-center">
         <c:choose>
	<c:when test="${qvo.size() != 0 }">
		<form action="/higo/request/quoteRequestD" name="input" method="post">
			<c:forEach var="i" items="${qvo }" varStatus="statusS">
				<c:set var="a" value="${statusS.index }"/>
				<input type="hidden" name="quoteReq_seq" value="${i.get('QUOTEREQ_SEQ') }"/>
				<strong>받은 요청</strong>
				<table class="table">
					<tr>
						<td>img</td>
						<td>
						${mvo.name}<br>
						<%-- ${mvo.address } --%>
						<c:choose>
							<c:when test="${i.get('QSTATUS') == 0 }">
								<a href="/higo/match/quoteWrite?quoteRequest=${i.get('QUOTEREQ_SEQ') }&member_seq=${i.get('MEMBER_SEQ')}">
								<p class="word"> ${i.get("REQ_TEXT") }</p></a><!-- 주소에 파라미터값으로 시퀀스값 넣어간다 -->
							</c:when>
							<c:otherwise>
								<p class="word"> ${i.get("REQ_TEXT") }</p>
								이미 견적서 보냄
							</c:otherwise>
						</c:choose>
						<button type="submit" name="quoteReq_seq" value="${i.get('QUOTEREQ_SEQ') }" >삭제</button>
						</td>
						
					</tr>
				</table>
			</c:forEach>
</form>
	</c:when>
	<c:otherwise>
		아무것도 없다...
	</c:otherwise>
</c:choose>
</div>
        </article>
        </div>
  
</section>


<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
