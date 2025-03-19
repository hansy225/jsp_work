<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h3>JSTL Function Library</h3>
	
	<c:set var="str" value="How are you?" />
	str : ${ str } <br><br>
	
	문자열의 길이 : ${ str.length() } <br>
	문자열의 길이 : ${ fn:length(str) } <br><br>
	
	모두 소문자로 출력 : ${ fn:toLowerCase(str) } <br>
	모두 대문자로 출력 : ${ fn:toUpperCase(str) } <br><br>
	
	are의 시작 인덱스 : ${ fn:indexOf(str, 'are') } <br>
	are을 were로 변경 : ${ fn:replace(str, 'are', 'were') } <br><br> <!-- 원본은 안바뀜 -->

	str : ${ str } (원본 변경X) <br>
	
	<c:if test="${ fn:contains(str, 'ware') }">
		포함되어있음
	</c:if>
	

</body>
</html>