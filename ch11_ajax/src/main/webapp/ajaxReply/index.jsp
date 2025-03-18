<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax로 댓글 달기</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
	* { margin: 0 auto; }
	body { text-align: center; margin-top: 30px; }
	img { width: 650px; }
	table { width: 640px; border: 2px solid; border-collapse: collapse; }
	.comment-content { text-align: left; } 
</style>
</head>
<body>
	<img src="img.jpg">
	<br><br>
	
	<table id="output1" border="1">
		<thead>
			<tr>
				<th>댓글 작성</th>
				<td>
					<textarea row="3" cols="50" id="content"></textarea>
				</td>
				<td><input type="button" id="btn1" value="댓글 등록"></td>
			</tr>
		</thead>
		<tbody>
		
		</tbody>
	</table>
	
	<script>
		$(() => {
			replyList();
		})	
		
		function replyList() {
			$.ajax({
				url: "rlist.bo",
				data: {bnum: 1},
				success: function(list){
					 let value = "";
					 for(let i=0; i<list.length; i++) {
						 value += "<tr>"
						 		+ "	<td>" + list[i].name + "</td>"
						 		+ "	<td>" + list[i].content + "</td>"
						 		+ "	<td>" + list[i].rdate.substring(0,10) + "</td>"
						 		+ "</tr>";	 
					 }
					 $('#output1 tbody').html(value);
				},
				error: function() {
					console.log("ajax통신 실패");
				}
			})
		}
		
		
		$(() => {
			$('#btn1').click(function() {
				$.ajax({
					url: "rInsert.bo",
					data: {
						content: $('#content').val(),
						bnum: 1,
						name: "짱구"
					},
					type: "post",
					success: function(result) {
						if(result > 0) {
							replyList();
						}
					},
					error: function() {
						console.log("ajax통신 실패");
					}
				})
			})
		})
	</script>

</body>
</html>