<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	#search_user_popup_div{display: flex; padding-bottom: 10px;}
	#search_user_popup_div_1{font-size: 20pt; padding-right: 5px;}
	#search_user_popup_div_2 input{ height: 35px;}
	.search_user_popup_btn_div{padding-left:10px;}
	.search_user_popup_btn_div button{color:white; background-color: #3d84bc; width: 50px; height: 30px; border:none;}
	#search_user_list_body tr{cursor: pointer;}
</style>
<script type="text/javascript">
	$(function(){
		getAllUserList(); // 우선 리스트 출력.
	});

	function searchEnd(findUserId){ // 검색완료시
		getUserInfo(findUserId);
		fnPopClose();
	}

	function getAllUserList(){ // 모든 리스트 가져오는애
		doCommonAjax("getAllUserList", null, "getAllUserListCallBack");
	}

	function getAllUserListCallBack(data){ // 모든 리스트
		addUserTableList(data);
	}

	function searchUserList(){ // 이름 검색해서 가져오는애
		if($("#search_input_form").val() == ""){
			getAllUserList();
		}else{
			jsonData={
				userSearch : $("#search_input_form").val()
				, selectOption : $("#user_list_selecter").val()
			}
			doCommonAjax("searchUserList", jsonData, "getUserNameListCallBack");
		}
	}

	function getUserNameListCallBack(data){ // 이름 검색 리스트
		if(data.length == 0){
			$("#search_user_list_body").html("<tr><th colspan='4'>조회된 결과가 없습니다.</th></tr>");
		}else{
			addUserTableList(data);
		}
	}

	function addUserTableList(data){ // 테이블 생성
		var codeHTML = "";
		for(userData of data){
			codeHTML += "<tr onclick='searchEnd("+userData.userId+")'>";
			codeHTML += "<td>"+userData.userId+"</td>";
			codeHTML += "<td>"+userData.deptNm+"</td>";
			codeHTML += "<td>"+userData.userNm+"</td>";
			codeHTML += "<td>"+userData.rankNm+"</td>";
			codeHTML += "</tr>";
		}
		$("#search_user_list_body").html(codeHTML);
	}
</script>

<div id="search_user_popup_div">
	<div id="search_user_popup_div_1">
		<select id="user_list_selecter">
			<option>사번</option>
			<option>이름</option>
			<option>부서</option>
		</select>
	</div>
	<div id="search_user_popup_div_2">
		<input type="text" id="search_input_form" placeholder="입력">
	</div>
	<div class="search_user_popup_btn_div">
		<button onclick="searchUserList()">조회</button>
	</div>
</div>

<div>
	<table class="list_table3">
		<colgroup>
	        <col style="width:25%;">
	        <col style="width:25%;">
	        <col style="width:25%;">
	        <col style="width:25%;">
	    </colgroup>
		<thead>
			<tr>
				<th>사번</th>
				<th>부서</th>
				<th>이름</th>
				<th>직급</th>
			</tr>
		</thead>
		<tbody id="search_user_list_body">
		</tbody>
	</table>
</div>