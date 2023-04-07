<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function ajax04(){
		var n=document.getElementById("name").value;
		var a=$("#age").val()
		var addr=$("#addr").val()
		var form={name:n,age:a,addr:addr} //key, value 설정 key와 value 형태로 하나의 오브젝트를 만듬.
		console.log(form)
		console.log(typeof form)
		$.ajax({
			url : "ajax_result04",type : "post",
			data : JSON.stringify(form),//서버로 보낼 데이터,JSON.stringify:형식 변환해주는애
			contentType : "application/json; charset=utf-8",//서버로 보낼 데이터 타입
			dataType : "json", // return 타입
			success : function(data){
				$("label").text(data.name+":"+data.age+":"+data.addr)
				console.log("data=>",data)
			},error : function(){
				alert('문제 발생!!')
			}
		})
	}
</script>
</head>
<body>ajax04<br>
name : <input type="text" id="name"><br>
age : <input type="text" id="age"><br>
addr : <input type="text" id="addr"><br>
<input type="button" onclick="ajax04()" value="전송">
<br><label id="label"></label>
</body>
</html>