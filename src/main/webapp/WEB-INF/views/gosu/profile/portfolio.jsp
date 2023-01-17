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
	<form>
		<table>
			<tr>
				<th><h3><strong>포트폴리오 등록</strong></h3></th>
			</tr>
			<tr>
				<td><h4><strong>필수정보*</strong></h4></td>
			</tr>
			<tr>
				<td>서비스 종류</td>
			</tr>
			<tr>
				<td><button type="button" class=""></button></td>
			</tr>
			<tr>
				<td>대표이미지 등록</td>
			</tr>
			<tr>
				<td>상세이미지 등록</td>
			</tr>
			<tr>
				<td><h4><strong>상세 정보</strong></h4></td>
			</tr>
			<tr>
				<td>지역 정보</td>
			</tr>
			<tr>
				<td>최종 금액</td>
			</tr>
			<tr>
				<td>작업 연도</td>
				<td>작업 소요기간</td>
			</tr>
			<tr>
				<td>
					<select style="width: 200px">
						<option value="2022" selected="selected">2022
						<option value="2021">2021
						<option value="2020">2020
						<option value="2019">2019
						<option value="2018">2018
						<option value="2017">2017
						<option value="2016">2016
						<option value="2015">2015
						<option value="2014">2014
						<option value="2013">2013
						<option value="2012">2012
						<option value="2011">2011
						<option value="2010">2010
						<option value="2009">2009
						<option value="2008">2008
						<option value="2007">2007
						<option value="2006">2006
						<option value="2005">2005
						<option value="2004">2004
						<option value="2003">2003
						<option value="2002">2002
						<option value="2001">2001
						<option value="2000">2000
						<option value="1999">1999
						<option value="1998">1998
						<option value="1997">1997
						<option value="1996">1996
						<option value="1995">1995
						<option value="1994">1994
						<option value="1993">1993
						<option value="1992">1992
						<option value="1991">1991
						<option value="1990">1990
					</select>
				</td>
				<td>
					<input type="number" style="width: 80px" min="0">
				</td>
				<td>
					<select>
						<option value="">시간 
						<option value="">일 
						<option value="">주
						<option value="">개월
					</select>
				</td>
			</tr>
			<tr>
				<td>상세 설명</td>
			</tr>
			<tr>
				<td><textarea rows="4" cols="30"></textarea></td>
			</tr>
			<tr>
				<td align="center"><input type="button" value="등록하기"></td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
