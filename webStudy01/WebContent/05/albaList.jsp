<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.web.SimpleFormProcessServlet_SEM"%>
<%@page import="kr.or.ddit.vo.AlbasengVO"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="kr.or.ddit.web.SimpleFormProcessServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        
<%
	Map<String,String> gradeMap = (Map<String,String>) application.getAttribute("gradeMap");
	Map<String,String> licenseMap = (Map<String,String>) application.getAttribute("licenseMap");
	AlbasengVO albaVO = (AlbasengVO) application.getAttribute("albaVO");
	Map<String,String> errors = (Map<String,String>) request.getAttribute("errors");
	if(albaVO == null) albaVO = new AlbasengVO();
	if(errors == null) errors = new LinkedHashMap();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05/albaList.jsp</title>
</head>
<body>
<table>
	<thead>
		<tr>
			<th>알바생코드</th>
			<th>이름</th>
			<th>주소</th>
			<th>연락처</th>
		</tr>
	</thead>
	
	<tbody>
		<%
			for(Entry<String, AlbasengVO> entry : SimpleFormProcessServlet_SEM.albasengs.entrySet()){
				%>
				<tr>
					<td><%=entry.getKey() %></td>
					<td><%=entry.getValue().getName() %></td>
					<td><%=entry.getValue().getAddress() %></td>
					<td><%=entry.getValue().getTel() %></td>
				</tr>
				<%
			}
		%>
	</tbody>
	
</table>
</body>
</html>






