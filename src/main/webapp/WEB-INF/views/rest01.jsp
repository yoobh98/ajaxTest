<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function getFunc(){
		$.ajax({
			url : "rest",type : "get", dataType : "json",//retrun type=json
			success:function(data){$("#lb").text(data.key)}
		})
	}
	function postFunc(){
		$.ajax({
			url : "rest",type : "post", dataType : "json",//retrun type=json
			success:function(data){$("#lb").text(data.key)}
		})
	}
	function putFunc(){
		$.ajax({
			url : "rest",type : "put", dataType : "json",//retrun type=json
			success:function(data){$("#lb").text(data.key)}
		})
	}
	function deleteFunc(){
		$.ajax({
			url : "rest",type : "delete", dataType : "json",//retrun type=json
			success:function(data){$("#lb").text(data.key)}
		})
	}
</script>
</head>
<body>

<label id="lb"></label><hr>
<button type="button" onclick="getFunc()">get</button>
<button type="button" onclick="postFunc()">post</button>
<button type="button" onclick="putFunc()">put</button>
<button type="button" onclick="deleteFunc()">delete</button>

</body>
</html>