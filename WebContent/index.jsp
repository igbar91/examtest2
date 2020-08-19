<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스마트공장 공정관리 프로그램 ver2019-09</title>
</head>
<style>
.div1{
background:lightgray;
}
.div2{
background:blue;
padding:10px;
}
.div2 span a{
color:white;
text-decoration:none;
}

footer{
margin-top:130px;
background:lightgray;
padding:10px;
text-align:center;
}

div{
text-align:center;
}
</style>
<body>
<%
String center = request.getParameter("center");

if(center==null){
	
 center = "productLookUp.jsp";

}

%>
<header>
<div class="div1">
	<h1>(과정평가형 정보처리산업기사)스마트공장 공정관리 프로그램 ver2019-09</h1></div>
<div class="div2">
<span><a href="index.jsp?center=productLookUp.jsp">제품조회</a></span>
<span><a href="index.jsp?center=WorkCodeLookUp.jsp">작업지시서조회</a></span>
<span><a href="index.jsp?center=WorkRegister.jsp">작업공정등록</a></span>
<span><a href="index.jsp?center=WorkLookUp.jsp">작업공정조회</a></span>
<span><a href="index.jsp">홈으로</a></span>
</div>
</header>		

<div >		
<jsp:include page="<%=center %>" />	</div>

<footer>
<h3>HRDKOREA Copyrightc2019 All rights reserved. Human Resources Development Service of Korea</h3></footer>

</body>
</html>