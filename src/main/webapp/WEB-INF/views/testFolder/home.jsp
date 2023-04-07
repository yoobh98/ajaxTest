<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#search_user_popup_div{display: flex; padding-bottom: 10px;}
	#search_user_popup_div_1{font-size: 20pt; padding-right: 5px;}
	#search_user_popup_div_2 input{ height: 35px;}
	.search_user_popup_btn_div{padding-bottom:10px;}
	.search_user_popup_btn_div button{color:white; background-color: #3d84bc; width: 50px; height: 30px; border:none;}
	.search_user_popup_btn_div button:hover{background: #B8D7FF; color:black;}
	a:hover{color:powderblue; font-size: 15px;}
</style>
<script type="text/javascript">
	$(function(){
		
	});
	getAllUserList()//우선 리스트 출력.
	
	function change_search(){//검색 값이 바뀌었을때 비어있다면.
		if($("#userName").val()==""){
			getAllUserList()
		}
	}
	
	function search_end(find_userId){//검색완료시
		getUserInfo(find_userId)
		fn_close()
	}
	
	function getAllUserList(){//모든 리스트 가져오는애
		jsonData={}
		doCommonAjax("getAllUserList",jsonData,"getAllUserListCallBack");
	}
	
	function getAllUserListCallBack(data){
		var codeHTML=""
			for(userData of data){
				codeHTML += "<tr>";
				codeHTML += "<td><a onclick='search_end("+userData.userId+")'>"+userData.userId+"</a></td>";
				codeHTML += "<td><a onclick='search_end("+userData.userId+")'>"+userData.deptNm+"</a></td>";
				codeHTML += "<td><a onclick='search_end("+userData.userId+")'>"+userData.userNm+"</a></td>";
				codeHTML += "<td><a onclick='search_end("+userData.userId+")'>"+userData.rankNm+"</a></td>";	
				codeHTML += "</tr>";
			} 
		$("#search_user_list_body").html(codeHTML);
	}

	
	function getUserNameList(){//이름 검색해서 가져오는애
		jsonData={
			userNm:$("#userName").val()
		}
		doCommonAjax("searchUserName",jsonData,"getUserNameListCallBack")
	}
	
	function getUserNameListCallBack(data){
		if(data.length==0){
			$("#search_user_list_body").html("<tr><th colspan='4'>조회된 결과가 없습니다.</th></tr>");
		}else{
			var codeHTML=""
			for(userData of data){
				codeHTML += "<tr>";
				codeHTML += "<td><a onclick='search_end("+userData.userId+")'>"+userData.userId+"</a></td>";
				codeHTML += "<td><a onclick='search_end("+userData.userId+")'>"+userData.deptNm+"</a></td>";
				codeHTML += "<td><a onclick='search_end("+userData.userId+")'>"+userData.userNm+"</a></td>";
				codeHTML += "<td><a onclick='search_end("+userData.userId+")'>"+userData.rankNm+"</a></td>";	
				codeHTML += "</tr>";
			}
			$("#search_user_list_body").html(codeHTML);
		}
	}
	
pagingTest(1)
	
	function pagingTest(number){
		doCommonAjax("paging",number,"pageCallBack")
	}

	function pageCallBack(data){
		
		var codeHTML=""
		var btnHTML=""
			for(userData of data){
				codeHTML += "<tr>";
				codeHTML += "<td>"+userData.userId+"</td>";
				codeHTML += "<td>"+userData.userNm+"</td>";
				codeHTML += "</tr>";
			}
			codeHTML += "<tr><th colspan='2'>";
			<c:forEach var = "num" begin="1" end="${pageListCount}">
				codeHTML += "<button onclick='pagingTest("+${num}+")'>";
				codeHTML += ${num};
				codeHTML += "</button>";
			</c:forEach>
			codeHTML += "</th></tr>";
		$("#page_body_list").html(codeHTML);
	}
</script>

<div id="search_user_popup_div">
	<div id="search_user_popup_div_1">
		이름
	</div>
	<div id="search_user_popup_div_2">
		<input type="text" id="userName" onchange="change_search()">
	</div>
</div>
<div class="search_user_popup_btn_div">
	<button onclick="getUserNameList()">조회</button>
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
			<th>사번</th> <th>부서</th> <th>이름</th> <th>직급</th>
		</tr>
		</thead>
		<tbody id="search_user_list_body">
		</tbody>
	</table>
</div>