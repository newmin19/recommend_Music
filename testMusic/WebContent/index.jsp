<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	페이스북 앱을 로딩중 입니다.

	<div id="fb-root"></div>
	<script src="http://connect.facebook.net/ko_KR/all.js"></script>
	<script>
		var sAppID = "195587603918028";
		FB.init({
			appId : sAppID,
			status : true, // check login status
			cookie : true, // enable cookies to allow the server to access the session
			xfbml : true
		// parse XFBML
		});

 		function sLogin() { //로그인 함수 <로그인 버튼이 누를때 동작>
			FB.getLoginStatus(function(response) {
				if (response.session) { //로그인 되어 있는 상태
					LoginSuccessGo(); //로그인 성공후에 실행되는 함수
				} else { //로그인이 안되어 있는 상태       
					FB.login(function(response) {
						LoginSuccessGo();
					}, {
						perms : 'publish_stream,email'
					});
				}
			});
		}

		function LoginSuccessGo() {
			 window
				.open(
						'http://www.facebook.com/dialog/oauth/?scope=email,user_birthday&client_id=195587603918028&redirect_uri=http://203.253.207.139:80/testMovie/response.jsp&response_type=token',
						'_top', '', false);
		}
		
		sLogin();
	</script>
</body>
</html>