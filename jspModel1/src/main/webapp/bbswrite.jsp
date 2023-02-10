<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	MemberDto login = (MemberDto)session.getAttribute("login");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>

<div align="center">
	<form action="writeAf.jsp" method="post">
		<table border="1">
			<col width="200"><col width="400">
			<tr>
				<td>id</td>
				<td>					
					<%=login.getId()%>
					<input hidden name="id" value=<%=login.getId()%>>
				</td>			
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="title" id="title" size="50px" placeholder="제목기입">
				</td>
			
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="20" cols="50px" name="content" placeholder="내용기입"></textarea>
				</td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<button type="submit" value="글쓰기">글쓰기</button>
				</td>
			</tr>
		</table>	
	</form>
</div>



</body>
</html>