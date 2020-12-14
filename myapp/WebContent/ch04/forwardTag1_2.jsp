<!-- forwardTag1_2.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
%>
<!-- 이 페이지가 클라이언트에게 응답된다. -->
id : <%=id%><br>
pwd : <%=pwd%><br>