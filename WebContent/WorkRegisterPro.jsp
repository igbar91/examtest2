<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="ssssSmartFactory.productDAO" %>
     <%@ page import="ssssSmartFactory.RegisterBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업공정등록프로</title>
</head>
<body>
<body>

	<h2 align="center">회원정보 보기 </h2>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
//취미부분은 별도로 다시 이러들여서 빈클래스에 저장합니다.
 String[] preparestuff = request.getParameterValues("preparestuff");
 String savehobby1 = "";
 //배열에 있는 내용을 하나의 스트림으로 저장. 
 for(int i=0; i<preparestuff.length; i++){
	 savehobby1+=preparestuff[i]+"";
 }
%>
<%
//취미부분은 별도로 다시 이러들여서 빈클래스에 저장합니다.
 String[] printstep = request.getParameterValues("printstep");
 String savehobby2 = "";
 //배열에 있는 내용을 하나의 스트림으로 저장. 
 for(int i=0; i<printstep.length; i++){
	 savehobby2+=printstep[i]+"";
 }
%>
<%
//취미부분은 별도로 다시 이러들여서 빈클래스에 저장합니다.
 String[] coatingstep = request.getParameterValues("coatingstep");
 String savehobby3 = "";
 //배열에 있는 내용을 하나의 스트림으로 저장. 
 for(int i=0; i<coatingstep.length; i++){
	 savehobby3+=coatingstep[i]+"";
 }
%>
<%
//취미부분은 별도로 다시 이러들여서 빈클래스에 저장합니다.
 String[] hapjistep = request.getParameterValues("hapjistep");
 String savehobby4 = "";
 //배열에 있는 내용을 하나의 스트림으로 저장. 
 for(int i=0; i<hapjistep.length; i++){
	 savehobby4+=hapjistep[i]+"";
 }
%>
<%
//취미부분은 별도로 다시 이러들여서 빈클래스에 저장합니다.
 String[] togetherstep = request.getParameterValues("togetherstep");
 String savehobby5 = "";
 //배열에 있는 내용을 하나의 스트림으로 저장. 
 for(int i=0; i<togetherstep.length; i++){
	 savehobby5+=togetherstep[i]+"";
 }
%>
<%
//취미부분은 별도로 다시 이러들여서 빈클래스에 저장합니다.
 String[] boxingstep = request.getParameterValues("boxingstep");
 String savehobby6 = "";
 //배열에 있는 내용을 하나의 스트림으로 저장. 
 for(int i=0; i<boxingstep.length; i++){
	 savehobby6+=boxingstep[i]+"";
 }
%> 
 
 
  <!-- 저장 property =* < 다 출력 -->
 	<jsp:useBean id="rbean" class="ssssSmartFactory.RegisterBean">
 		<jsp:setProperty name="rbean" property="*"/>
 
 	</jsp:useBean>
<%



 //기존 취미는  주소번지가 저장되므로 별도의 내용을 하나의 스트림으로 저장한 변수에 다시 입력
rbean.setPreparestuff(savehobby1);
rbean.setPrintstep(savehobby2);
rbean.setCoatingstep(savehobby3);
rbean.setHapjistep(savehobby4);
rbean.setTogetherstep(savehobby5);
rbean.setBoxingstep(savehobby6);

//데이터베이스에 클래스 객체를 생성. MemberDAO > java class 이름. 
productDAO rdao = new productDAO();
 rdao.inputRegister(rbean);
 
		
		//회원을 마쳤으면 회원정보 보기 화면으로 이동
%>		
		<script>
		alert('공정이 등록되었습니다.');
		</script>
<%		response.sendRedirect("WorkLookUp.jsp");
 
 
 %>
</body>
</body>
</html>