<%@page import="dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.BbsDao"%>
<%@page import="dto.MemberDto"%>
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
	
	MemberDto dto = new MemberDto();


%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
</head>
<body>

<%
	BbsDao dao = BbsDao.getInstance();

	List<BbsDto> list = dao.getBbsList();

%>



<h1>게시판</h1>

<div align="center"></div>

	<table border="1">
		<col width="70"><col width="600"><col width="100"><col width="150">
		<thead>
			<tr>
				<th>번호</th><th>제목</th><th>조회수</th><th>작성자</th>
			</tr>
		</thead>
		<tbody>
		<%
			if(list == null || list.size() == 0) {
				
			%>	
				<tr>
					<td colspan="4">작성된 글이 없습니다. </td>				
				</tr>				
			<%				
			} else {
				for(int i=0;i<list.size(); i++) {
					BbsDto bbsdto = list.get(i); 
					%>
					<tr>
						<th><%=i + 1%></th>
						<th><%=bbsdto.getTitle() %></th>
						<th><%=bbsdto.getReadcount()%></th>
						<th><%=bbsdto.getId() %></th>
					</tr>				
					<%
				}
			}
		%>	
		</tbody>	
	</table>
	<br>
	<a href="bbswrite.jsp">글쓰기</a>

</div>


</body>
</html>