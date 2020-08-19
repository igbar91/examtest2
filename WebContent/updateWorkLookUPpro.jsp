<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ page import="ssssSmartFactory.RegisterBean" %>
    <%@ page import="ssssSmartFactory.productDAO" %>
     <%@ page import = "java.util.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업공정수정</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>

		<jsp:useBean id="rbean" class="ssssSmartFactory.RegisterBean">
			<jsp:setProperty name="rbean" property="*"/>
		</jsp:useBean>

<%
		productDAO pdao = new productDAO();
			pdao.update(rbean);
%>
			<script>
		alert("회원수정이 완료되었습니다!");
		history.go(-1);
		</script>

			
		
</body>
</html>