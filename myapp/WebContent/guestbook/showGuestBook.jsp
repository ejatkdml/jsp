<!-- showGuestBook.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
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
	

<!-- GuestBook List End -->
</div>
</body>
</html>










