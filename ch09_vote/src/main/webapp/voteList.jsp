<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
	* { margin: 0 auto; }
	body { background-color: #FAF4C0; }
	div { width: 800px; }
	h2,h4 { text-align: center; }
	.m30 { margin-top: 30px; }
</style>

</head>
<body>
	<div>
		<h2 class="m30">투표 프로그램</h2>
		<hr>
		
		<h4 class="m30">설 문 폼</h4>
		<jsp:include page="voteForm.jsp" />
		<hr>
		
		<h4 class="m30">설문 리스트</h4>
		<table class="table">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>시작일 ~ 종료일</th>
			</tr>
			<tr>
				<td colspan="3"><button type="button" onclick="location.href='voteInsert.jsp'">설문 작성하기</button></td>
			</tr>
		</table>
	</div>

</body>
</html>