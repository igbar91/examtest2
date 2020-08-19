<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="ssssSmartFactory.productBean" %>
    <%@ page import="ssssSmartFactory.productDAO" %>
     <%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품조회</title>
</head>
<body>
<h1>제품조회</h1>
<%
productDAO pdao = new productDAO();
Vector<productBean> vec = pdao.outputProduct();

%> 
<table align="center">
<tr>
<td>
제품코드</td>
<td>
제품명</td>
<td>
제품구격</td>
<td>
제품구분</td>
<td>
제품단가</td>
</tr>
<!--  Vector관련 조건문은 무조건 <tr>전에 적어야됨 
tr앞에 적으면 오류남 -->
<%
for(int i=0; i<vec.size(); i++){
	productBean pbean = vec.get(i);

%>
<tr>
<td>
<%= pbean.getCode()%>
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
<%= pbean.getPrice() %>
</td>

<%
}
%>
</tr>


</table>


</body>
</html>