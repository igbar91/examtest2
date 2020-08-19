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
String workcode=request.getParameter("workcode");

productDAO pdao = new productDAO();
RegisterBean rbean = pdao.updateWorkRegister(workcode);

%>


	<h1>작업공정수정</h1>
	
	<form method="post" action="WorkRegisterPro.jsp">
	<table align="center">
	
	
	<tr>
	<td>작업지시번호</td>
	<td><input type="text" name="workcode" value="<%=rbean.getWorkcode()%>">예)20190001</td>
	</tr>
	<tr>
	<td>재료준비</td>
	<td>
	<input type="checkbox" name="preparestuff" value="<%=rbean.getPreparestuff() %>" >완료
	<input type="checkbox" name="preparestuff" value="<%=rbean.getPreparestuff() %>">작업중</td></tr>
	
		<tr>
	<td>인쇄공정</td>
	<td><input type="checkbox" name="printstep" value="<%=rbean.getPrintstep() %>" >완료
	<input type="checkbox" name="printstep" value="<%=rbean.getPrintstep() %>">작업중</td></tr>
	
		<tr>
	<td>코팅공정</td>
	<td><input type="checkbox" name="coatingstep" value="<%=rbean.getCoatingstep() %>">완료
	<input type="checkbox" name="coatingstep" value="<%=rbean.getCoatingstep() %>">작업중</td></tr>

			<tr>
	<td>합지공정</td>
	<td><input type="checkbox" name="hapjistep" value="<%=rbean.getHapjistep() %>" >완료
	<input type="checkbox" name="hapjistep" value="<%=rbean.getHapjistep() %>">작업중</td></tr>
	
			<tr>
	<td>접합공정</td>
	<td><input type="checkbox" name="togetherstep" value="<%=rbean.getTogetherstep() %>">완료
	<input type="checkbox" name="togetherstep" value="<%=rbean.getTogetherstep() %>">작업중</td></tr>
	
				<tr>
	<td>포장공정</td>
	<td><input type="checkbox" name="boxingstep" value="<%=rbean.getBoxingstep() %>" >완료
	<input type="checkbox" name="boxingstep" value="<%=rbean.getBoxingstep() %>">작업중</td></tr>
	
	<tr>
	<td>최종작업일자</td>
	<td><input type="text" name="totalday" value="<%=rbean.getTotalday()%>">예)20190101</td></tr>
	<tr>
	<td>최종작업시간</td>
	<td><input type="text" name="totaltime" value="<%=rbean.getTotaltime()%>">예)1300</td>
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