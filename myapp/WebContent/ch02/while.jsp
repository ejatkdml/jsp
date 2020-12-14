<%@page import="ch02.MyUtil"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		//while.html¿¡¼­ msg, number
		String msg = request.getParameter("msg");
		int number = Integer.parseInt(request.getParameter("number"));
		int count = 0;
		while(number>count){
		%>
			<b style="color: <%=MyUtil.randomColor()%>"><br>
			<%=msg%></b>
		<%	
			count++;
		}
%>





