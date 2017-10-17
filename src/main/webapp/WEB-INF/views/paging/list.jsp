<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>페이징 화면</title>
<style>
	div {
		text-align: center;
	}
	a {
		display: inline-block;
		width: 20px;
	}
	.bg {
		background-color: green;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	var data = []; // 데이터 담을 배열 변수 선언
	var page = 3; // 현재 페이지 값
	var viewRow = 10; // 화면에 보여질 행 갯수
	var totCnt = 0; // 데이터 전체 객수
	
	function createHtml(){ // ul(부모) 태그 속에 li(자식) 태그 넣기 위한 함수
		$("ul").empty(); // ul 태그의 자식들를 초기화가 필요하다.
		for(var i = 0; i < data.length; i++){
			$("ul").append("<li>no: " + data[i].no + ", name: " + data[i].name + "</li>")
		}
	}
	
	function createPaging(){
		var paging = totCnt / viewRow;
		// 전체의 행의 수에서 보여줄 행을 나누면 페이지의 갯수를 알 수 있다.
		$("div").empty(); // div 태그 속에 a 태그를 초기화 한다.
		for(var i = 0; i < paging; i++){
			$("div").append("<a href='#" + (i + 1) + "'>" + (i + 1) + "</a>")
		}
		
		$("a").eq(page - 1).addClass("bg"); 
		// page의 변수를 이용하여 a 태그의 인덱스 값을 구하여 bg 클래스를 적용한다.
		
		$("a").off().on("click", function(){ // 페이지 전환 이벤트를 작성 한다.
			// a 태그 중에 몇번째 페이지인지 알면 리스트 화면를 다시 보여 줄 수 있다. page 변수 활용 할것!
			page = $(this).text();
			initData(); // 디비에서 데이터 다시 가져 오기 위하여 함수 호출
		});
	}
	
	function initData(){ // 디비에서 데이터 가져오기 위한 함수
		
		var end = (viewRow * page); // 10 * 2 = 20 
		var start = (end - viewRow); // 20 - 10 = 10
		
		$.ajax({
				type:"post", // post 방식으로 통신 요청
				url:"/spring/listData", // Spring에서 만든 URL 호출
				data:{"start":start, "viewRow":viewRow} // 파라메터로 사용할 변수 값 객체 넣기
		}).done(function(d){ // 비동기식 데이터 가져오기
			var result = JSON.parse(d); // 가져온 데이터를 JSON 형식으로 형변환 하여 result 변수에 담기.
			data = result.data; // JSON으로 받은 데이터를 사용하기 위하여 전역변수인 data에 값으로 넣기
			totCnt = result.totCnt.tot;
			createHtml(); // 화면에 표현하기 위하여 함수 호출
			createPaging(); // 페이지 링크 표현하기 우하여 함수 호출
		});
	}
	
	initData();
});
</script>
</head>
<body>
	<h1>페이징 테스트 화면</h1>
	<ul></ul> <!-- 화면에 보여질 리스트 태그 부모 -->
	<div></div> <!-- 페이지 링크 리스트 -->
</body>
</html>