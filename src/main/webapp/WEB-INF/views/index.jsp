<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
	
	<!-- start of banner -->
	<div class="banner text-center">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 mx-auto">
					<h1 class="mb-5">
						<br> 원하는 서비스를 찾아보세요!
					</h1>
					<ul class="list-inline widget-list-inline">
					<c:forEach var="i" items="${mlist }">
						<li class="list-inline-item"><a href="${ pageContext.request.contextPath }/quote/middleSvc?majorSvc=${i.get('MAJORSVC_SEQ')}">${i.get('MAJORSVC_NAME')}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>	
  <div class="container">
    <div class="row">
      <div class="col-lg-4 mb-5">
        <h2 class="h5 section-title">히고에게 물어보세요</h2>
        <article class="card">
          <div class="post-slider slider-sm">
            <img src="${ pageContext.request.contextPath }/resources/img/clean1.png" class="card-img-top" alt="post-thumb">
          </div>
          <c:set var="i" value="${pv }"/>
          <div class="card-body">
            <h3 class="h4 mb-3"><a class="post-title" href="#">${i.get("POST_TITLE")}</a></h3>
            <ul class="card-meta list-inline">
              <li class="list-inline-item">
                <a href="author-single.html" class="card-meta-author">
                  <img src="${ pageContext.request.contextPath }/resources/img/clean1.png"/>
                  <span></span>
                </a>
              </li>
              <li class="list-inline-item">
                <p>${i.get("POST_HIT") }</p>
                
              </li>
              <li class="list-inline-item">
                <i class="ti-calendar"></i><fmt:formatDate value="${i.get('POST_SYSDATE') }" pattern="yyyy년 MM월 dd일"/>
              </li>
              <li class="list-inline-item">
                <ul class="card-meta-tag list-inline">
                  <li class="list-inline-item"><a href="tags.html">Color</a></li>
                  <li class="list-inline-item"><a href="tags.html">Recipe</a></li>
                  <li class="list-inline-item"><a href="tags.html">Fish</a></li>
                </ul>
              </li>
            </ul>
            <p>${i.get("POST_CONTENT") }</p>
            <a href="${ pageContext.request.contextPath }/post/content/${vo.post_seq }" class="btn btn-outline-primary">더보기</a>
          </div>
        </article>
         <article class="card">
          <div class="post-slider slider-sm">
            <img src="${ pageContext.request.contextPath }/resources/images/bi.png" class="card-img-top" alt="post-thumb">
          </div>
          <c:set var="i" value="${jv }"/>
          <div class="card-body">
            <h3 class="h4 mb-3"><a class="post-title" href="#">${i.get("POST_TITLE")}</a></h3>
            <ul class="card-meta list-inline">
              <li class="list-inline-item">
                <a href="author-single.html" class="card-meta-author">
                  <img src="${ pageContext.request.contextPath }/resources/img/clean1.png"/>
                  <span></span>
                </a>
              </li>
              <li class="list-inline-item">
                <p>${i.get("POST_HIT") }</p>
                
              </li>
              <li class="list-inline-item">
                <i class="ti-calendar"></i><fmt:formatDate value="${i.get('POST_SYSDATE') }" pattern="yyyy년 MM월 dd일"/>
              </li>
              <li class="list-inline-item">
                <ul class="card-meta-tag list-inline">
                  <li class="list-inline-item"><a href="tags.html">Color</a></li>
                  <li class="list-inline-item"><a href="tags.html">Recipe</a></li>
                  <li class="list-inline-item"><a href="tags.html">Fish</a></li>
                </ul>
              </li>
            </ul>
            <p>${i.get("POST_CONTENT") }</p>
            <a href="${ pageContext.request.contextPath }/post/content/${vo.post_seq }" class="btn btn-outline-primary">더보기</a>
          </div>
        </article>
      </div>
    <div class="col-lg-4 mb-5">
        <h2 class="h5 section-title"><strong>인기고수 소개</strong></h2>
        
        <article class="card mb-4">
          <div class="card-body d-flex">
            <img class="card-img-sm" src="${ pageContext.request.contextPath }/resources/images/bi.png">
            <div class="ml-3">
              <h4><a href="#" class="post-title">벨리 댄스 장인 김선경</a></h4>
              <ul class="card-meta list-inline mb-0">
                <li class="list-inline-item mb-0">
                  대표서비스명 : 벨리댄스 레슨
                </li>
                <li class="list-inline-item mb-0">
                  <i class="ti-calendar"></i>계약 체결 수 : 150명
                </li>
              </ul>
            </div>
          </div>
        </article>
        
        <article class="card mb-4">
          <div class="card-body d-flex">
            <img class="card-img-sm" src="${ pageContext.request.contextPath }/resources/images/pys.jpg">
            <div class="ml-3">
              <h4><a href="#" class="post-title">축구신동</a></h4>
              <ul class="card-meta list-inline mb-0">
                <li class="list-inline-item mb-0">
                  대표서비스명 : 축구 레슨
                </li>
                <li class="list-inline-item mb-0">
                  <i class="ti-calendar"></i>회원수 : 12.400명
                </li>
              </ul>
            </div>
          </div>
        </article>
        
        <article class="card mb-4">
          <div class="card-body d-flex">
            <img class="card-img-sm" src="${ pageContext.request.contextPath }/resources/images/w.png">
            <div class="ml-3">
              <h4><a href="#" class="post-title">포토샵 장인 뒤틀린 공간</a></h4>
              <ul class="card-meta list-inline mb-0">
                <li class="list-inline-item mb-0">
                  대표서비스명 : 포토샵 레슨
                </li>
                <li class="list-inline-item mb-0">
                  <i class="ti-calendar"></i>회원수 : 1명
                </li>
              </ul>
            </div>
          </div>
        </article>
        
        <article class="card mb-4">
          <div class="card-body d-flex">
            <img class="card-img-sm" src="${ pageContext.request.contextPath }/resources/images/sin.png">
            <div class="ml-3">
              <h4><a href="#" class="post-title">주식 강의 1타 고수</a></h4>
              <ul class="card-meta list-inline mb-0">
                <li class="list-inline-item mb-0">
                  대표서비스명 : 주식 강의
                </li>
                <li class="list-inline-item mb-0">
                  <i class="ti-calendar"></i>회원수 : 22명
                </li>
              </ul>
            </div>
          </div>
        </article>
        
        <article class="card mb-4">
          <div class="card-body d-flex">
            <img class="card-img-sm" src="${ pageContext.request.contextPath }/resources/images/k.png">
            <div class="ml-3">
              <h4><a href="#" class="post-title">막힌 변기 뚫기 고수</a></h4>
              <ul class="card-meta list-inline mb-0">
                <li class="list-inline-item mb-0">
                  대표서비스명 : 청소
                </li>
                <li class="list-inline-item mb-0">
                  <i class="ti-calendar"></i>회원수 : 1명
                </li>
              </ul>
            </div>
          </div>
        </article>
         <article class="card mb-4">
          <div class="card-body d-flex">
            <img class="card-img-sm" src="${ pageContext.request.contextPath }/resources/images/h.png">
            <div class="ml-3">
              <h4><a href="#" class="post-title">막힌 변기 뚫기 고수</a></h4>
              <ul class="card-meta list-inline mb-0">
                <li class="list-inline-item mb-0">
                  대표서비스명 : 청소
                </li>
                <li class="list-inline-item mb-0">
                  <i class="ti-calendar"></i>회원수 : 1명
                </li>
              </ul>
            </div>
          </div>
        </article>
        
        
      </div>
      
      <div class="col-lg-4 mb-5">
        <h2 class="h5 section-title"><strong>숨고 이야기</strong></h2>
        
        <article class="card">
          <div class="post-slider slider-sm">
            <img src="${ pageContext.request.contextPath }/resources/images/img.png" class="card-img-top" alt="post-thumb">
          </div>
          <div class="card-body">
            <h3 class="h4 mb-3"><a class="post-title" href="#">미술 레슨으로 만든 작품으로 전시회를 열었어요</a></h3>
            <ul class="card-meta list-inline">
              <li class="list-inline-item">
                <a href="#" class="card-meta-author">
                  <img src="${ pageContext.request.contextPath }/resources/images/img.png" alt="Kate Stone">
                  <span>Kate Stone</span>
                </a>
              </li>
              <li class="list-inline-item">
                <i class="ti-timer"></i>2 Min To Read
              </li>
              <li class="list-inline-item">
                <i class="ti-calendar"></i>14 jan, 2020
              </li>
              <li class="list-inline-item">
                <ul class="card-meta-tag list-inline">
                  <li class="list-inline-item">미술</li>
                  <li class="list-inline-item">전시회</li>
                  <li class="list-inline-item">예술인</li>
                </ul>
              </li>
            </ul>
            <p>숨고 미술고수님에게 레슨을 받고 전시회도 초대되어 뜻깊은 시간 보내고 가요~</p>
            <a href="#" class="btn btn-outline-primary">Read More</a>
          </div>
        </article>
        <br>
        <article class="card">
          <div class="post-slider slider-sm">
            <img src="${ pageContext.request.contextPath }/resources/images/img1.png" class="card-img-top" alt="post-thumb">
          </div>
          <div class="card-body">
            <h3 class="h4 mb-3"><a class="post-title" href="#">[고수인터뷰] 목소리처럼 표현하는 트럼펫 </a></h3>
            <ul class="card-meta list-inline">
              <li class="list-inline-item">
                <a href="#" class="card-meta-author">
                  <img src="${ pageContext.request.contextPath }/resources/images/img1.png" alt="Kate Stone">
                  <span>Kate Stone</span>
                </a>
              </li>
              <li class="list-inline-item">
                <i class="ti-timer"></i>150 Min To Read
              </li>
              <li class="list-inline-item">
                <i class="ti-calendar"></i>7 jan, 2022
              </li>
              <li class="list-inline-item">
                <ul class="card-meta-tag list-inline">
                  <li class="list-inline-item">트럼펫</li>
                  <li class="list-inline-item">합동</li>
                  <li class="list-inline-item">음악</li>
                </ul>
              </li>
            </ul>
            <p>숨고 미술고수님에게 레슨을 받고 전시회도 초대되어 뜻깊은 시간 보내고 가요~</p>
            <a href="#" class="btn btn-outline-primary">Read More</a>
          </div>
        </article>
      </div>
      <div class="col-12">
        <div class="border-bottom border-default"></div>
      </div>
    </div>
  </div>
		<!--  지역검색 -->
		<div align = "center">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 mx-auto">
					<h1 class="mb-5">
					전국 숨은 고수<br> 믿을 수 있는 전문가를 숨고 단 한곳에서 찾으세요
					</h1>
					<ul class="list-inline widget-list-inline">
						<c:forEach var="i" items="${lvo }">
						<li class="list-inline-item"><a href="${ pageContext.request.contextPath }/metro?metro_seq=${i.metro_seq}&metro_name=${i.metro_name }">${i.metro_name }</a></li>
						</c:forEach>
						
					</ul>
				</div>
			</div>
		</div>
</div>









<%@ include file="/WEB-INF/views/layout/footer.jsp" %>