<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function ajax01(){
		$.ajax({
			url : "ajax01", //해당하는 값을 클릭했을때 연결 경로
			type : "get",   //get 방식, post 방식
			success : function(){//성공시 함수 실행
				console.log("성공")
			},
			error : function(){//실패시 함수 실행
				alert("연결실패")
			}
		})
	}
</script>
</head>
<body>

<h1>1</h1> <h1>1</h1> <h1>1</h1>
<h1>1</h1> <h1>1</h1> <h1>1</h1>
<h1>1</h1> <h1>1</h1> <h1>1</h1>
<h1>1</h1> <h1>1</h1> <h1>1</h1>
<h1>1</h1> <h1>1</h1> <h1>1</h1>
<button onclick="ajax01()">ajax01</button>



</body>
</html>