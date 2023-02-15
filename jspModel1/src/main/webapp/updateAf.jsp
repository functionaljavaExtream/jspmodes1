<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	int seq = Integer.parseInt(request.getParameter("seq"));
	int ref =  Integer.parseInt(request.getParameter("ref"));
	int step = Integer.parseInt(request.getParameter("step"));
	int depth = Integer.parseInt(request.getParameter("depth"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int readcount = Integer.parseInt(request.getParameter("readcount"));
	
	BbsDto dto = new BbsDto(seq, id, ref, step, depth, title, content, null, 0,
			readcount);
	
	BbsDao dao = BbsDao.getInstance();
	
	//boolean result = dao.writeBbs(dto);
	boolean result = dao.updateBbs(dto);
	if(result) {
		%>
		<script type="text/javascript">
			alert("update successfull");
			location.href = "bbslist.jsp"
		</script>
		<% 
	}else {
		%>
		<script type="text/javascript">
			alert("update failed");
			location.href = "bbswrite.jsp"
		</script>
		<%
	}

%>    

<script type="text/javascript">
	
</script>
