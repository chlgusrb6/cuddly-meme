<%@page import="kr.or.ddit.web.modulize.ServiceType"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String mem_id = (String) session.getAttribute("authMember");
	String cmdParam = request.getParameter("command");
	int statusCode = 0;
	String includePage = null;
	if(StringUtils.isNotBlank(cmdParam)){
		try{
			ServiceType sType = ServiceType.valueOf(cmdParam.toUpperCase());
			includePage = sType.getServicePage();
		}catch(IllegalArgumentException e){
			statusCode = HttpServletResponse.SC_NOT_FOUND;		
		}
	}
	
	if(statusCode!=0){
		response.sendError(statusCode);
		return;
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<%=request.getContextPath() %>/css/main.css" rel="stylesheet">
<title>/index.jsp</title>

<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
  
</head>

<body>
<div id="top">
	<jsp:include page="/includee/header.jsp"></jsp:include>
<%-- 	<iframe src="<%=request.getContextPath() %>/includee/header.jsp"></iframe> --%>
</div>

<div id="left">
	<jsp:include page="/includee/left.jsp"></jsp:include>
<%-- 	<iframe src="<%=request.getContextPath() %>/includee/left.jsp"></iframe> --%>

</div>
<div id="body">
<!-- parameter가 없을 떄  -->
<!-- parameter가 있을 떄  - 제공할 수 있는 서비스인지 판단. -->
<!-- 				  -O 동적 제공 -->
<!-- 				  -X 상태코드 NotFound  -->
<%
	if(StringUtils.isNotBlank(includePage)){
		pageContext.include(includePage);
	}else{
%>
		<h4>웰컴 페이지</h4>
		<pre>
			처음부터 웰컴 페이지로 접속하거나 
			로그인에 성공해서 웰컴 페이지로 접속하는 경우의 수가 있음.
			<%
		
			if (StringUtils.isBlank(mem_id)) {
		%>
				<a href="<%=request.getContextPath()%>/login/loginForm.jsp">로그인 하러 가기</a>
			<%
				} else {
			%>
				<%=mem_id%>님 로그인 상태, <a
				href="<%=request.getContextPath()%>/login/logout.jsp">로그아웃</a>
			<%
				}
			%>
		</pre>
<%
	}
%>
	</div>
<div id="footer">
	<%
		pageContext.include("/includee/footer.jsp");
	%>
<%-- 		<iframe src="<%=request.getContextPath() %>/includee/left.jsp"></iframe> --%>
</div>
</body>
</html>