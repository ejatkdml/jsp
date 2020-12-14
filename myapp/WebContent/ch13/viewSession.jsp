<!-- viewSession.jsp -->
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		String id = (String)session.getAttribute("logID");
		String pwd = (String)session.getAttribute("logPWD");
		out.println(id + " : " + pwd +"<br>");
		//技记狼 积疙林扁
		out.println("技记狼 积疙林扁 : " + session.getMaxInactiveInterval()/60+"盒");
		out.println("<p>");
		//技记俊 历厘等 按眉甫 葛滴 啊廉坷扁
		Enumeration<String> names = session.getAttributeNames(); 
		while(names.hasMoreElements()){
			String name = names.nextElement();
			Object obj = session.getAttribute(name);
			out.println("session name : " + name+"<br>");
			out.println("session value : " + obj+"<p>");
		}
%>
<a href="createSession.jsp">技记按眉积己</a>













