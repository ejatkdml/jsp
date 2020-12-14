<h1>빈즈 액션 태그를 사용</h1>
<%@page import="ch06.SimpleBean"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="bean" class="ch06.SimpleBean"/>
<!-- SimpleBean bean = new SimpleBean() -->

<jsp:setProperty property="*" name="bean"/>
<!-- 
		String msg = reqeust.getParameter("msg");
		bean.setMsg(msg);
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		bean.setCnt(cnt);
 -->
msg2 : <jsp:getProperty property="msg" name="bean"/><br>
cnt2 : <jsp:getProperty property="cnt" name="bean"/><p>
msg2 : <%=bean.getMsg() %><br>
cnt2 : <%=bean.getCnt()%>






