var ipArray = [];

$(document).ready(function(){
    
	$("#menu li").on("click", function(){
		$("#menu li").removeClass("active");
		var index = $("#menu li").index(this);
//		console.log(index);
		if(index == 7){
			fnCapture();
		}else if(index == 1){
			
		}else {
			pageEvent(1, index);
		}
		
		$("#menu li").eq(index).addClass("active");
	});
	
	$("#menu li ul.dropdown-menu li").on("click", function(){
		var index = $("#menu li ul.dropdown-menu li").index(this);
		pageEvent(2, index + 1);
	});
	
//	$("#dropdown").hover(function(){
//    	// 마우스가 올라왔을때
//    	$('.dropdown-toggle').dropdown("toggle");
//    },function(){
//    	// 마우스가 밖으로 나갔을때
//    	$('.dropdown-toggle').dropdown("toggle");
//    });
	pageEvent(1, 0);
//	alert( ip()+ " / "+ipv() );
	if(ipArray.length == 0){
		ipArray[0] = {"addr":ip(), "version":ipv()};
	}else{
		ipArray[ip.length] = {"addr":ip(), "version":ipv()};
	}
});

function pageEvent(type, page){
	if(type == 1){
		if(page == 0){
			$("#container").load("resources/html/spa/home.html");
		}else {
			$("#container").empty();
		}
	}else {
		$("#container").load("resources/html/spa/page" + page + ".html");
	}
}

function ipv(){
	return -1 !=ip().indexOf(":")?6:4
}

function fnCapture(){
	html2canvas($("body"), {
		onrendered: function(canvas) {
		    var img = canvas.toDataURL();
//		    console.log(img);
		    $("#container").html('<img src=' + img + '>');    // section2 영역에 section1 을 이미지 capture 내용이 보여짐
		},
		width: 300,
		height: 300
	});
}
