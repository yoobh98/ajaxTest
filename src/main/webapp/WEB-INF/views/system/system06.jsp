<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	table, td, th {border : 1px solid black; border-collapse : collapse; padding : 5px};
</style>

<script>
	$(function(){
		const test= 0 ;
		selectComCode(0);
	})
	
	function selectComCode(value){
		json={
				parentCodeSeq : value
		}
		if(value == 0 ){
			doCommonAjax("selectComCode",json,"selectComCodeCallBack1")
		}else{
			doCommonAjax("selectComCode",json,"selectComCodeCallBack2")
		}
		test = value
		console.log('ㅇ? : '+test)
	}
	
	function selectComCodeCallBack1(request){
		$("#aBody").html=""
		if(request.length<=0){
			$("#aBody").html("<tr><th colspan='5'>결과가 없습니다</th></tr>")
		}else{
			var codeHTML = ""
			for(dto of request){
				codeHTML += "<tr>"
				codeHTML +=  "<td>"+dto.row+"</td>"
				codeHTML += "<td><input type='checkbox' id='chk_a"+dto.row+"'></td>"
				codeHTML += "<td>"+dto.code+"</td>"
				codeHTML += "<td>"+dto.codeNm+"</td>"
				codeHTML += "<td>"+dto.orderNo+"</td>"
				if(dto.useYn=='Y'){
					codeHTML += "<td><select><option selected>Y</option><option>N</option</select></td>"
				}else{
					codeHTML += "<td><select><option>Y</option><option selected>N</option</select></td>"
				}
				codeHTML += "</tr>"
			}
			$("#aBody").html(codeHTML)
			selectComCode(request[0].codeSeq);
		}
	}
	
	
	
	
	function selectComCodeCallBack2(request){
		$("#bBody").html("");
			if(request.length <= 0){
				$("#bBody").html("<tr><td colspan='5'>조회결과가 없습니다.</td></tr>");
			} else{
				var codeHTML = "";
				for(dto of request){
					codeHTML += "<tr>"
					codeHTML +=  "<td>"+dto.row+"</td>"
					codeHTML += "<td><input type='checkbox' id='chk_b"+dto.row+"'></td>"
					codeHTML += "<td>"+dto.code+"</td>"
					codeHTML += "<td>"+dto.codeNm+"</td>"
					codeHTML += "<td>"+dto.orderNo+"</td>"
					if(dto.useYn=='Y'){
						codeHTML += "<td><select><option selected>Y</option><option>N</option</select></td>"
					}else{
						codeHTML += "<td><select><option>Y</option><option selected>N</option</select></td>"
					}
					codeHTML += "</tr>"
				}
				$("#bBody").html(codeHTML);
			}
	}
	
	function addRow(obj){
		var row = $("#"+obj+"Body tr").length+1
		console.log(row)
		var codeHTML = ""
		codeHTML += "<tr><td></td>"
		codeHTML += "<td><input type='checkbox' id='chk_"+obj+""+row+"'></td>"
		codeHTML += "<td><input type='text'></td>"
		codeHTML += "<td><input type='text'></td>"
		codeHTML += "<td><input type='text'></td>"
		codeHTML += "<td><select><option>Y</option><option>N</option</select></td></tr>"
		$("#"+obj+"Body").append(codeHTML)
	}
	
	
	
	
	
</script>
<p>담당자 관리</p>

<div id="aaa">
	<button onclick="addRow('a')" id="a">추가</button>
	<button>저장</button>
	<button>삭제</button>
	<table>
		<colgroup>
			<col style="width:10%">
			<col style="width:10%">
			<col style="width:10%">
			<col style="width:10%">
			<col style="width:10%">
			<col style="width:10%">
		</colgroup>
		<thead id="aaahead">
			<tr>
				<td>번호</td>
				<td><input type="checkbox" id="chk_a" onclick="chkAll(this)"></td>
				<td>코드</td>
				<td>코드명</td>
				<td>정렬</td>
				<td>사용여부</td>
			</tr>
		</thead>
		<tbody id="aBody">
		</tbody>
	</table>
</div>

<div id="bbb" style="padding-top: 30px;">
	<button onclick="addRow('b')" id="b">추가</button>
	<button>저장</button>
	<button>삭제</button>
	<table>
		<colgroup>
			<col style="width:10%">
			<col style="width:10%">
			<col style="width:10%">
			<col style="width:10%">
			<col style="width:10%">
			<col style="width:10%">
		</colgroup>
		<thead id="bbbhead">
			<tr>
				<td>번호</td>
				<td><input type="checkbox" id="chk_b" onclick="chkAll(this)"></td>
				<td>코드</td>
				<td>코드명</td>
				<td>정렬</td>
				<td>사용여부</td>
			</tr>
		</thead>
		<tbody id="bBody">
		</tbody>
	</table>
</div>

<script>
function chkAll(obj){
	console.log(obj.id)
	var c=obj.id
	if($("#"+c).prop("checked")){
		$("input[id^="+c+"]").prop("checked",true)
	}else{
		$("input[id^="+c+"]").prop("checked",false)
	}
}
</script>