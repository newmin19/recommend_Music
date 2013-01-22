<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body {
	text-align: center;
}

.music1 {
	float: left;
}

.music2 {
	float: left;
}

#fb-root {
	clear: both;
}

.music_select {
	width: 850px;
	margin: 0 auto;
}
</style>
<script src="//connect.facebook.net/ko_KR/all.js"></script>
</head>
<body>
	<h1>음악추천앱</h1>
	<p>두 음악중 하나를 선택하세요!!</p>
	<div class="fb-like"
		data-href="http://apps.facebook.com/recommendmusic/" data-send="false"
		data-width="450" data-show-faces="false" data-font="arial"></div>
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
	<script>
		window.fbAsyncInit = function() {
			FB.init({
				appId : 195587603918028,
				status : true, // check login status
				cookie : true, // enable cookies to allow the server to access the session
				xfbml : true
			// parse XFBML
			});
			
			// XXX FQL Permission Scope setting
			FB.login(function(response) {
				LoginSuccessGo(response);
			}, {
				scope : 'publish_stream,email,user_location,user_hometown'
			});
		};

		
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.async = true;
			js.src = "//connect.facebook.net/ko_KR/all.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
		
		function LoginSuccessGo(response) {
			//windows.open("apps.facebook.com/recommendmusic/", 'self', '', false);
			//window.open(
			//		'http://www.facebook.com/dialog/oauth/?scope=email,user_birthday&client_id=195587603918028&redirect_uri=http://apps.facebook.com/recommendmusic/&response_type=token',
			//		'_top', '', false);
			//getUser(response);
			getUser(response);
			document.user.submit;
		}
	
		function getUser(response) {
				FB.api(
					{
						method : 'fql.query',
						query : 'select uid,email,sex,birthday_date,hometown_location,current_location,music from user where uid  = "'
								+ response.authResponse.userID + '"'
					}, function(response) {
						for ( var i = 0; i < response.length; i++) {
							
							
							document.user.email.value = response[i].email != null ? response[i].email : "none";
							document.user.sex.value = response[i].sex != null ? response[i].sex : "none";
							document.user.birthday.value = response[i].birthday_date != null ? response[i].birthday_date : "none";
							document.user.current_city.value = response[i].current_location != null ? response[i].current_location.city : "none";
							document.user.hometown_city.value = response[i].hometown_location != null ? response[i].hometown_location.city : "none";
							document.user.music.value = response[i].music != "" ? response[i].music : "none";
							

							console.log(response[i]);
							document.user.submit.click();
						}
					});
		}
	</script>
	<form name="user" action="Insert.jsp">
		<input type="text" name="email" />
		<input type="text" name="current_city" />
		<input type="text" name="hometown_city" />
		<input type="text" name="birthday" />
		<input type="text" name="music" />
		<input type="text" name="sex" />
		<input type="submit" name="submit">
	</form>
</body>
</html>