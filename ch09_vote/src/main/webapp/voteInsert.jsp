<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문 작성</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
	* { margin: 0 auto; }
	body { background-color: #FAF4C0; }
	div { width: 600px; }
	table { table-layout: fixed; width: 100%; }
	td { vertical-align: middle; }
	h2,h5 { text-align: center; }
	.m30 { margin-top: 30px; }
</style>
</head>
<body>
	<div>
		<h2 class="m30">투표 프로그램</h2>
		<hr>
		
		<h5 class="m30">설문 작성</h5>
		<hr>
		<form action="voteInsertProc.jsp" method="post">
			<table class="table table-success">
				<tr>
					<td width="20%">질문</td>
					<td colspan="2">q: <input name="question" size="52"></td>
				</tr>
				<tr>
					<td rowspan="6">항목</td>
					<%
						for(int i=1; i<=4; i++) {
							out.print("<td>" + (i*2-1) + " :<input name='item'></td>");
							out.print("<td>" + (i*2) + " :<input name='item'></td>");
							out.print("</tr>");
							if(i<4) {
								out.print("<tr>");
							}
						}
					%>
					<tr>
						<td colspan="2">시작일&emsp;&emsp;&emsp;
							<select name="sdateY">
							<%
								for(int i=2025; i<2036; i++) {
									out.print("<option value='" + i +"'>" + i + "</option>");
								}
							%>
							</select> 년
							<select name="sdateM">
							<%
								for(int i=1; i<13; i++) {
									out.print("<option value='" + i +"'>" + i + "</option>");
								}
							%>
							</select> 월
							<select name="sdateD">
							<%
								for(int i=1; i<32; i++) {
									out.print("<option value='" + i +"'>" + i + "</option>");
								}
							%>
							</select> 일
						</td>
					</tr>
					<tr>
						<td colspan="2">종료일&emsp;&emsp;&emsp;
							<select name="edateY">
							<%
								for(int i=2025; i<=2035; i++) {
									out.print("<option value='" + i +"'>" + i + "</option>");
								}
							%>
							</select> 년
							<select name="edateM">
							<%
								for(int i=1; i<=12; i++) {
									out.print("<option value='" + i +"'>" + i + "</option>");
								}
							%>
							</select> 월
							<select name="edateD">
							<%
								for(int i=1; i<=31; i++) {
									out.print("<option value='" + i +"'>" + i + "</option>");
								}
							%>
							</select> 일
						</td>
					</tr>
					<tr>
						<td>이중답변</td>
						<td colspan="2">
							<input type="radio" name="type" value="1" checked>Yes&emsp;&emsp;
							<input type="radio" name="type" value="0">No
						</td>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<input type="submit" value="작성하기">&emsp;
							<input type="reset" value="다시쓰기">&emsp;
							<input type="button" value="목록보기" onclick="location.href='voteList.jsp'">
						</td>
					</tr>
			</table>
		</form>
		
	</div>

</body>
</html>