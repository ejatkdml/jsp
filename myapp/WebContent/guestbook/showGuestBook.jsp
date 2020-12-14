<!-- showGuestBook.jsp -->
<%@page import="guestbook.GuestBookBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="guestbook.GuestBookMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String id = (String)session.getAttribute("idKey");
		if(id==null){
			//���� ���ӵ� url��
			StringBuffer url = request.getRequestURL();
			response.sendRedirect("login.jsp?url="+url);
			return;//���Ŀ� jsp �ڵ� ���� �ȵ�.
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
			alert("������ �Է��ϼ���.");
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
		<td align="right"><a href="logout.jsp">�α׾ƿ�</a></b></td>
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
		<td>��ϵ� ���� �����ϴ�.</td>
	</tr>
</table>
<%}else{
		for(int i=0;i<vlist.size();i++){	
			//���ϱ�
			GuestBookBean bean = vlist.get(i);
			//���� �۾���
			JoinBean writer = mgr.getJoin(bean.getId());
%>
<table  width="520" border="1" bordercolor="#000000" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<table bgcolor="#F5F5F5">
				<tr>
					<td width="225">NO : <%=vlist.size()-i%></td>					
					<td width="225">
						<img src="img/face.bmp" border="0" alt="�̸�">
						<a href="mailto:<%=writer.getEmail()%>"><%=writer.getName() %></a>
					</td>					
					<td width="150" align="center">
						<%if(writer.getHp()==null||writer.getHp().equals("")){%>
							Ȩ�������� ���׿�.
						<%}else{%>
						<a href="http://<%=writer.getHp()%>">
							<img alt="Ȩ������ " src="img/hp.bmp" border="0">
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
							//����, ���� : �α��� id�� �۾��� id�� ���� Ȱ��
							//���� : ������
							//��б� : secret�� 1�϶� 
							boolean chk = login.getId().equals(writer.getId());
							if(chk||login.getGrade().equals("1")){
								if(chk){
							%>
								<a href="javascript:updateFn()">[����]</a>
							<%}//---if2%>
								<a href="deleteGuestBook.jsp">[����]</a>
							<%if(bean.getSecret().equals("1")){%>	
							��б�
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










