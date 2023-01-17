<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	function checkForm(){
		document.add.submit();
	}

</script>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<div class="header text-center">
  <div class="container">
    <div class="row">
      <div class="col-lg-9 mx-auto">
        <h1 class="mb-4"> 받은 견적서</h1>
        <ul class="list-inline">
         <li class="list-inline-item"><a class="text-default"
						href="${ pageContext.request.contextPath }">홈 &nbsp; &nbsp;
							/</a></li>
          <li class="list-inline-item text-primary">받은 견적</li>
        </ul>
      </div>
    </div>
  </div>
</div>
<div class="py-4"></div>
  <div class="container">
    <div class="row justify-content-center">
<div>
	  <form id="add" name="add" action="${ pageContext.request.contextPath }/match/quoteSend?kind=1" method="post">
             <input type="hidden" name="member_seq" value="${member_seq }"/>
             <input type="hidden" name="quoteReq_seq" value="${quoteReq_seq }"/>
           <h3><strong> ${myQuoteAddVO.myQuote_name }<br><br></strong></h3>
             금액 설정<br>
             <c:choose>
             	<c:when test="${myQuoteAddVO.price_type == 0 }">
		            <input type="hidden" name="price_type" value="0">총 비용             		
             	</c:when>
             	<c:otherwise>
             		<input type="hidden" name="price_type" value="1">시간 당
             	</c:otherwise>
             </c:choose>
             <br>
             금액<br>
              
             <input type="text" name ="price" value="${price }"/><br><br>
             견적 설명<br>
             <textarea cols="40" rows="8" name="quote_detail">${quote_detail}</textarea><br><br>
             <input type="button" value="견적서 보내기 1,000원" onclick="javascript:checkForm()">      
           </form>
</div>
</div>
</div>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
