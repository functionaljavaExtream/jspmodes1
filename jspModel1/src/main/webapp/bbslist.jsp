<%@page import="dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.BbsDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!

// 답글의 화살표 함수
public String arrow(int depth) {
	String img = "<img src='./img/arrow.png' width='20px' height='20px'>";
	String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";
	
	String ts = "";
	for(int i=0; i<depth; i++) {
		ts += nbsp;
	}
	
	return depth==0?"":ts+img;
}


%>


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
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
</head>
<body>

<%
String choice = request.getParameter("choice");
String search = request.getParameter("search");

if(choice == null) {
	choice = "";
}
if(search == null) {
	search = "";
} 

BbsDao dao = BbsDao.getInstance();

// 현재 페이지 넘버
String sPageNumber = request.getParameter("pageNumber");
int pageNumber = 0;
if(sPageNumber != null && !sPageNumber.equals("")) {
	pageNumber = Integer.parseInt(sPageNumber);
}

// List<BbsDto> list = dao.getBbsSearchList(choice,search);

List<BbsDto> list = dao.getBbsPageList(choice, search, pageNumber);

// 글의 총수
int count = dao.getAllBbs(choice, search);

// 페이지의 총수
int pageBbs = count/10; // 10개씩 총글의 수를 나눔 

if((count%10)>0) {
	pageBbs = pageBbs +1;
}

%>



<h1>게시판</h1>

<div align="center">

	<table border="1">
		<col width="70"><col width="600"><col width="100"><col width="150">
		<thead>
			<tr>
				<th>번호</th><th>제목</th><th>조회수</th><th>작성자</th><th>댓글상황</th>
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
						<%
							if(bbsdto.getDel() == 0) {
								%>
						<td>
						<%=arrow(bbsdto.getDepth()) %>
							<a href="bbsDetail.jsp?seq=<%=bbsdto.getSeq()%>">
								<%=bbsdto.getTitle() %>							
							</a>
						</td>
								<%
							} else if(bbsdto.getDel() == 1){
								%>
								<td align="center">
									<font color="#ff0000">*** 이 글은 작성자에 의해서 삭제되었습니다. ***</font>
								</td>
								<%
							}
						%>

						<td><%=bbsdto.getReadcount()%></td>
						<td><%=bbsdto.getId() %></td>
						<td><%=bbsdto.getRef()%>-<%=bbsdto.getStep() %>-<%=bbsdto.getDepth()%> </td>
					</tr>				
					<%
				}
			}
		%>	
		</tbody>	
	</table>
	<br>
	<%
		for(int i=0; i<pageBbs; i++) {
			if(pageNumber == i) {
				%>
				<span style="font-size: 15pt; color: #0000ff; font-weight: bold;">
					<%=i+1 %>
				</span>
				<%
			} else {
				%>
				<a href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)"
					style="font-size: 15pt; color:#000; fornt-weight:bold; text-decoration:none;">
					[<%=i+1 %>]		
				</a>
				<%
			}
		}
	
	%>
	<br><br>
	<select id="choice">
		<option value="">검색</option>
		<option value="title">제목</option>
		<option value="content">내용</option>		
		<option value="writer">작성자</option>
	
	</select>
	
	<input type="text" id="search" value="">
	
	<button type="button" onclick="searchBtn()">검색</button>
	
	<a href="bbswrite.jsp">글쓰기</a>

</div>

<script type="text/javascript">
	
	let search = "<%=search %>";

	if(search != "") {
		let obj = document.getElementById('choice');
		obj.value = "<%=choice %>";
		obj.setAttribute("selected", "selected");
		let serObj = document.getElementById('search');
		serObj.value = search;
	}
	
	function searchBtn() {
		let choice = document.getElementById('choice').value;
		let search = document.getElementById('search').value;
		/*
				if(choice == "") {
			alert("카테고리를 선택해 주십시오");
			return;
		}
		if(search.trim() == "") {
			alert("검색어를 선택해 주십시오");
			return;
		}
		
		*/

		location.href = "bbslist.jsp?choice=" + choice + "&search=" + search;
	}
	
	function goPage( pageNumber ) {
		let choice = document.getElementById('choice').value;
		let search = document.getElementById('search').value;

		
		location.href = "bbslist.jsp?choice=" + choice + "&search=" + search + "&pageNumber=" + pageNumber;
	}
	
</script>


</body>
</html>