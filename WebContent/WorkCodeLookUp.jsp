<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="ssssSmartFactory.productBean" %>
    <%@ page import="ssssSmartFactory.productDAO" %>
     <%@ page import = "java.util.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

</style>
<body>
<h1 align="center">작업지시서조회</h1>
<%
productDAO pdao = new productDAO();
Vector<productBean> vec = pdao.outputWorkLookUp();
%>
<table align="center">
<tr>
<td>
작업지시번호</td>
<td>
제품코드</td>
<td>
제품명</td>
<td>
제품구격</td>
<td>
제품구분</td>
<td>
수량</td>
<td>
작업시작일</td>

</tr>
<!--  Vector관련 조건문은 무조건 <tr>전에 적어야됨 
tr앞에 적으면 오류남 -->
<%
for(int i=0; i<vec.size(); i++){
	productBean pbean = vec.get(i);

%>
<tr>
<td>
<a href="index.jsp?center=WorkRegister.jsp?workcode=<%= pbean.getWorkcode()%>"><%= pbean.getWorkcode()%></a>
</td>
<td>
<%= pbean.getCode() %>
</td>
<td>
<%= pbean.getProductname() %>
</td>
<td>
<%= pbean.getProductsize() %>
</td>
<td>
<%= pbean.getProductdif() %>
</td>
<td>
<%= pbean.getQuantity() %>
</td>
<td>
<%= pbean.getStartdate() %>
</td>


<%
}
%>
</tr>


</table>


</body>
</html>