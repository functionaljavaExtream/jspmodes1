<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<script
  src="https://code.jquery.com/jquery-3.6.3.js"
  integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
  crossorigin="anonymous"></script>
<style type="text/css">
.center{
	margin:auto;
	width: 60%;
	border: 3px solit #ff0000;
	padding: 10px;
}

</style>  
  
</head>
<body>

<h2>회원가입</h2>

<p>환영합니다</p>

<div class="center">
	<form action="regiAf.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="id" id="id" size="20">
					<p id="idcheck" style="font-size: 8px"></p>
					<input type="button" id="idChkBtn" value="IDcheck">
				</td>			
			</tr>
			<tr>
				<td>패스워드</td>
				<td>
					<input type="text" name="pwd" id="pwd" size="20">
				</td>
			
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="name" size="20">
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type="email" name="email" size="20">				
				</td>				
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="회원가입">
				</td>
			</tr>
		</table>	
	</form>

</div>

<script type="text/javascript">
$(document).ready(function() {
	$("#idChkBtn").click(function() {
		
		// id의 빈칸 조사가 필요하다.
		
		$.ajax({
			type:"post",
			url:"idcheck.jsp",
			data:{ "id":$("#id").val() },
			success: function(msg) {
				// alert(msg.trim());
				if(msg.trim() == "YES") {
					$("#idcheck").css("color", "#0000ff");
					$("#idcheck").text("id available");
				}else {
					$("#idcheck").css("color", "#ff0000");
					$("#idcheck").text("id unAvailable");
					$("#id").val("");					
				}				
			},
			error: function() {
				alert('error');
			}
		})
	})
})

</script>

</body>
</html>