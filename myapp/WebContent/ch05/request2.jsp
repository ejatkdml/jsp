<%@page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		String protocol = request.getProtocol();
		int port = request.getServerPort();
		String remoteAddr = request.getRemoteAddr();
		String requestURI = request.getRequestURI();
		StringBuffer requestURL = request.getRequestURL();
		String query = request.getQueryString();
%>
프로토콜 : <%=protocol%><br>
Port : <%=port%><br>
컴퓨터주소 : <%=remoteAddr%><br>
요청경로(URI) : <%=requestURI%><br>
요청경로(URL) : <%=requestURL%><br>
조건 : <%=query%><br>






