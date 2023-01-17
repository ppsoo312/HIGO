<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	function check() {
		let pay = document.getElementsByName("pay");
		let card = document.getElementById("card");

		for (let i = 0; pay.length; i++) {
			if (pay[i].checked) {
				if (pay[i].value == 'phonePay') {
					card.style.cssText = "display: none;"
				} else if (pay[i].value == 'credit') {
					card.style.cssText = "display: inline;"
				} else if (pay[i].value == 'money'){
					card.style.cssText = "display: none;"
				}
			}
		}
	}
	
	
</script>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<div class="header text-center">
	
	<div class="container">
	  <div class="row justify-content-center"">
	    <div class="col-lg-9 mx-auto">
	      <h1 class="mb-4"> 마이페이지</h1>
	      <ul class="list-inline">
	       <li class="list-inline-item"><a class="text-default"
					href="${ pageContext.request.contextPath }">홈 &nbsp; &nbsp;
								/</a></li>
	          <li class="list-inline-item text-primary">캐시충전</li>
	        </ul>
	      </div>
	    </div>
	  </div>
	</div>
<div class="container" align="center">
	<div class="mypage">
		<form action="${ pageContext.request.contextPath}/cash/pay"></form>
		<h1>캐시충전</h1>
		<div>
			<h3>보유캐시 ${vo.cash }캐시</h3>
		</div>
		<div>
			<a href="${ pageContext.request.contextPath}/cash/autoCharge"> <img
				src="${ pageContext.request.contextPath}/resources/img/etc/autoChargeAD.png" /></a>
		</div>
		<div>
			<a href="${ pageContext.request.contextPath}/cash/autoCharge"> <img
				src="${ pageContext.request.contextPath}/resources/img/etc/autoCharge01.png" /></a>
		</div>
		<form class="cash_option" name="cOption">

			<button class="btn btn-outline-primary1" style="background-color:#e9cecb" id="cashKind1" type="button" onclick="javascript:scan()" value="1">$40,000</button>
			<button class="btn btn-outline-primary1" style="background-color:#e9cecb" id="cashKind2" type="button" onclick="javascript:scan()" value="2">$60,000</button>
			<button class="btn btn-outline-primary1" style="background-color:#e9cecb" id="cashKind3" type="button" onclick="javascript:scan()" value="3">$100,000</button>
			<button class="btn btn-outline-primary1" style="background-color:#e9cecb" id="cashKind4" type="button" onclick="javascript:scan()" value="4">$200,000</button>
			<button class="btn btn-outline-primary1" style="background-color:#e9cecb" id="cashKind5" type="button" onclick="javascript:scan()" value="5">$400,000</button>
			<button class="btn btn-outline-primary1" style="background-color:#e9cecb" id="cashKind6" type="button" onclick="javascript:scan()" value="6">$1,000,000</button>
		</form>
		<h2 class="mb-4"><strong>결제수단</strong></h2>
		<hr>
		<input type="radio" name="pay" value="credit" onclick="javascript:check()" checked="checked"> <strong>신용/체크카드</strong>
		<button type="button" class="btn btn-outline-primary1" style="background-color:#e9cecb" id="card" onclick="javascript:addCard()"><strong>+카드등록</strong></button>
		
		<form action="${ pageContext.request.contextPath}/cash/credit"> 
		</form>
			
			<br> <input type="radio" name="pay" value="phonePay" onclick="javascript:check()"> <strong>휴대폰</strong>
				<input type="radio" name="pay" value="money" onclick="javascript:check()" checked="checked"><strong>무통장입금</strong>
	
		<form action="${ pageContext.request.contextPath}/cash/money"
			method="post" name="money">
			<table>
				<tr>
				<td colspan="2"><select name="account">
					<option value="입금계좌">입금계좌</option>
					<option value="KB">국민은행 :: 122-102-04-102727</option>
				</select></td>
				</tr>
				
				<tr>
				 <td><strong>입금자명 : </strong> </td>
				<td> <input type="text" placeholder="입금자명"></td><br>
				</tr>
				</table>
		</form>
		<hr>
		<h4><strong>현금영수증</strong></h4><br>
		<input type="radio" name="receipt" value="true" checked="checked">신청 
		<input type="radio" name="receipt" value="false">신청안함 
		<br>
		<table>
			<tr>
				<td><input type="radio" name="option" checked="checked">개인</td>
				<td><select name="tel1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="019">019</option>
					</select> -
					<input type="text" size="5" maxlength="4" name="tel2"> -
					<input type="text" size="5" maxlength="4" name="tel3">
				</td> 
				
				<td> <input type="radio" name="option">사업자</td>
				<td><input type="text" id="r_compNum"></td>
			</tr>
		</table>
		<form action="${ pageContext.request.contextPath}/cash/pay" method="post" name="cash">
			<button class="btn btn-outline-primary1" style="background-color:#dfcae9" id="cashKind_seq" name="cashKind_seq" type="submit" disabled="disabled"> 결제하기</button>
			<button class="btn btn-outline-primary1" style="background-color:#e9cecb" id="cashKind_seq1" name="cashKind_seq" type="submit" value="1">$40,000 결제하기</button>
			<button class="btn btn-outline-primary1" style="background-color:#e9cecb" id="cashKind_seq2" name="cashKind_seq" type="submit" value="2">$60,000 결제하기</button>
			<button class="btn btn-outline-primary1" style="background-color:#e9cecb" id="cashKind_seq3" name="cashKind_seq" type="submit" value="3">$100,000 결제하기</button>
			<button class="btn btn-outline-primary1" style="background-color:#e9cecb" id="cashKind_seq4" name="cashKind_seq" type="submit" value="4">$200,000 결제하기</button>
			<button class="btn btn-outline-primary1" style="background-color:#e9cecb" id="cashKind_seq5" name="cashKind_seq" type="submit" value="5">$400,000 결제하기</button>
			<button class="btn btn-outline-primary1" style="background-color:#e9cecb" id="cashKind_seq6" name="cashKind_seq" type="submit" value="6">$1,000,000 결제하기</button>
		</form>
	</div>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>

<script>

	$(document).ready(function(){
		$("#cashKind_seq").show();
		$("#cashKind_seq1").hide();
		$("#cashKind_seq2").hide();
		$("#cashKind_seq3").hide();
		$("#cashKind_seq4").hide();
		$("#cashKind_seq5").hide();
		$("#cashKind_seq6").hide();
		
		$("#cashKind1").click(function(){
			$("#cashKind_seq").hide();
			$("#cashKind_seq1").show();
			$("#cashKind_seq2").hide();
			$("#cashKind_seq3").hide();
			$("#cashKind_seq4").hide();
			$("#cashKind_seq5").hide();
			$("#cashKind_seq6").hide();
		});
		$("#cashKind2").click(function(){
			$("#cashKind_seq").hide();
			$("#cashKind_seq1").hide();
			$("#cashKind_seq2").show();
			$("#cashKind_seq3").hide();
			$("#cashKind_seq4").hide();
			$("#cashKind_seq5").hide();
			$("#cashKind_seq6").hide();
		});
		$("#cashKind3").click(function(){
			$("#cashKind_seq").hide();
			$("#cashKind_seq1").hide();
			$("#cashKind_seq2").hide();
			$("#cashKind_seq3").show();
			$("#cashKind_seq4").hide();
			$("#cashKind_seq5").hide();
			$("#cashKind_seq6").hide();
		});
		$("#cashKind4").click(function(){
			$("#cashKind_seq").hide();
			$("#cashKind_seq1").hide();
			$("#cashKind_seq2").hide();
			$("#cashKind_seq3").hide();
			$("#cashKind_seq4").show();
			$("#cashKind_seq5").hide();
			$("#cashKind_seq6").hide();
		});
		$("#cashKind5").click(function(){
			$("#cashKind_seq").hide();
			$("#cashKind_seq1").hide();
			$("#cashKind_seq2").hide();
			$("#cashKind_seq3").hide();
			$("#cashKind_seq4").hide();
			$("#cashKind_seq5").show();
			$("#cashKind_seq6").hide();
		});
		$("#cashKind6").click(function(){
			$("#cashKind_seq").hide();
			$("#cashKind_seq1").hide();
			$("#cashKind_seq2").hide();
			$("#cashKind_seq3").hide();
			$("#cashKind_seq4").hide();
			$("#cashKind_seq5").hide();
			$("#cashKind_seq6").show();
		});
	
	});
	
</script>
