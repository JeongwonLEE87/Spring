/************************************************************************ 
 * LocalStorage를 이용하여 데이터 저장 방법 
 * URL : https://www.w3schools.com/html/html5_webstorage.asp
 * 2 > 1 > 4 > 5 > 6 > 3
 ************************************************************************/
function add(data){ // localStorage에 setItem()를 이용하여 데이터 입력하는 부분
	localStorage.setItem("data", JSON.stringify(data)); //문자열로 변경
}

function get(){ // localStorage에 getItem()를 이용하여 데이터 가져오는 부분
	if(JSON.parse(localStorage.getItem("data"))){
/************************************************************************
 * localStorage에 key가 data로 되어 있는 값이 있을 경우만 -> {key:value} 
 * storage에 데이터를 넣기 위하여 if문으로 예외 처리를 한다.
 ************************************************************************/
		storage = JSON.parse(localStorage.getItem("data")); //객체로 변경
	}
}

function update(data){ // localStorage에 setItem()를 이용하여 입력받은 데이터를 수정 부분
	localStorage.setItem("data", JSON.stringify(data)); //문자열로 변경
}

function remove(data){ // localStorage에 setItem()를 이용하여 데이터 삭제 후 변경 하는 부분
	
}