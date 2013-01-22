<%@page import="recommendMusic.DBUploader"%>
<%@page import="recommendMusic.FacebookData"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
			String email = request.getParameter("email");
			String sex = request.getParameter("sex");
			String birthDay = request.getParameter("birthday");
			String music = request.getParameter("music");
			String hometown_city = request.getParameter("hometown_city");
			String current_city = request.getParameter("current_city");
			
			FacebookData fbd = new FacebookData();
			fbd.setEmail(email);
			fbd.setSex(sex);
			fbd.setBirthDay(birthDay);
			fbd.setMusic(music);
			
			DBUploader a = new DBUploader();
			a.userDataUploader(fbd);
	%>
</body>
</html>