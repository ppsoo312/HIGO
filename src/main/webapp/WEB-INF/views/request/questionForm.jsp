<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
   function check() {
      //let req_text="";
      let Answer = document.getElementsByName("Answer");
      let AnswerT = document.getElementById("AnswerT");
      const req_text = document.getElementById("req_text");
      let que_text = document.getElementById("que_text");
      
      
      
      req_text.value = "";   
      
      if(que_text.value != null){
         
      req_text.value += que_text.value;
      req_text.value += "\n";
     
      }
      
      for(let i = 0; i < Answer.length; i++){
         if(Answer[i].checked){
            req_text.value += Answer[i].value;
            req_text.value += ","

         }
      }
      if(AnswerT != null){
         req_text.value += AnswerT.value;
         req_text.value += ","
         AnswerT.value = "";
      }
      //alert(AnswerT);
      
      if(document.input.Answer == false){
         alert("값을 체크해주세요");
         return false;
      } else if(document.input.AnswerT == false){
         alert("값을 체크해주세요");
         return false;
      } else {
         
         document.input.submit();
      }
      
   }
</script>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<div class="header text-center">
  <div class="container">
    <div class="row">
      <div class="col-lg-9 mx-auto">
        <h1 class="mb-4"> 견적 요청서</h1>
        <ul class="list-inline">
         <li class="list-inline-item"><a class="text-default"
                  href="${ pageContext.request.contextPath }">홈 &nbsp; &nbsp;
                     /</a></li>
          <li class="list-inline-item text-primary">견적요청서 작성</li>
        </ul>
      </div>
    </div>
  </div>
</div>

					<ul class="list-inline widget-list-inline">
					<c:forEach var="i" items="${mlist }">
						<li class="list-inline-item"><a href="${ pageContext.request.contextPath }/quote/middleSvc?majorSvc=${i.get('MAJORSVC_SEQ')}">${i.get('MAJORSVC_NAME')}</a></li>
						</c:forEach>
					</ul>


<div >
   <div class="row no-gutters justify-content-center pricing-wrapper shadow rounded bg-white">
      <div class="col-lg-4 pricing-item">
         <div class="card shadow-none rounded-0">
            <div style="border:1px solid:black">
               <form action="/higo/quote/questionForm?subSvc=${subSvc_seq}&count=${count }" name="input" method="post">
                  <input type="hidden" id="req_text" name="req_text">
                  <input type="hidden" id="que_text" value="${questionVO.get('QUESTION')}">
                  <div class="card shadow-none rounded-0">
                     <h3><strong>질문 : ${questionVO.get('QUESTION')}</strong></h3>
                     <br><br>
                     <div class="price d-flex align-items-center">
                        <h2 class="h1">Q${questionVO.get('QUESTION_STEP')}</h2>
                        <span class="text-primary">답변타입 : ${questionVO.get("ANWTYPE_SEQ") }</span>
                     </div>
                     <c:forEach var="answer" items="${answerVO }" varStatus="aStatus">
                  
                     <c:if test="${answer.get('QUESTION_SEQ') eq questionVO.get('QUESTION_SEQ')}"> 
                        <c:choose>
                           <c:when test="${questionVO.get('ANWTYPE_SEQ') eq 1}">
                              <p class="gray">
                                 <input type="radio" name="Answer" value="${answer.get('ANW') }" />
                                 <label>${answer.get("ANW") }<br></label>
                              </p>            
                           </c:when>
                           
                           <c:when test="${questionVO.get('ANWTYPE_SEQ') eq 2}">
                              <p class="gray">
                                 <input type="checkbox" name="Answer" value="${answer.get('ANW') }" />
                                 <label>${answer.get("ANW") }<br></label>            
                              </p>
                           </c:when>
                           
                           <c:when test="${questionVO.get('ANWTYPE_SEQ') eq 3}">
                              <p class="gray">
                                 <input type="text" name="AnswerT" id="AnswerT"/>
                              </p>
                           </c:when>
                           <c:otherwise>
                              <input type="radio" name="Answer"/>
                              <label>${answer.get("ANW") }<br></label>
                           </c:otherwise>
                        </c:choose>
                     
                     </c:if>
                  </c:forEach>
                     <div class="card-footer bg-transparent border-0 p-0 mt-4">
                        <a href="#!" class="btn btn-outline-primary"  onclick="javascript:check()">Next Step</a>
                     </div>
                  </div>               
                                    
               </form>
            </div>
         </div>
      </div>
   </div>
</div>


<%@ include file="/WEB-INF/views/layout/footer.jsp" %>