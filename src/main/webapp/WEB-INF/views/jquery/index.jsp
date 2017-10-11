<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>JQuery</title>
	<style type="text/css">h1 {cursor: pointer;}</style>
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
// 				var tag = "<h1 onclick='hEvent(this);'>" + i + "안녕!</h1>"; // JavaScript용
				var tag = "<h1><input type='checkbox'>" + i + "<span>안녕!" + i + "</span> <button type='button'>삭제</button></h1>"; // JQuery용으로 변경
				
				// 글자만 넣는 방법 : text();
// 				$("div").text(tag);
				
				// 태그와 같이 넣는 방법 : html();
// 				$("div").html(tag);

				// 내용을 중첩으로 넣을 경우 append(), prepend()
				// append() 뒤에 내용을 넣는 방법
// 				$("div").append(tag);
				
				// prepend() 앞에 내용을 넣는 방법
				$("div").prepend(tag);
				
// 				$("h1").off(); // 이전 이벤트를 종료 하게 만든다.
// 				$("h1").on("click", function(){ // 이벤트를 생성해 준다.
// 					alert("JQuery로 선택되었습니다.");
// 					console.log($(this).text());
// 					$(this).text($(this).text() + " 선택 되었습니다.");
// 				});
				
				$("h1 button").off();
				$("h1 button").on("click", function(){
// 					$(this).remove(); // 자신를 지우는 행위를 하기 때문에 사용 불가.
					var index = $("h1 button").index(this); // 선택자가 몇번째 인덱스인지를 구한다.
					console.log(index);
					$("h1").eq(index).remove(); // 구한 인덱스를 이용하여 h1 태그 모두 삭제를 한다.
					/******************************************************************* 
					 * 인덱스를 구하기 위한 JQuery 함수는 index() 이다.
					 * 선택자가 배열로 되어 있기 때문에 구한 인덱스를 eq() 이용하여 원하는 내용을 선택 할 수 있다.
					 * remove() 함수는 선택된 내용을 전체 지우는 행위를 한다.
					 *******************************************************************/
				});
				
				$("h1 input:checkbox").off();
				$("h1 input:checkbox").on("click", function(){
					// h1의 인덱스 값 가져 오기
					var index = $("h1 input:checkbox").index(this);
					// 선택된 h1 객체를 변수에 담기 (아래에서 공통으로 사용 하기 위하여 사용)
					var h1 = $("h1").eq(index);
					// 해당 체크박스 상태를 확인하기 위하여 if문 사용
					if($(this).prop('checked')){
						// span 태그에 있는 내용을 변수에 담기
						var text = h1.find("span").text();
						// 입력 받을 수 있도록 태그 추가
						h1.append("<input type='text' value='" + text + "'>");
					}else {
						// 입력 받은 내용을 다시 span 태그 속으로 변경
						h1.find("span").text(h1.find("input:text").val());
						// 입력 받는 태그 화면에서 삭제
						h1.find("input:text").remove();
					}
					/*******************************************************************
					 * 1. 선택자 중 input의 type은 여러가지가 올 수 있기 때문에 input:type을 선택 할 수 있다.
					 * 예) <input type="text">  -> $("input:text") 
					 * 2. 체크박스는 결과값이 true & false를 리턴하기 때문에 JQuery에서 .prop() 사용한다.
					 * 예) $("input:checkbox").prop('checked') <-- 결과값 가지 오는 방법
					 * 3. 하위 태그를 찾기 위한 방법으로 find()를 이용하여 정보를 가져 올 수 있다.
					 * 예) $("h1").find("span")  <-- h1 태그 속에 span 태그 정보 가져 오는 방법
					 *******************************************************************/
				});
				
				i++;
			 });
		 });
		 console.log("종료");
		 
		 function hEvent(attr){
			 alert("h1 태그 선택");
			 // 이벤트 처리는?
			 // this의 정보 중에 속에 있는(innerHTML) 내용을 가져 올 수 있다.
			 console.log(attr.innerHTML);
			 // innerHTML를 이용하여 내용을 변경도 가능 하다.
			 attr.innerHTML = attr.innerHTML + " 선택 되었습니다.";
			 // document.getElementsByTagName("h1")[0].innerHTML 
			 // (this) -> attr.innerHTML  // 위와 동일한 방법으로 처리 가능
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