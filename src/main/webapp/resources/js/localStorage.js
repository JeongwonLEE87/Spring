/************************************************************************ 
 * LocalStorage를 이용하여 데이터 저장 방법 
 * URL : https://www.w3schools.com/html/html5_webstorage.asp
 * 2 > 1 > 4 > 5 > 6 > 
 ************************************************************************/
function add(data){ // localStorage에 setItem()를 이용하여 데이터 입력하는 부분
	localStorage.setItem("data", JSON.stringify(data)); //문자열로 변경
}

function get(){ // localStorage에 getItem()를 이용하여 데이터 가져오는 부분
	storage = JSON.parse(localStorage.getItem("data")); //객체로 변경
}

function update(data){ // localStorage에 setItem()를 이용하여 입력받은 데이터를 수정 부분
	
}

function remove(data){ // localStorage에 setItem()를 이용하여 데이터 삭제 후 변경 하는 부분
	
}