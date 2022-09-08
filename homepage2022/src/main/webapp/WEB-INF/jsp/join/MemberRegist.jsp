<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="ko" >
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>수업용 게시판</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

<!-- BBS Style -->
<link href="/asset/BBSTMP_0000000000001/style.css" rel="stylesheet" />
<!-- 공통 Style -->
<link href="/asset/LYTTMP_0000000000000/style.css" rel="stylesheet" />

<div class="wrap">
	<form id="frm" name="frm" method="post" action="/join/insertMember.do" 
		onsubmit="return regist();">
		<input type="hidden" name="loginType" value="${searchVO.loginType}"/>
		<input type="hidden" id="idCheckAt" value="N"/>
		
		<table class="mT50 mB50">
			<tbody>
				<tr>
					<th>아이디</th>
					<td>
					<input type="text" id="emplyrId" name="emplyrId"/>
					<button type="button" id="btn-id-check" class="btn">아이디 중복 검사</button>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" id="userNm" name="userNm"/></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" id="password" name="password"/></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" id="password2"/></td>
				</tr>
				<tr>
					<th>비밀번호 힌트</th>
					<td><input type="text" id="passwordHint" name="passwordHint"/></td>
				</tr>
				<tr>
					<th>비밀번호 정답</th>
					<td><input type="text" id="passwordCnsr" name="passwordCnsr"/></td>
				</tr>
			</tbody>
		</table>
		
		<div class="btn-cont ac">
			<button type="submit" class="btn spot">가입</button>
		</div>
	</form>
</div>

<script>
$(document).ready(function(){
	//아이디 중복 검사
	$("#btn-id-check").click(function(){
		var emplyrId = $("#emplyrId").val();
		
		if(emplyrId){
			$.ajax({
				url : "/join/duplicateCheck.do",
				type : "post",
				data : {"emplyrId" : emplyrId},
				dataType : "json",
				success : function(data){
					if(data.successYn == "Y"){
						alert("사용가능한 ID입니다.");
						$("#idCheckAt").val("Y");
					}else{
						alert(data.message);
						$("#idCheckAt").val("N");
					}
				}, error : function(){
					alert("error");
				}
			});
		}else{
			alert("ID를 입력해주세요.");
		}
	});
});

//validation 체크
function regist(){
	//아이디 중복 검사 체크
	if($("#idCheckAt").val() != "Y"){
		alert("아이디 중복 검사를 해주세요.");
		return false;
	}else if(!$("#emplyrId").val()){
		alert("아이디를 입력해주세요.");
		return false;
	}else if(!$("#userNm").val()){
		alert("이름을 입력해주세요.");
		return false;
	}else if(!$("#password").val()){
		alert("비밀번호를 입력해주세요.");
		return false;
	}else if(!$("#password2").val()){
		alert("비밀번호 확인을 입력해주세요.");
		return false;
	}else if(!$("#passwordHint").val()){
		alert("비밀번호 힌트를 입력해주세요.");
		return false;
	}else if(!$("#passwordCnsr").val()){
		alert("비밀번호 정답을 입력해주세요.");
		return false;
	}else if($("#password").val() != $("#password2").val()){
		alert("비밀번호와 비밀번호 확인 정보가 다릅니다.");
		return false;
	}
}
</script>

</body>
</html>