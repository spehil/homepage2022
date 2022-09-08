<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

	<!-- footer -->
	<footer class="site-footer">
		<div class="wrap">
			<figure>
				<img src="/asset/front/images/common/logo_footer.png" alt="한국폴리텍대한 대전캠퍼스 스마트소프트웨어과 로고"/>
			</figure>
			<address>[34503] 대전광역시 동구 우암로 352-21</address>
			<p>COPYRIGHT 2022 BY KOREA POLYTECHNICS. ALL RIGHTS RESERVED.</p>
		</div>
	</footer>
	<!-- //footer -->
</div>
<!-- //전체 레이어 끝 -->

<div class="dim"></div>
<!-- 로그인 -->
<div class="layer-popup layer-login" style="display:none;">
	<header class="layer-header">
		<span class="logo">
			<span class="img-logo">한국폴리텍대학 대전캠퍼스 스마트소프트웨어학과</span>
		</span>
		<button type="button" class="layer-close"><span>팝업 닫기</span></button>
	</header>
	<div class="layer-body">
		<form action="/login/actionLogin.do" id="frmLogin" name="frmLogin" method="post" onsubmit="return vali()">
			<input type="hidden" name="userSe" value="USR"/>
			<input type="hidden" id="loginType" name="loginType" value=""/>
			<fieldset>
				<legend>로그인을 위한 아이디/비밀번호 입력</legend>
				<div class="ipt-row">
					<input type="text" id="loginId" name="id" placeholder="아이디" required="required">
				</div>
				<div class="ipt-row">
					<input type="password" id="loginPw" name="password" placeholder="비밀번호" required="required">
				</div>
				<button type="submit" class="btn-login"><span>로그인</span></button>
				<br/>
				<a class="btn-kakao" href="#" data-type="login">
  					<img src="http://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="388" alt="카카오 로그인 버튼"/>
				</a>
			</fieldset>
		</form>
	</div>
</div>

<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
$(document).ready(function(){
	//로그인
	$(".login").click(function(){
		$(".dim, .layer-login").fadeIn();
		return false;
	});
	
	//레이어닫기
	$(".layer-close").click(function(){
		$(".dim, .layer-login").fadeOut();
		return false;
	});
	
	//카카오 로그인 버튼
	$(".btn-kakao").click(function(){
		const type = $(this).data("type"); 
		kakaoLogin(type);
		return false;
	});
});

function vali(){
	if(!$("#loginId").val()){
		alert("아이디을 입력해주세요.");
		$("#loginId").focus();
		return false;
	}
	
	if(!$("input[name=loginType]").val()){
		if(!$("#loginPw").val()){
			alert("비밀번호를 입력해주세요.");
			$("#loginPw").focus();
			return false;
		}
	}
}

//카카오 키 정보 입력
Kakao.init('65ffb9ac529a1e24aaf1caf6957548df');

//카카오SDK 초기화
Kakao.isInitialized();

//카카오로그인
function kakaoLogin(type) {
	Kakao.Auth.login({
		success: function (response) {
			Kakao.API.request({
				url: '/v2/user/me',
				success: function (response) {
					console.log(response)
					$("input[name=loginType]").val("KAKAO");
					if(type == "join"){
						$("input[name=emplyrId]").val(response.id);
						$("input[name=userNm]").val(response.properties.nickname);
						
						$("#joinFrm").submit();
					}else{
						$("input[name=id]").val(response.id);
						$("#frmLogin").submit();
					}
				},
          		fail: function (error) {
            		console.log(error)
          		},
        	})
      }, fail: function (error) {
			console.log(error)
      },
    })
}

<c:if test="${not empty message}">
	alert("${message}");
</c:if>

<c:if test="${not empty loginMessage}">
	alert("${loginMessage}");
</c:if>

</script>