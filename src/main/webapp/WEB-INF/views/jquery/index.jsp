<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>JQuery</title>
	<!-- Jquery 라이버리 추가하여 사용 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
	// javascript로 함수를 만들때 사용 하는 방법
	// function appEvent(text){
	// 	alert(text);
	// }
	// 특정 함수 호출 할 때 사용 하는 방법
	// appEvent("호출되었습니다.");
	
	// 바로 함수를 호출 할때 사용 하는 방법
	// (function(text){
	// 	var name = "구디";
	// 	alert(name + text);
	// })("바로 호출 되었습니다.");
	</script>	
	<script type="text/javascript">
		/* JQuery 시작!
		 * $  : Jquery를 뜻하는 기호이다.
		 * () : 선택자를 넣어서 선언 할 수 있는 영역이다.
		 * .  : 점을 이용하여 함수를 연결 할 수 있다. 
		 */
		 console.log("시작");
		 console.log($("html"));   // html 태그 정보
		 console.log($("head"));   // head 태그 정보
		 console.log($("meta"));   // meta 태그 정보
		 console.log($("title"));  // title 태그 정보
		 console.log($("script")); // script 태그 정보
		 console.log("그냥 실행 할 경우", $("body"));   // body 태그 정보
		 $(document).ready(function(){
			 console.log("document가 모두 실행 후", $("body")); // body 태그 정보
			 var i = 1;
			 // 기능 추가
			 $("button").click(function(){
				alert("눌렸습니다.");
				
				// body 태그에 내용을 추가 하는 방법은...
				var text = "안녕!";
				var tag = "<h1 onclick='hEvent();'>" + i + "안녕!</h1>";
				
				// 글자만 넣는 방법 : text();
// 				$("div").text(tag);
				
				// 태그와 같이 넣는 방법 : html();
// 				$("div").html(tag);

				// 내용을 중첩으로 넣을 경우 append(), prepend()
				// append() 뒤에 내용을 넣는 방법
// 				$("div").append(tag);
				
				// prepend() 앞에 내용을 넣는 방법
				$("div").prepend(tag);
				
				i++;
			 });
		 });
		 console.log("종료");
		 
		 function hEvent(){
			 alert("h1 태그 선택");
		 }
	</script>
</head>
<body style="height: 100px; background-color: green;">
<!-- 태그에 직접 이벤트를 처리 할 경우 onclick과 같은 속성으로 script를 정의 할 수 있다. -->
<!-- 경로 : src/main/webapp/WEB-INF/views/jquery/index.jsp -->
<!-- 5 -> 4 -> 3 -> 2 -> 1 -> 6 -->

<button type="button">추가</button>
<div></div>

<script type="text/javascript">
	console.log("body End");
</script>
</body>
</html>