<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Open Platform Prototype </title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>  
<script type="text/javascript" src="/testMovie/js/planetxsdk-1.0.0.js"></script>
<script type="text/javascript"> 

	$( function () {  
		PlanetX.init( {
			// 본인의 appkey 정보 입력
			appkey : "fbc419c3-f932-3b6d-88c6-26da2df54235" , 

			// 본인의 client id 정보 입력
			client_id : "d6f8396a-7244-3ccb-91d5-61e35648fb8c",  

			// 본인의 redirect uri 정보 입력
			redirect_uri : "http://localhost:8080/",                   

			// 앱에서 접근할 수 있는 서비스 리스트
			scope : ""   
		} );
	});

	function melon () {
		PlanetX.api( "get", "http://apis.skplanetx.com/melon/charts/realtime?count=20&page=0&version=1", "JSON", { "version" : 1 }, melon_callback ); 
	}

	function melon_callback ( data ) {
		var titleElement,
			resultElement,
			playList;


		titleElement = "<h2> melon Top 100 </h2>" ;
		resultElement = $("#melon");
		playList = data.melon.songs.song; 

		for ( var i= 0 ; i < playList.length ; i++  ) {
			titleElement += playList[i].artists.artist[0].artistName + "  -  " + playList[i].songName + "<br>"; 
		}

		resultElement.html( titleElement );
	}
</script>
</head>

<body>

	<h1>melon Top 100!! </h1>
	<p>
	<button onclick="melon()">melon category</button>
	<div id='melon'></div>
	</p>

</body>
</html>