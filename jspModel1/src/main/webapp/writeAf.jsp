
<%@page import="dao.BbsDao"%>
<%@page import="dto.BbsDto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	System.out.println(id);
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	BbsDto dto = new BbsDto(id, title, content);
	
	BbsDao dao = BbsDao.getInstance();
	
	boolean result = dao.writeBbs(dto);
	if(result) {
		%>
		<script type="text/javascript">
			alert("write successfull");
			location.href = "bbslist.jsp"
		</script>
		<% 
	}else {
		%>
		<script type="text/javascript">
			alert("write failed");
			location.href = "bbswrite.jsp"
		</script>
		<%
	}

%>