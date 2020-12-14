<%@page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		//if.html에서 name, color 값을 던졌다. -> 받아야 한다.
		//request 객체를 통해서 넘어 온다.
		String name = request.getParameter("name");
		String color = request.getParameter("color");
		String msg = "";
		if(color.equals("blue")){
			msg = "파란색";
		}else if(color.equals("red")){
			msg = "빨간색";
		}else if(color.equals("orange")){
			msg = "오렌지색";
		}else{
			msg = "기타";
			color = "white";
		}
%>
<body bgcolor="<%=color%>">
	<%=name%>님 좋아하는 색상은 <%= color %>입니다.
</body>
















