<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">




function checkMood(userMood){
	if(userMood == "good"){
		sing();
	}else{
		cry();
	}
}

checkMood("good");
checkMood("cry");
checkMood("soGood");
console.log("======================")

function cry(){
	console.log("cry");
}
function sing(){
	console.log("sing");
}
function dance(){
	console.log("dance");
}
					//	   good  dance()  cry()
function checkMoodCallBack(mood,goodCall,badCall){
	if(mood == "good"){//
		goodCall()
	}else{
		badCall()
	}
}
//		 전달해줄 값 =good  ,함수 2개 dance,cry
checkMoodCallBack("good",dance,cry)
checkMoodCallBack("not bad",dance,sing)

</script>


</head>
<body>
<h1>callBack 테스트</h1>



</body>
</html>