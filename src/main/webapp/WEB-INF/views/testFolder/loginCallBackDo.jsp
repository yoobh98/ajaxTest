<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
//		/login, jsonData{userId(key):qwe123(value)} , loginCallBack
					//���	��		�Լ�		
function doCommonAjax(url, param, successFc){
	$.ajax({
		type: "POST",
		url: url,
        dataType : "json",
		contentType: "application/json",
        data : JSON.stringify(param),// param�̶�� ���� json �������� ��ȯ�Ͽ� data��� ������ �־��ְ�
        error: function(request, status, error) {
			console.log('Ajax ����');
        	console.log(request);
        	console.log(status);
        	console.log(error);
		},
		beforeSend: function() {
		},
		success: function(data) {//������ �Ѿ�� �� data �� �޾Ƽ�
			eval(successFc+"("+JSON.stringify(data)+")");
		},//		loginCallBack(�޾ƿ°�) �Լ� ȣ��.	
		complete: function() {
		}
	});
}

</script>
</head>
<body>

</body>
</html>