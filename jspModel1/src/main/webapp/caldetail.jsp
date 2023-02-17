<%@page import="dto.CalendarDto"%>
<%@page import="dao.CalendarDao"%>
<%@page import="dto.MemberDto"%>
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
%>        
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 상세</title>
</head>
<body>
<%

int seq = Integer.parseInt(request.getParameter("seq"));  // --  2023
//DB
CalendarDao dao = CalendarDao.getInstance();

CalendarDto dto = dao.getCalendarDetail(seq);
%>

<div align="center">
		<table border="1">
			<col width="200"><col width="500">
			<tr>
				<th>아이디</th>
				<td>
					<%=login.getId() %>
					<input type="hidden" name="id" value="<%=login.getId() %>">
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" size="80" name="title"  value="<%=dto.getTitle() %>">
				</td>
			</tr>
			<tr>
				<th>일정</th>
				<td>
					<input type="date" name="date" id="date" readonly>&nbsp;
					<input type="time" name="time" id="time" readonly>
	
				</td>
			
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="2" align="center">
					<textarea rows="20" cols="80" name="content"><%=dto.getContent() %></textarea>
					
				</td>
			
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button >일정으로</button>					
				</td>
			
			</tr>
		</table>
</div>
<script type="text/javascript">
let rdate = "<%=dto.getRdate()%>";

let year = rdate.substring(0, 4);
let month = rdate.substring(4, 6);
let day = rdate.substring(6, 8);
let hour = rdate.substring(8, 10);
let minuate = rdate.substring(10); 
document.getElementById("date").value = year + "-" + month +"-" + day;
//document.getElementById("date").setAttribute("selected") = year + "-" + month +"-" + day;
document.getElementById("time").value = hour + ":" + minuate;
//document.getElementById("time").setAttribute("selected") = hour + ":" + minuate;


</script>



</body>
</html>