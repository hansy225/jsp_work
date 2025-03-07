<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>if_jsp</title>
</head>
<body>
	<%
		/* 한글이 깨지면 실행
		request.setCharacterEncoding("UTF-8"); */
		String name = request.getParameter("name1");
		String color = request.getParameter("color");
		
		/* 콘솔창에 뜸  */
		System.out.println(name);
		System.out.println(color); 
		
		String koColor = "";
		/* switch(color) {
		case "red" :
			koColor = "빨간색";
			break;
		case "orange" :
			koColor = "주황색";
			break;
		case "yellow" :
			koColor = "노란색";
			break;
		default:
			koColor = "기타";
		} */
		
		if(color.equals("red"))
			koColor = "빨간색";
		else if(color.equals("orange"))
			koColor = "주황색";
		else if(color.equals("yellow"))
			koColor = "노란색";
		else
			koColor = "기타";
	%>
	
	<%-- 
	이름 : <%=name %> <br>
	color : <%=color %> <br> --%>
	
	<b><%=name %></b>님이 좋아하는 색상은 <b><%=koColor %></b>입니다.
	
	
</body>
</html>