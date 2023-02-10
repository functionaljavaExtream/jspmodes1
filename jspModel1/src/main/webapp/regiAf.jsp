<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// encoding utf-8
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	// back-end
	MemberDao dao = MemberDao.getInstance();
	
	MemberDto dto = new MemberDto(id,pwd,name,email,0);
	boolean isS = dao.addMember(dto);
	if(isS) {
		%>
		<script type="text/javascript">
			alert("join success");
			location.href = "login.jsp"
		</script>
		<% 
	}else {
		%>
		<script type="text/javascript">
			alert("join failed");
			location.href = "regi.jsp"
		</script>
		<%
	}
 %>
    
    
<script type="text/javascript">
	

</script>