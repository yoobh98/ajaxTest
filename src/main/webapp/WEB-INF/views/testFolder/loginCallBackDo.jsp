<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
//		/login, jsonData{userId(key):qwe123(value)} , loginCallBack
					//경로	값		함수		
function doCommonAjax(url, param, successFc){
	$.ajax({
		type: "POST",
		url: url,
        dataType : "json",
		contentType: "application/json",
        data : JSON.stringify(param),// param이라는 값을 json 형식으로 변환하여 data라는 변수에 넣어주고
        error: function(request, status, error) {
			console.log('Ajax 오류');
        	console.log(request);
        	console.log(status);
        	console.log(error);
		},
		beforeSend: function() {
		},
		success: function(data) {//성공시 넘어온 값 data 를 받아서
			eval(successFc+"("+JSON.stringify(data)+")");
		},//		loginCallBack(받아온값) 함수 호출.	
		complete: function() {
		}
	});
}

</script>
</head>
<body>

</body>
</html>