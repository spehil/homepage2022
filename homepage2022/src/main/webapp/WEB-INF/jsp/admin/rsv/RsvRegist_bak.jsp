<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<!-- BBS Style -->
<link href="/asset/BBSTMP_0000000000001/style.css" rel="stylesheet" />
<!-- 공통 Style -->
<link href="/asset/LYTTMP_0000000000000/style.css" rel="stylesheet" />
<!-- jQuery UI-->
<script type="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- 위에 jQuery는 달력 -->
<script type="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<!-- 시간을 나타내줌  -->
</head>
<body>
<c:choose>
	<c:when test="${not empty searchVO.resveId}">
		<c:set var="actionUrl" value="/admin/rsv/rsvUpdate.do"/>
	</c:when>
	<c:otherwise>
		<c:set var="actionUrl" value="/admin/rsv/rsvInsert.do"/>
	</c:otherwise>
</c:choose>

<%--기본 URL --%>
<c:url var="_BASE_PARAM" value="">
	<c:param name="searchCondition" value="${searchVO.searchCondition}"/>
	<c:if test="${not empty searchVO.searchKeyword}"><c:param name="searchKeyword" value="${searchVO.searchKeyword}"/></c:if>
</c:url>

<!-- content 시작 -->
<div id="content">
	<div class="container">
		<div id="contents"></div>
			<form action="${actionUrl}" method="post" id="frm" name="frm" onsubmit="return regist()">
				<input type="hidden" name="resveId" value="${result.resveId}"/>
				
				<table class="chart2">
					<caption>예약정보 작성</caption>
					<colgroup>
						<col style="width:150px"/>
						<col />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">프로그램명</th>
								<td>
									<input type="text" id="resveSj" name="resveSj" title="제목입력" class="q3" value="<c:out value="${result.resveSj}"/>"/>
								</td>
							
<tr>
	<th scope="row"> 프로그램종류</td>
	<td>
		<select id="resveSeCode" name="resveSeCode">
			<option value="TYPE01">선착순</option>
			<option value="TYPE02"><c:if test="${result.resveSeCode eq 'type02'}"> selected="selected"</c:if>>승인관리</option>
		</select>
	</td>
	</tr>
<tr>
	<th scope="row">운영기간</td> <!-- 달력으로 제공하지 않으면 사용자마다 yy-mm-dd에 형식을 다르게 적을수 있어서 DATEFORMAT을 맞춰주려고 사용한다. 달력을 사용할때 "readonly="readonly"를 항상 적어준다. -->
	<td>
		<input type="text" id="useBeginTime" class="timepicker" name="useBeginTime" title="운영시작시간" value="<c:out value="${result.useEndTime}"/>"readonly="readonly"/>
	</td>
	</tr>
<tr>
	<td scope="row">신청기간</td>
	<td>
		<input type="text" id="reqstBgnde" class="datepicker" name="reqstBgnde" title="신청시작일" value="<c:out value="${result.reqstBgnde}"/>"readonly="readonly"/>
		~<input type="text" id="reqstEndde"  class="datepicker" name="reqstEndde" title="신청종료일" value="<c:out value="${result.reqstEndde}"/>"readonly="readonly"/>
	</td>
</tr>

<tr>
	<th scope="row">강사명</th>
	<td>
		<input type="text" id="recNm" name="recNm" title="강사명" value="<c:out value="${result.recNm}"/>"/>
	</td>
	</tr>
<tr>	
	<th scope="row">신청인원수</th>
	<td>
		<input type="number" id="maxAplyCnt" name="maxAplyCnt" title="신청인원수" value="<c:out value="${result.maxAplyCnt}"/>"/>
	</td>
	
	
<tr>
		<th scope="row">내용</th>
		<td>
			<textarea id="resveCn" name="resveCn" rows="15" title="내용입력">
				<c:out value="${result.resveCn}"/>
			</textarea>
		</td>
  	  </tr>
	</tbody>
</table>
<div class="btn-cont ar">
	<c:choose>
		<c:when test="${not empty searchVO.resveId}">
			<c:url var="uptUrl" value="/admin/rsv/rsvRegist.do${_BASE_PARAM}">
				<c:param name="resveId" value="${result.resveId}"/>
			</c:url>
			<a href="${uptUrl}" id="btn-reg" class="btn">수정</a>
			
			<c:url var="delUrl" value="/admin/rsv/rsvDelete.do${_BASE_PARAM}">
				<c:param name="resveId" value="${result.resveId}"/>
			</c:url>
			<a href="${delUrl}" id="btn-del" class="btn"><i class="ico-del"></i>삭제</a>
		</c:when>
		<c:otherwise>
			<a href="#none" id="btn-reg" class="btn spot">등록</a>
		</c:otherwise>
	</c:choose>
	<c:url var="listUrl" value="/admin/rsv/rsvSelectList.do${_BASE_PARAM}"/>
	<a href="${listUrl}" class="btn">취소</a>
	</div>
	
	
	<!-- content 끝 -->
	
	<script>
	$(document).ready(function(){
		//datepicker
		$(".datepicker").datepicker({
			dateFormat:'yy-mm-dd',
			prevText:'이전 달',
			nextText:'다음 달', 
			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNames:['일','월','화','수','목','금','토'], //기본적으로 일요일부터 시작한다
			dayNamesShort:['일','월','화','수','목','금','토'],
			dayNameMin:['일','월','화','수','목','금','토'],//dayNameMin이 default값이다.
			showMonthAfterYear: true, //년월 or 월년 순인지를 정하는것
			yearSuffix: '년'//달력에 2022뒤에 년을 적어준다
		});
	
		$('.timepicker').timepicker({
			timeFormat: 'HH:mm',
			interval: 60, //분 -60분으로 세팅함.
			minTime: '10',
			maxTime: '18:00',
			startTime: '10:00',
			dropdown: true, 
			scrollerbar: true
			//dropdown박스에 스크롤을 사용한다는 의미 -true로 적어준다.
			//스크립트 박스는 규칙이 있을때만 사용가능하다
		});
		
		//예약정보 등록
		
		$("#btn-reg").click(function(){
				$("frm").submit();
				return false;
		});
		
	//	예약글 삭제
		$("#btn-del").click(function(){
			if(!confirm("삭제하시겠습니까?")){
				return false;
			}
		});
});

function regist(){
	if(!$("resveSj").val()){
		alert("프로그램명을 입력해주세요.");
		return false; 
		//시작일이 종료일보다 늦으면안되고 종료일이 시작일보다 빠를수 없는것을 확인하는 스크립트는 각자 만들어보기 
	}
}
</script>
</body>
</html>
								