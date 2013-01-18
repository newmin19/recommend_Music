<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	body{text-align: center;}
	.music1{float:left;}
	.music2{float:left;}
	#fb-root{clear:both;}
	.music_select{width: 850px; margin: 0 auto;}
</style>
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
			windows.open("apps.facebook.com/recommendmusic/",'self','', false);
			 //window.open(
				//		'http://www.facebook.com/dialog/oauth/?scope=email,user_birthday&client_id=195587603918028&redirect_uri=http://203.253.207.139:80/testMovie/response.jsp&response_type=token',
				//		'_top', '', false);
		}
		
		sLogin();
	</script>

</head>
<body>
<h1>음악추천앱</h1>
<p>두 음악중 하나를 선택하세요!!</p>
<div class="fb-like" data-href="http://apps.facebook.com/recommendmusic/" data-send="false" data-width="450" data-show-faces="false" data-font="arial"></div>
	<div class="music_select">
		<div class="music1">
			<iframe width="350" height="263"
			src="http://www.youtube.com/embed/TCxc5S8Dg2c?rel=0" frameborder="0"
			allowfullscreen></iframe>
			<br>
			<button>test1</button>
		</div>
		<div class="music2">
			<iframe width="350" height="263"
			src="http://www.youtube.com/embed/TCxc5S8Dg2c?rel=0" frameborder="0"
			allowfullscreen></iframe>
			<br>
			<button>test2</button>
		</div>	
	</div>
	<div id="fb-root"></div>
	<script>(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/ko_KR/all.js#xfbml=1&appId=195587603918028";
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
	</script>
</body>
</html>