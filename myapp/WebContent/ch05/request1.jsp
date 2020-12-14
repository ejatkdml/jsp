<!-- request1.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%
		//post 방식으로 요청된 값들에 대한 인코딩 설정
		request.setCharacterEncoding("EUC-KR");
		//String request = null;
		String name = request.getParameter("name");
		String studentNum = request.getParameter("studentNum");
		String gender = request.getParameter("gender");
		String major = request.getParameter("major");
		String hobby[] = request.getParameterValues("hobby");
%>
성명 : <%=name %><br>
학번 : <%=studentNum %><br>
성별 : <%=gender %><br>
전공 : <%=major %><br>
추미 : <%
				for(int i=0;i<hobby.length;i++){
					out.println(hobby[i]+"&nbsp;");//표현식 같은 기능
				}
		%>
		
		
		
		
		
		
		
		
		



