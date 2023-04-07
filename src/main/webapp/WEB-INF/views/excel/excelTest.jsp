<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{text-align: center;}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

	function fileCheck(){
		let fileName = $("#file").val();
		console.log('파일 체크중..');
		
		if(fileName == ""){
			alert("파일을 선택을 해야지");
			return false;
		}
		else if(fileName.slice(-3,fileName.length) == "xls" || fileName.slice(-4,fileName.length) == "xlsx"){
			console.log('조건 완료..');
			return true;
		}else{
			alert("엑셀 파일을 선택을 해야지");
			return false;
		}
	}
	
	function sampleDownload(){
		$("#sampleDownForm").submit();
	}
	
	function excelUpload(){
		console.log('업로드 진행..');
		$("#uploadForm").submit();
	}	   
	function userListDownload(){
		console.log('유저 정보 다운..')
		$("#userListDown").submit();
		
	}
	
	function allUserListDownload(){
		console.log('모든 유저 정보 다운..')
		$("#allUserListDown").submit();
	}
	
</script>
</head>
<body>

<div>
	<button onclick="excelUpload()">엑셀 업로드</button>
	<form id="uploadForm" action="excelUpload" method="post" enctype="multipart/form-data" onsubmit="return fileCheck()">
		<input type="file" id="file" name="file">
	</form>
</div>
<hr>
<div>
	<button id="sampleDown" onclick="sampleDownload()">엑셀 양식 다운로드</button>
	<form id="sampleDownForm" action="sampleDownload"></form>
</div>

<hr>
<form id="userListDown" action="getSearchUserList">
	<input type="text" name="userName" >
	<button onclick="userListDownload()">해당 유저 정보 엑셀로 다운로드</button>
</form>
<hr>

<form id="allUserListDown" action="getAllUserList">
	<button onclick="allUserListDownload()">모든 유저 정보 엑셀로 다운로드</button>
</form>



</body>
</html>