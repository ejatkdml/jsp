<!-- showGuestBook.jsp -->
<%@page import="guestbook.GuestBookBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="guestbook.GuestBookMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String id = (String)session.getAttribute("idKey");
		if(id==null){
			//현재 접속된 url값
			StringBuffer url = request.getRequestURL();
			response.sendRedirect("login.jsp?url="+url);
			return;//이후에 jsp 코드 실행 안됨.
		}
%>
<html>
<title>GuestBook</title>
<script type="text/javascript">
	function updateFn(num) {
		url = "updateGuestBook.jsp?num="+num;
		window.open(url,"GuestBook Update","width=520,height=300");
	}
	function commentFn(frm) { //this.form
		if(frm.comment.value==""){
			alert("내용을 입력하세요.");
			frm.comment.focus();
			return;
		}
		frm.submit();
	}
	function disFn(num) {
	
	}
</script>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#996600">
<div align="center">
<%@include file="postGuestBook.jsp" %>
<table width="520" cellspacing="0" cellpadding="3">
	<tr bgcolor="#F5F5F5"> 
		<td><b><%=login.getName()%></b></td>
		<td align="right"><a href="logout.jsp">로그아웃</a></b></td>
	</tr>
</table>
<!-- GuestBook List Start -->
<%
		Vector<GuestBookBean> vlist = 
			mgr.listGuestBook(id,login.getGrade());
		//out.print(vlist.size());
		if(vlist.isEmpty()){
%>
<table width="520" cellspacing="0" cellpadding="7">
	<tr>
		<td>등록된 글이 없습니다.</td>
	</tr>
</table>
<%}else{
		for(int i=0;i<vlist.size();i++){	
			//방명록글
			GuestBookBean bean = vlist.get(i);
			//방명록 글쓴이
			JoinBean writer = mgr.getJoin(bean.getId());
%>
<table  width="520" border="1" bordercolor="#000000" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<table bgcolor="#F5F5F5">
				<tr>
					<td width="225">NO : <%=vlist.size()-i%></td>					
					<td width="225">
						<img src="img/face.bmp" border="0" alt="이름">
						<a href="mailto:<%=writer.getEmail()%>"><%=writer.getName() %></a>
					</td>					
					<td width="150" align="center">
						<%if(writer.getHp()==null||writer.getHp().equals("")){%>
							홈페이지가 없네요.
						<%}else{%>
						<a href="http://<%=writer.getHp()%>">
							<img alt="홈페이지 " src="img/hp.bmp" border="0">
						</a>
						<%}%>
					</td>					
				</tr>
				<tr>
					<td colspan="3"><%=bean.getContents() %></td>					
				</tr>
				<tr>
					<td>IP : <%=bean.getIp()%></td>					
					<td><%=bean.getRegdate()+" "+bean.getRegtime()%></td>					
					<td>
					<% 
							//수정, 삭제 : 로그인 id와 글쓴이 id가 동일 활성
							//삭제 : 관리자
							//비밀글 : secret이 1일때 
							boolean chk = login.getId().equals(writer.getId());
							if(chk||login.getGrade().equals("1")){
								if(chk){
							%>
								<a href="javascript:updateFn()">[수정]</a>
							<%}//---if2%>
								<a href="deleteGuestBook.jsp">[삭제]</a>
							<%if(bean.getSecret().equals("1")){%>	
							비밀글
							<%
								}//---if3
							}//---if1
					%>
					</td>						
				</tr>
			</table>
		</td>
	</tr>
</table>		
<%
		}//---for
	}//---else
%>	
<!-- GuestBook List End -->
</div>
</body>
</html>










