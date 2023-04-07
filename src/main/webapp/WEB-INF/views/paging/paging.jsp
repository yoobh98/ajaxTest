<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">
	pagingTest(0)
	
	function pagingTest(number){
		doCommonAjax("paging",number,"pageCallBack")
	}

	function pageCallBack(data){
		
		var codeHTML=""

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

<p>부서 조회</p>
<h1>pageTest</h1>


<table class="list_table3">
	<tr>
		<th>아이디</th><th>이름</th>
	</tr>
	<tbody id="page_body_list">
	</tbody>
</table>

@GetMapping("/system02")//페이징 테스트
	public String system02(Model model,
			@RequestParam(value="num",required = false,defaultValue = "0")int num){
		logger.info("system02");
		
		model.addAttribute("list",service.getAllUserList(model, num));
		return "system/system02";
	}

@ResponseBody// 페이징 테스트용   
	@PostMapping("/paging")
	public List<UserVO> paging(@RequestBody int number,Model model){
		List<UserVO> list = null;
		list=service.getAllUserList(model, number);
		return list;
	}
	
@Override//페이징 테스트//페이징 테스트//페이징 테스트
	public List<UserVO> getAllUserList(Model model,int pageNum) {
		if(pageNum==0) {
			pageNum++;
		}
		int pageCount=7;
		//			2	*	5	=	10	-	5
		int start=(pageNum*pageCount) - pageCount;
		
		model.addAttribute("pageListCount",getBoardCount(pageCount));

		return dao.getAllUserList(start);
	}
	private int getBoardCount(int pageCount) {
		int count=pageCount;
		int allCount=dao.getBoardCount();
		int pageListCount = allCount / count;
		if(allCount % count !=0) {
			pageListCount+=1;
		}
		return pageListCount;
	}
<!--페이징테스트용  --><!--페이징테스트용  -->
	<select id="selectPageList" resultType="UserVO">
		SELECT A.user_id
			, A.user_nm
			, B.dept_nm
			, C.code_nm AS rank_nm 
		FROM gdm_user_tb A 
		LEFT JOIN gdm_dept_tb B 
		ON A.dept_id = B.dept_id 
		LEFT JOIN gdm_code_tb C 
		ON A.rank_cd = C.code_seq 
		ORDER BY user_id desc 
		OFFSET #{start} ROW
		FETCH NEXT 7 ROW ONLY
	</select> --%>