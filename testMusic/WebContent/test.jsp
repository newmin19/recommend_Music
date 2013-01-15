<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<script src="http://connect.facebook.net/ko_KR/all.js#xfbml=1"
		language="JavaScript" type="text/javascript"></script>
	<script>
		window.fbAsyncInit = function() {
			FB.init({appId : '195587603918028',
				status : true,
				cookie : true,
				xfbml : true,
				oauth : true,
			});
			FB.Canvas.setSize({
				width : 810,
				height : 2000
			});
			FB.Canvas.setAutoResize();
		};

		// 좋아요 눌렀을 경우
		FB.Event.subscribe("edge.create", function(response) {
			alert(response);
			document.getElementById("status").innerHTML = "LIKE!!!!";
			var cnt = 0;
FB.api(
{
				method : 'fql.query',
				query : 'SELECT like_count, share_count FROM link_stat WHERE "'
						+ response + '" IN url ORDER BY like_count LIMIT 1;'
			}, function(response) {
				alert(response[0].like_count);
				cnt = response[0].like_count;
			});
		});
		// 좋아요 취소시
		FB.Event.subscribe("edge.remove", function(response) {
			alert(response);
			document.getElementById("status").innerHTML = "UNLIKE!!!!";
			var cnt = 0;
FB.api(
{
				method : 'fql.query',
				query : 'SELECT like_count, share_count FROM link_stat WHERE "'
						+ response + '" IN url ORDER BY like_count LIMIT 1;'
			}, function(response) {
				alert(response[0].like_count);
				cnt = response[0].like_count;
			});
		});
	</script>
</head>
<body>
	<DIV id="fb-root"></DIV>
<SPAN id="status"></span>
<fb:like layout="button_count" send="false" href="URL"></fb:like>
<fb:like layout="button_count" send="false" href="URL"></fb:like>



</body>


</html>