<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="ssssSmartFactory.RegisterBean" %>
    <%@ page import="ssssSmartFactory.productDAO" %>
     <%@ page import = "java.util.*" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업공정조회</title>
</head>
<body>
<%
 productDAO pdao = new productDAO();
 Vector<RegisterBean> vec = pdao.outputRegister();
%>

<h1 align="center">작업공정조회</h1>
<table border="1" align="center">
<tr>
<td>
작업지시번호</td>
<td>
제품코드</td>
<td>
제품명</td>
<td>
준비</td>
<td>
인쇄</td>
<td>
코팅</td>
<td>
합지</td>
<td>
집합</td>
<td>
포장</td>
<td>
최종공정일자</td>
</tr>
<%
for(int i=0; i<vec.size(); i++){
	RegisterBean rbean = vec.get(i);

%>

<tr>
<td>
<a href="index.jsp?center=updateWorkLookUP.jsp?workcode=<%= rbean.getWorkcode() %>"><%= rbean.getWorkcode() %></a></td>
<td>
<%= rbean.getCode() %></td>
<td>
<%= rbean.getProductname() %></td>
<td>
<%= rbean.getPrintstep() %></td>
<td>
<%= rbean.getCoatingstep() %></td>
<td>
<%= rbean.getHapjistep() %></td>
<td>
<%= rbean.getTogetherstep() %></td>
<td>
<%= rbean.getBoxingstep() %></td>
<td>
<%= rbean.getTotalday() %></td>
<td>
<%= rbean.getTotaltime() %>
<%
}
%>

</td>


</tr>





</table>
</body>
</html>