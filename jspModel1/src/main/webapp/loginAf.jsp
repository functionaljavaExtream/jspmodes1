<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	MemberDao dao = MemberDao.getInstance();
	
	MemberDto mem = dao.login(id, pwd);
	
	if(mem != null) {
		// 로그인 회원정보
		// request.getSession()
		session.setAttribute("login", mem);
		// session.setMaxInactiveInterval(60*60*2);
		%>
		<script type="text/javascript">
			alert("Welcome <%= mem.getId() %>");
			location.href = "./bbslist.jsp";
		</script>
		<%	
	} else {
		%>
		<script type="text/javascript">
			alert("please check your id or pwd");
			location.href = "login.jsp";
		</script>
		<%			
	}

%>


<script type="text/javascript">

</script>
