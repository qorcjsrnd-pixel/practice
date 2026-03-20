<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id ="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userGender"/>
<jsp:setProperty name="user" property="userEmail"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
<!-- join.jsp에서 joinAction 으로 보냈을때 처리되는 부분이다. join.jsp 안만들었음.  div, li, ul 해야해서 귀찮아서?-->
	<%
		if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null || user.getUserGender() == null || user.getUserEmail() == null) {
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('입력이 안 된 사항이 있습니다.')'");
			script.println("history.back()");
			script.print("</script>");
		}else{
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			if ( result == -1 ){
				PrintWriter script = response.getWriter();
				script.print("<script>");
				script.print("alert('이미 존재하는 아이디입니다.')'");
				script.println("history.back()");
				script.print("</script>");
			}else{ 
				PrintWriter script = response.getWriter();
				script.print("<script>");
				script.print("location.href='main.jsp'");
				script.print("</script>");
			}
		
			
		}
	
	%>>
</body>
</html>