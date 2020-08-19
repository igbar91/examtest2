<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="ssssSmartFactory.productBean" %>
    <%@ page import="ssssSmartFactory.productDAO" %>
     <%@ page import = "java.util.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업공정등록</title>
</head>
<body>
<%
productDAO pdao = new productDAO();
productBean pbean = new productBean();
%>


	<h1>작업공정등록</h1>
	<form method="post" action="WorkRegisterPro.jsp">
	<table align="center">
	<tr>
	<td>작업지시번호</td>
	<td><input type="text" name="workcode" value="<%=pbean.getWorkcode()%>">예)20190001</td>
	</tr>
	<tr>
	<td>재료준비</td>
	<td><input type="checkbox" name="preparestuff" value="재료준비완료" >완료
	<input type="checkbox" name="preparestuff" value="재료준비작업중">작업중</td></tr>
	
		<tr>
	<td>인쇄공정</td>
	<td><input type="checkbox" name="printstep" value="인쇄공정완료" >완료
	<input type="checkbox" name="printstep" value="인쇄공정작업중">작업중</td></tr>
	
		<tr>
	<td>코팅공정</td>
	<td><input type="checkbox" name="coatingstep" value="코팅공정완료">완료
	<input type="checkbox" name="coatingstep" value="코팅공정작업중">작업중</td></tr>

			<tr>
	<td>합지공정</td>
	<td><input type="checkbox" name="hapjistep" value="합지공정완료" >완료
	<input type="checkbox" name="hapjistep" value="합지공정작업중">작업중</td></tr>
	
			<tr>
	<td>접합공정</td>
	<td><input type="checkbox" name="togetherstep" value="접합공정완료">완료
	<input type="checkbox" name="togetherstep" value="접합공정작업중">작업중</td></tr>
	
				<tr>
	<td>포장공정</td>
	<td><input type="checkbox" name="boxingstep" value="포장공정완료" >완료
	<input type="checkbox" name="boxingstep" value="포장공정작업중">작업중</td></tr>
	
	<tr>
	<td>최종작업일자</td>
	<td><input type="text" name="totalday">예)20190101</td></tr>
	<tr>
	<td>최종작업시간</td>
	<td><input type="text" name="totaltime">예)1300</td>
	</tr>
	
	<tr>
	<td>
	<input type="submit" value="공정등록"></td>
	<td>
	<button type="button">공정수정 </button></td>
	<td><input type="reset" value="다시쓰기"></td></tr>
	</table>
	</form>
</body>
</html>