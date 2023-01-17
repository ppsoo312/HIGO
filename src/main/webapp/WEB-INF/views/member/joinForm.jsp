<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>

<script>

function checkAll() {
	if (!checkUserId(join.id.value)){
		
		return false;
	}
	if(!checkPassword(join.password.value,join.repw.value)){
		return false;
	}
	if(!checkName(join.name.value)){
		return false;
	}
	if(!checkMail(join.email.value)){
		return false;
	}
	if(!checkTel(join.tel.value)){
		return false;
	}
	if(!checkedChange(join.ad_agree.value)){
		return false;
	}
	
	return true;
}

// 공백확인 함수
function checkExistData(value, dataName){
	if(value == ""){
		alert(dataName + "입력해주세요!");
		return false;
	}
	return true;
}

function checkUserId(id){
	// id 입력확인
	if(!checkExistData(id, "아이디를"))
		return false;
	
	//아이디 정규식
	var idJ = /^[a-z0-9][a-z0-9_\-]{4,12}$/;
	if(!idJ.test(id)){
		alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
		join.id.value ="";
		join.id.focus();
	}
	return true;  //확인 완
}

function checkPassword(password, repw) {
	
    //비밀번호가 입력되었는지 확인하기
    if (!checkExistData(password, "비밀번호를"))
         return false;    
    //비밀번호 확인이 입력되었는지 확인하기
    if (!checkExistData(repw, "비밀번호 확인을"))
        return false;
    
 	// 비밀번호 정규식
    var pwJ = /^[a-zA-z0-9]{4,12}$/; 
    if (!pwJ.test(password)) {
        alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
        join.password.value = "";
        join.password.focus();
        return false;
    }

    //비밀번호와 비밀번호 확인이 맞지 않다면..
    if (password != repw) {
        alert("두 비밀번호가 맞지 않습니다.");
        join.password.value = "";
        join.repw.value = "";
        join.repw.focus();
        return false;
    }

    return true; //확인이 완료되었을 때
} 

function checkName(name){
	if(!checkExistData(name,"이름을"))
		return false;
	
	// 이름 정규식
	var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
	if(!nameJ.test(name)){
		alert("이름이 올바르지 않습니다.");
		return false;
	}
	return true;
}

function checkMail(email){
	//email이 입력되었는지
	if(!checkExistData(email,"이메일을"))
		return false;
	
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if(!mailJ.test(email)) {
		alert("이메일 형식이 올바르지 않습니다!");
		join.email.value ="";
		join.email.foucs();
		return false;
	}
	return true; //확인이 완료되었을 때
}

function checkTel(tel){
	if(!checkExistData(tel,"전화번호를"))
		return false;
	
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	if(!phoneJ.test(tel)){
		alert("전화번호가 올바르게 입력되지않았습니다");
		join.tel.value ="";
		join.tel.foucs();
		return false;
	}
	return true;
}
//중복확인
function checkId(){
	
	const id = document.getElementById("id");
	
	var idJ = /^(?=.*[a-z])[a-z0-9]{4,12}$/;
	
	if(id.value == ""){
		alert("아이디를 입력하십시오!");
		return; 
	}else if(!idJ.test(id.value)){
			alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
			return;
	}
	
	
	
	var method = "POST";
	var param = "id=" + encodeURIComponent(id.value);
	var url = "${ pageContext.request.contextPath }/member/checkId"
	sendRequest(url,param,resultCheckId,method);
}

function resultCheckId() {
	if(xhr.readyState == 4 && xhr.status == 200){
		
		var data = xhr.responseText;
		const check = document.getElementById("check");
		
		check.innerText = "";
		
		
		if(data == '사용 가능한 ID입니다'){
			check.style.cssText="color: blue; font-size: 10px;";
		}else{
			check.style.cssText="color: red; font-size: 10px;";				
		}
		
		check.innerText = data;
	}
	
}	
	
//이메일
function checkEmail(){
	
	const email = document.getElementById("email");
	
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if(email.value == ""){
		alert("이메일을 입력하십시오!");
		return; 
	}else if(!mailJ.test(email.value)){
			alert("이메일 형식이 올바르지 않습니다!");
			return;
	}
	
	
	
	var method = "POST";
	var param = "email=" + encodeURIComponent(email.value);
	var url = "${ pageContext.request.contextPath }/member/checkEmail"
	sendRequest(url,param,resultCheckEmail,method);
}

function resultCheckEmail() {
	if(xhr.readyState == 4 && xhr.status == 200){
		
		var data = xhr.responseText;
		const checkE = document.getElementById("checkE");
		
		checkE.innerText = "";
		
	
		if(data == '사용 가능한 Email입니다'){
			checkE.style.cssText="color: blue; font-size: 10px;";
		}else{
			checkE.style.cssText="color: red; font-size: 10px;";				
		}
		
		checkE.innerText = data;
	}	

}	
	
//전화번호
function checkTel(){
	
	const tel = document.getElementById("tel");
	
	var phoneJ =  /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
	
	if(tel.value == ""){
		alert("전화번호를 입력하십시오!");
		return; 
	}else if(!phoneJ.test(tel.value)){
			alert("번호를 다시 입력해주세요!");
			return;
	}
	
	
	
	var method = "POST";
	var param = "tel=" + encodeURIComponent(tel.value);
	var url = "${ pageContext.request.contextPath }/member/checkTel"
	sendRequest(url,param,resultCheckTel,method);
}

function resultCheckTel() {
	if(xhr.readyState == 4 && xhr.status == 200){
		
		var data = xhr.responseText;
		const checkT = document.getElementById("checkT");
		
		checkT.innerText = "";
		
	
		if(data == '사용 가능한 번호입니다'){
			checkT.style.cssText="color: blue; font-size: 10px;";
		}else{
			checkT.style.cssText="color: red; font-size: 10px;";				
		}
		
		checkT.innerText = data;
	}	

}
	
	


function checkedChange() {
    if($(this).prop("checked")){
        $("label[for="+this.id+"]").text("동의되었습니다.");
        $("label[for="+this.id+"]").css("color","blue");
    }else{
        $("label[for="+this.id+"]").text("동의 해주시기 바랍니다.");
        $("label[for="+this.id+"]").css("color","red");
    }
}

</script>

<%@ include file="/WEB-INF/views/layout/header.jsp" %>

<div class="header text-center">
	<div class="container">
		<div class="row">
			<div class="col-lg-9 mx-auto">
				<h1 class="mb-4">회원 가입</h1>
				<ul class="list-inline">
					<li class="list-inline-item"><a class="text-default"
						href="${ pageContext.request.contextPath }">Home &nbsp; &nbsp;
							/</a></li>
					<li class="list-inline-item text-primary">MEMBER JOIN</li>

				</ul>
			</div>
		</div>
	</div>

</div>

	<div class="container">
		<div class="row">
			<div class="col-lg-8 mx-auto">
		<form action="${ pageContext.request.contextPath }/member/join"
			method="post" name="join" onsubmit="return checkAll()">
			<div class="form-group">
				<div class="id_wrap">
					<label for="id">아이디</label> <input type="text" id ="id"name="id"
									 class="id_input form-control">
						<button type="button" onclick="checkId()">중복확인</button><br>
						<span id="check"></span>
				</div>
				<div class="form-group">
					<label for="password">비밀번호</label> <input type="password"
						name="password"  class="form-control">
				</div>
				<div class="form-group">
					<label for="password">비밀번호 확인</label>
					<input type="password" name="repw" class="form-control">
				</div>
				<div class="form-group">
					<label for="name">이름</label> <input type="text"
						name="name" class="form-control">
				</div>
				<div class="form-group">
					<label for="email">이메일</label> <input type="text"
						name="email" class="form-control">
				</div>
				<div class="form-group">
					<label for="tel">전화번호</label> <input type="text"
						name="tel" class="form-control">
				
		<fieldset class="fieldarea f2">
			<legend><span>이용약관</legend>
				<label for="agreement1"><input id="agreement1" type="checkbox" onclick="checkedChange()" name="ad_agree"> 아래 사항에 동의 합니다.</label>
			<p class="agreeText">
				<span>
				<textarea id="text1" readonly>
					이용약관
				</textarea></span>
			</p>
		</fieldset>
				<div class="join_button_wrap">
					<input type="submit" class="join_button" value="가입하기">
				</div>
			</div>
		</form>
			</div>
		</div>
	</div>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>







