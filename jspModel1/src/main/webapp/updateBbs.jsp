<%@page import="dto.MemberDto"%>
<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	MemberDto login = (MemberDto)session.getAttribute("login");

	if(login == null) {
		%>
		<script>
			alert('please login');
			location.href = "login.jsp";
		</script>
		<%
	}
	
	int seq = Integer.parseInt( request.getParameter("seq"));	
	BbsDao dao = BbsDao.getInstance();
	
	BbsDto dto = dao.getBbs(seq);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
</head>
<body>

<div align="center">
	<form action="updateAf.jsp" method="post">
		<table border="1" style="width: 70%">
			<tr>
				<th>작성자</th>
				<td><%=dto.getId() %></td>
				<input hidden name="id" value=<%=login.getId()%>>				
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" id="title" size="50" placeholder="제목기입" value="<%=dto.getTitle()%>">
				</td>
	
			</tr>		
	
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="20" cols="50px" name="content" placeholder="내용기입"><%=dto.getContent() %></textarea>
				</td>
			</tr>
		</table>
		<input hidden name="seq" value=<%=dto.getSeq()%>>
		<input hidden name="ref" value=<%=dto.getRef()%>>	
		<input hidden name="step" value=<%=dto.getStep()%>>	
		<input hidden name="depth" value=<%=dto.getDepth()%>>	
		<input hidden name="readcount" value=<%=dto.getReadcount()%>>		
		<button type="button" onclick="location.href='bbslist.jsp'">글목록</button>
		<button type="submit">수정</button>
	</form>

</div>

</body>
</html>