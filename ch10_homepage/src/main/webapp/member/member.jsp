<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 창</title>
<style>
	body {
		background-color: #FFE8FF;
		margin: 0;
        padding: 0;
        padding-top: 30px;
        display: flex;
        justify-content: center;
	}
	table {
        border: 1px solid;
        border-collapse: collapse;
        width: 1100px;
    }
    th, td {
        border: 1px solid;
        height:30px;
    }
	th {
		background-color: #D1B2FF;
	}
	
</style>

<script src="script.js?v=<%=System.currentTimeMillis() %>"></script>
<!-- 주소 가져오기 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function findAddr() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            let roadAddr = data.roadAddress;  	// 도로명 주소
	            let jibunAddr = data.jibunAddress;	// 지번 주소
	            let extraAddr = '';					// 동이나 빌딩명을 넣을 변수
	            
	            document.getElementById("postcode").value = data.zonecode; // 우편번호
	            
	            if(data.userSelectedType == 'R') {  // 사용자가 도로명 주소 선택
	            	if(data.bname != '') {
	            		extraAddr += data.bname;		// 동이름
	            	}
	            	if(data.buildingName != '') {
	            		extraAddr += ', ' + data.buildingName;	// 빌딩명
	            	}
	            	roadAddr += extraAddr != '' ? '(' + extraAddr + ')' : '';          	
	            	document.getElementById("addr").value = roadAddr;
	            	
	            } else {		// 사용자가 지번 주소 선택
	            	if(data.buildingName != '') {
	            		extraAddr += ', ' + data.buildingName;	// 빌딩명
	            	}
	            	jibunAddr += extraAddr != '' ? '(' + extraAddr + ')' : '';
	            	document.getElementById("addr").value = jibunAddr;
	            }
	            document.getElementById('detailAddr').focus();
	        }
	    }).open();
	}
</script>

</head>
<body>
	<form name="frm" method ="post" action="memberProc.jsp">
		<table border="1">
			<tr>
				<th colspan="3" align="center">회원가입</th>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input name="id" onkeydown="inputIdChk();">							 	
					<input type="button" value="ID중복확인" onclick="idCheck(this.form.id.value);"> 
					<input type="hidden" name="idBtnCheck" value="idUncheck">
				</td>
				<td>영문과 숫자로만 입력</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd"></td>
				<td>특수기호, 영문, 숫자가 각 1개 이상씩 들어가야되고 8글자 이상 작성</td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="repwd"></td>
				<td>위의 비밀번호를 한번 더 작성</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input name="name" required></td>
				<td>한글로 입력</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="gender" value="1" checked>남&emsp;&emsp;
					<input type="radio" name="gender" value="2" >여
				</td>
				<td>성별을 선택</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input name="birthday"></td>
				<td>6글자로 입력 ex)010101</td>
			</tr>
			<tr>
				<td>E-mail</td>
				<td><input type="email" name="email" size="40"></td>
				<td>ex) email@naver.com</td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td>
					<input name="zipcode" id="postcode" readonly>
					<input type="button" value="우편번호 찾기" onclick="findAddr();">
				</td>
				<td>우편번호 검색</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<input name="address" id="addr" size="60" readonly><br/>
					<input name="detail_address" id="detailAddr" placeholder="상세주소 넣기">
				</td>
				<td>상세주소가 있으면 입력</td>
			</tr>
			<tr>
				<td>취미</td>
				<td><input type="checkbox" name="hobby" value="인터넷" checked>인터넷&nbsp;
					<input type="checkbox" name="hobby" value="여행">여행&nbsp;
					<input type="checkbox" name="hobby" value="게임">게임&nbsp;
					<input type="checkbox" name="hobby" value="영화">영화&nbsp;
					<input type="checkbox" name="hobby" value="운동">운동</td>
				<td>취미를 선택</td>
			</tr>
			<tr>
				<td>직업</td>
				<td>
					<select name="job">
						<option value="0" selected>직업선택
						<option value="회사원">회사원
						<option value="공무원">공무원
						<option value="의사">의사
						<option value="법조인">법조인
						<option value="학생">학생
						<option value="교수">교수
						<option value="기타">기타
						</select>
				</td>
				<td>직업을 선택</td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<input type="button" value="회원가입" onclick="inputCheck();">&emsp;
					<input type="reset" value="다시쓰기">&emsp;
					<input type="button" value="로그인" onclick="location.href='login.jsp'">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>