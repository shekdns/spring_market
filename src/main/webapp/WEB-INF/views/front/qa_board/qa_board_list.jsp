<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 <%@include file="../../include/front_setting.jsp"%>
 <%@include file="../../include/front_header.jsp"%>
   <link rel="stylesheet" href="/resources/css/qa_board.css">
  <meta name="_csrf_header" content="${_csrf.headerName}">
  <meta name="_csrf" content="${_csrf.token}">


<div class="qa_section">
 <div id="board_text">
         	고객게시판
        </div>
       <div class="qa_table_section">
		<table class="table table-sm">
		  <thead class="thead-dark">
		    <tr>
		      <th scope="col" width="10%">no</th>
		      <th scope="col" width="40%">title</th>
		      <th scope="col" width="20%">writer</th>
		      <th scope="col" width="20%">date</th>
		      <th scope="col" width="10%">hit</th>
		    </tr>
		  </thead>
		  <tbody>
		   <c:forEach items="${list}" var="qa" >
		    <tr>
						<td><c:out value="${qa.qa_idx}" /></td>
						
						<%-- <sec:authorize access="isAnonymous()">
	                	<td><c:out value="${qa.qa_title}" /></td>
	                	</sec:authorize> --%>
						<td><a class='move' href='<c:out value="${qa.qa_idx}"/>'>
								<c:out value="${qa.qa_title}" />
						</a></td>

						<td><c:out value="${qa.userid}" /></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
								value="${qa.regdate}" /></td>
						<td><c:out value="${qa.qa_hit}" /></td>
					</tr>
		  </c:forEach>
		  </tbody>
		</table>
	</div>
	
		<!-- 검색 -->
							<div class='row'>
								<div class="col-lg-12">

									<form id='searchForm' action="/front/qa_board/qa_board_list" method='get'>
										<select name='type' class="select_bar">
											<option value=""
												<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
											<option value="T"
												<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
											<option value="C"
												<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
											<option value="W"
												<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
											<option value="TC"
												<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
												or 내용</option>
											<option value="TW"
												<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목
												or 작성자</option>
											<option value="TWC"
												<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목
												or 내용 or 작성자</option>
										</select>
										 
										<input type='text' name='keyword'
											value='<c:out value="${pageMaker.cri.keyword}"/>' /> 
											
											<input
											type='hidden' name='pageNum'
											value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
											type='hidden' name='amount'
											value='<c:out value="${pageMaker.cri.amount}"/>' />
										<button class='btn btn-primary btn-icon-split'>Search</button>
									</form>
								</div>
							</div>
							<!-- 검색 -->
		<!--  페이징-->
								<div class='pull-right'>
									<ul class="pagination">
				
										<c:if test="${pageMaker.prev}">
											<li class="paginate_button page-item previous"><a href="${pageMaker.startPage -1}" class="page-link">이전</a></li>
										</c:if>
				
										<c:forEach var="num" begin="${pageMaker.startPage}"	end="${pageMaker.endPage}">
											<li class="paginate_button page-item  ${pageMaker.cri.pageNum == num ? "active":""} ">
												<a href="${num}" class="page-link">${num}</a>
											</li>
										</c:forEach>
				
										<c:if test="${pageMaker.next}">
											<li class="paginate_button page-item next"><a href="${pageMaker.endPage +1 }" class="page-link">다음</a></li>
										</c:if>
				
									</ul>
								</div>
								<!-- 페이징 -->
				
								<!-- 페이징 폼-->
								<form id='actionForm' action="/front/qa_board/qa_board_list" method='get'>
								<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
								<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
								<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'>
								<input type='hidden' name='keyword'	value='<c:out value="${ pageMaker.cri.keyword }"/>'>
								</form>
								<!-- 페이징 폼  -->
		<sec:authorize access="isAuthenticated()">
		<div style="float: right;">
			<input type="button" id="reg_btn" class="btn btn-warning" value="등록하기" style="font-family: 'Malgun gothic','Sans-Serif','Arial';">
		</div>		
		</sec:authorize>
</div>
 	

<%@include file="../../include/front_footer.jsp"%>
 <!-- Popper JS -->
<script>

$("#reg_btn").on("click", function(){

	self.location = "/front/qa_board/qa_board_register";
});


$(document).ready(function() {

 
var actionForm = $("#actionForm");

	
	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	

	$(".move").on("click",function(e) {
		e.preventDefault();
		actionForm.append("<input type='hidden' name='qa_idx' value='" + $(this).attr("href")	+ "'>");
		actionForm.attr("action", "/front/qa_board/qa_board_get");
		actionForm.submit();
	});
	
	var searchForm = $("#searchForm");
	$("#searchForm button").on("click",	function(e) {
		if (!searchForm.find("option:selected").val()) {
			alert("검색종류를 선택하세요");
			return false;
		}

		if (!searchForm.find("input[name='keyword']").val()) {
			alert("키워드를 입력하세요");
			return false;
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();
		searchForm.submit();
	});
 


});





</script>