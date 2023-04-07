<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(document).ready(function(){
	});

	function login(){
		jsonData = { // 넘겨주고 싶은 값을 key, value 형태로 넘겨줌.
			"userId" : $("#userId").val()//userId 라는 key에 userId의 아이디값을 가진 애의 값을 넣어주고.
		};
		doCommonAjax("/login", jsonData, "loginCallback");
		//callBack 을 위해 doCommonAjax 함수 호출
		//이때 보내고 싶은 경로로 url과, 보내고 싶은 값을 넣어둔 jsonData, 호출하고 싶은 함수 loginCallBack
	}

	function loginCallback(data){//doCommon에서 호출된 함수 실행
		if(data.isError)
			alert(data.errorMsg);
		else
			location.href = "/";
	}
</script>
<p>임시 로그인 페이지</p>
사번 : <input type="text" id="userId" value="1000000001">
<button onClick="login()">로그인</button>

<h3>인사정보(임시)</h3>

김포스 사원 : 2023031601 <br/>
홍길동 과장 : 2015010101 <br/>
김철수 과장 : 2015010102 <br/>
최민수 차장 : 2008050101 <br/>
박영희 과장 : 2015010103 <br/>
이유리 대리 : 2020010101

