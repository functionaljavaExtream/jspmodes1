<%@page import="dto.MemberDto"%>
<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

MemberDto login = (MemberDto)session.getAttribute("login");
if(login == null){
	%>
	<script>
	alert('로그인 해 주십시오');
	location.href = "login.jsp";
	</script>
	<%
}	
	int seq = Integer.parseInt( request.getParameter("seq") );
	BbsDao dao = BbsDao.getInstance();
	
	BbsDto dto = dao.getBbs(seq);
	if(dto == null) {
		%>
		<script type="text/javascript">
			alert("readcount error")
			location.href="bbslist.jsp"
		</script>		
		<%	
				
	}

%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>
</head>
<body>
<div align="center">
	<table border="1" style="width: 70%">
		<tr>
			<th>작성자</th>
			<td><%=dto.getId() %></td>
			
		</tr>
		<tr>
			<th>제목</th>
			<td><%=dto.getTitle()%></td>

		</tr>
		<tr>
			<th>작성일</th>
			<td><%=dto.getWdate() %></td>
		</tr>
	
		<tr>
			<th>조회수</th>
			<td><%=dto.getReadcount() %></td>
		</tr>
		
		<tr>
			<th>정보</th>
			<td></td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea rows="" cols="">
					<%=dto.getContent() %>
				</textarea> 
			</td>
		</tr>
	</table>
	<button type="button" onclick="location.href='bbslist.jsp'">글목록</button>
	<button type="button" onclick="answerBbs(<%=seq%>)">답글</button>
<%
if(dto.getId().equals(login.getId())){
	%>
	<button type="button" onclick="updateBbs(<%=dto.getSeq() %>)">수정</button>
	
	<button type="button" onclick="deleteBbs(<%=dto.getSeq() %>)">삭제</button>
	<%
}
%>



</div>

<script type="text/javascript">

function answerBbs(seq) {
	location.href = "answer.jsp?seq=" + seq;
}

function updateBbs(seq) {
	location.href="updateBbs.jsp?seq=" + seq;
}

function deleteBbs(seq) {
	location.href="deleteBbs.jsp?seq=" + seq; // update del = 1
}





</script>

</body>
</html>