<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vote.*, java.util.*" %>
<jsp:useBean id="vDao" class="vote.VoteDao" />
<%
	int num = 0;
	if(!(request.getParameter("num") == null || request.getParameter("num").equals("")))      
		num = Integer.parseInt(request.getParameter("num"));
	
	VoteList vlist = vDao.getOneVote(num);
	ArrayList<String> vitem = vDao.getItem(num);
		
	String question = vlist.getQuestion();
	int type = vlist.getType();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
<title>설문폼</title>
<style>
	* { margin: 0 auto; }
	.vform { width:300px; }
	.btn {
		border: none;
		color: white;
		padding: 5px;
		cursor: pointer;
		border-radius: 5px !important;
		margin-right: 20px !important;
		padding: 5px 15px;
	}
</style>
</head>
<body>
	<div class="vform">
		<form action="voteFormProc.jsp" method="post">
			<table class="table table-success">
				<tr>
					<td>Q : <%=question %></td>
				</tr>
				<tr>
					<td>
					<%
						for(int i=0; i<vitem.size(); i++) {
							String item = vitem.get(i);
							if(type == 1) {
								out.print("<p><input type='checkbox' name='itemnum' value='"+ i +"'>");
							} else {
								out.print("<p><input type='radio' name='itemnum' value='"+ i +"'>");
							}
							out.print("&ensp;" +item + "<p/>");
						}
					%>	
					</td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="submit" value="투표" class="btn">&emsp;&emsp;
						<input type="button" value="결과" class="btn" 
							   onclick="window.open('voteView.jsp?num=<%=num %>', 'voteView', 'width= 500', 'height= 350')">
					</td> 
				</tr>
			</table>
			<input type="hidden" name="num" value="<%=num %>">
		</form>
	</div>
</body>
</html>