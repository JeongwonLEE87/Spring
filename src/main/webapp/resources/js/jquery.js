/************************************************************************ 
 * JQuery를 이용하여 리스트 생성 및 수정 그리고 삭제 하기 
 * URL : https://jquery.com/
 ************************************************************************/
var storage = [];
var i = 1; // 순서의 값을 사용하기 위해 초기값을 1로 지정합니다.
$(document).ready(function(){
	createHtml(); //localStorage에서 데이터 가져와서 화면에 보여주기.
	
	$("#submit").on("click", function(){ //내용추가 버튼을 클릭시 이벤트 실행하는 함수
		var text = $("#text").val(); // 입력하세요.라고 하는 input 내용의 값을 text 변수에 담아 놓기 위한 부분
		console.log("#submit", i);
		var newData = {"no": i, "text": text}; //하나의 행을 생성
		storage.push(newData); //storage 배열 변수에 생성된 행을 추가 한다.
		add(storage); //localStorage에 추가 하기 위하여 add() 호출
		
		createHtml(); //화면 생성!
		i++; //순서값을 증가
		$("#text").val(""); //입력하세요.라고 하는 input 내용의 값을 초기화 시키기 위한 부분
	});
});

function createHtml(){
	get(); //localStorage에서 데이터 가져오기
	$("tbody").empty(); //기존에 있던 내용을 삭제한다.
	for(var j = 0; j < storage.length; j++){
		var tag = '<tr>' +
				    '<td><input type="checkbox"></td>' +
				    '<td>' + storage[j].no + '</td>' +
						'<td>' + storage[j].text + '</td>' +
						'<td><button type="button">삭제</button> </td>' +
				  '</tr>';
		$("tbody").prepend(tag); // tbody 태그에 tag 변수에 저장된 값을 추가해줌
		i = j;
		console.log("createHtml", j, i);
	}
	
	if(storage.length > 0){ // 이벤트를 storage의 값에 의해서 생성 할 것인지 판단한다.
		$("tbody input:checkbox").off(); // 이전 이벤트를 종료 하기 위한 부분
		$("tbody input:checkbox").on("click", function(){
			var index = $("tbody input:checkbox").index(this); //this를 사용하여 주소값을 index 변수에 저장함
			var tr = $("tbody tr").eq(index); //해당 되는 tr의 전체 객체를 가져 오기 위한 변수
			var tds = tr.find("td"); //tr 객체 속에 있는 태그의 td태그들를 가져 오기 위한 부분
			var text = ""; //text 값을 초기화시켜주고
			if($(this).prop('checked')){ //체크박스에 체크되있으면
				text = tds.eq(2).text(); //한줄평의 내용을 text 변수에 저장하기 위한 부분
				tds.eq(2).html("<input type='text' value='" + text + "'>");
				// 한줄평의 내용 부분를 입력 받을 수 있는 input 박스를 넣고 value 값으로 text 변수를 대입해 주는 부분
			}else{ //체크를 풀었을때
				text = tds.eq(2).find("input").val(); //한줄평의 내용부분의 input 박스의 값을 text 변수에 담기 위한 부분
				tds.eq(2).text(text); //text 변수의 값을 한줄평의 위치에 내용으로 변경 하기 위한 부분 (input 박스는 삭제 됩니다.)
			}
		});
		
		$("tbody button").off();
		$("tbody button").on("click", function(){ // tbody 태그에 있는 button을 클릭했을때
			var index = $("tbody button").index(this); //주소값을 this를 사용해서 찾아주고
			$("tbody tr").eq(index).remove(); //해당 주소에 맞는 tr 태그를 삭제시켜준다.
		});
	}
}