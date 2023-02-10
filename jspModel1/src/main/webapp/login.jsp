<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.6.3.js"
  integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
  crossorigin="anonymous"></script>
 <script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
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
<h2>login page</h2>

<div class="center">
	<form action="loginAf.jsp" method="post">
		<table border="1">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" id="id" name="id" size="20"><br>
					 <input type="checkbox" id="chk_save_id" >id 저장<br>
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<input type="password" name="pwd" size="20"><br>
					 
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="Log-in">
					<a href="regi.jsp">회원가입</a>
					
				</td>
			</tr>
						
			
		</table>
	
	
	</form>

</div>

<script type="text/javascript">

/*
	cookie : id저장, pw 저장 == String
	session : login한 정보  == Object

 
 */

 let user_id = $.cookie("user_id");
 
 if(user_id != null) {
	 $("#id").val(user_id);
	 $("#chk_save_id").prop("checked",true);
 }
 
 $("#chk_save_id").click(function () {
		
		if( $("#chk_save_id").is(":checked") == true ){
			
			if( $("#id").val().trim() == "" ){
				alert('id를 입력해 주십시오');
				$("#chk_save_id").prop("checked", false);
			}else{
				// cookie를 저장
				$.cookie("user_id", $("#id").val().trim(), { expires:7, path:'./' });
			}
			
		}else{
			$.removeCookie("user_id", { path:'./' });
		}	
	});
 
 
 
 
</script>


</body>

</html>