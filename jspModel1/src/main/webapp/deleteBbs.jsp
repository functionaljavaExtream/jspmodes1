<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int seq = Integer.parseInt(request.getParameter("seq"));
	
	BbsDao dao = BbsDao.getInstance();
	
	boolean isS = dao.deleteBbs(seq);
	if(isS) {
		%>
		<script>
			alert("글삭제 성공");
			location.href = "bbslist.jsp";
		</script>
		<%	
	} else {
		%>
		<script>
			alert("글삭제 실패");
			let seq = <%=seq%>;
			location.href = "bbsdetail.jsp?seq="+seq;
		</script>		
		<%
	}
%>    

<script type="text/javascript">
	
</script>
