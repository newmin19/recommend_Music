<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	body{text-align: center;}
	.music1{float:left;}
	.music2{float:left;}
	#fb-root{clear:both;}
	.music_select{width: 850px; margin: 0 auto;}
</style>
<title>음악 추천 앱!</title>
</head>
<body>
	<h1>음악추천앱</h1>
	<div class="fb-like" data-href="http://apps.facebook.com/recommendmusic" data-send="false" data-layout="button_count" data-width="745" data-show-faces="true"></div>
	<p>두개의 음악 중 하나를 선택하세요!</p>
	<div class="music_select">
		<div class="music1">
			<iframe width="420" height="315"
			src="http://www.youtube.com/embed/TCxc5S8Dg2c?rel=0" frameborder="0"
			allowfullscreen></iframe>
			<br>
			<button>test1</button>
		</div>
		
		<div class="music2">
			<iframe width="420" height="315"
			src="http://www.youtube.com/embed/TCxc5S8Dg2c?rel=0" frameborder="0"
			allowfullscreen></iframe>
			<br>
			<button>test2</button>
		</div>	
	</div>
	<br>
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
	</script>

	<div id="fb-root"></div>
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/ko_KR/all.js#xfbml=1&appId=195587603918028";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>
	
	
	<!-- 단추 달 곳에 붙이는 코드 -->
	<br>
</body>
</html>