<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link href="/asset/front/css/style.css" rel="stylesheet" />

<!-- 전체 레이어 시작 -->
<div id="wrap">
	<!-- header -->
	<header class="site-header">
		<div class="wrap">
			<div class="util">
				<c:choose>
					<c:when test="${empty USER_INFO.id}">
						<a href="/login/egovLoginUsr.do" class="login">로그인</a>&nbsp;&nbsp;
						<a href="/join/memberType.do">회원가입</a>
					</c:when>
					<c:otherwise>
						<a href="/login/actionLogout.do"><c:out value="${USER_INFO.name}"/>님 로그아웃</a>
					</c:otherwise>
				</c:choose>
			</div>
			<h1 class="logo"><a href="/index.do"><img src="/asset/front/images/common/logo.png" alt="폴리텍 스마트소프트웨어과 웹진 로고"/></a></h1>
			<div class="date">
				<span class="year">2022</span>
				<span class="month">08</span>
			</div>
			<nav class="gnb">
				<a href="/index.do">홈</a>
				<a href="/board/selectList.do">게시판</a>
			</nav>
		</div>
	</header>
	<!-- //header -->