<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 어드민 셋팅 -->

<%@include file="../include/admin_setting.jsp"%>

</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">

 <!-- 메인 헤더 -->
	<%@include file="../include/admin_header.jsp"%>	
 <!-- 메인 헤더 -->
 <!-- 사이드 -->
 	<%@include file="../include/admin_side.jsp"%>
 <!-- 사이드 -->


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">쿠폰 관리</h1>
          </div><!-- /.col -->
        
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
	<div class="row">
		<div class="col-lg-12">
				<div class="card">
		              <div class="card-header">
		                <h2 class="coupon-title">
		                	쿠폰 목록
		               	</h2>
		                <div class="pull-right">
		                	<button type="button" id="creat_coupon_btn" class="btn btn-block btn-success">쿠폰 생성</button>
		                </div>
		              </div>
		              <!-- /.card-header -->
		              <div class="card-body">
		                <table id="example2" class="table table-bordered table-hover">
		                  <thead>
		                  <tr>
		                    <th>#</th>
		                    <th>이미지</th>
		                    <th>쿠폰 이름</th>
		                    <th>쿠폰 타입</th>
		                    <th>쿠폰 할인율</th>
		                    <th>생성일</th>
		                  </tr>
		                  </thead>
		                  <tbody>
		                   	 <c:forEach items="${list}" var="coupon">
		                   	   <tr>
		                   	 		<td><c:out value="${coupon.c_cp_idx}" /></td>
		                   	 		<td><img src="/resources/img/coupon_test.png" height='50' width='50'></td>
		                   	 		<td><a class='move' href='<c:out value="${coupon.c_cp_idx}"/>'>
		                   	 		<c:out value="${coupon.c_cp_name}" /></a></td>
		                   	 		<td><c:out value="${coupon.c_cp_type}" /></td>
		                   	 		<td><c:out value="${coupon.c_cp_price}" /></td>
		                   	 		<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${coupon.regdate}"/></td>
		                   	   </tr>
		                   	 </c:forEach>
		                 </tbody>
		                </table>
							
							
							<br>
							<!-- 검색 -->
							<div class='row'>
								<div class="col-lg-12">

									<form id='searchForm' action="/admin/admin_coupon" method='get'>
										<select name='type' class="select_bar">
											<option value=""
												<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
											<option value="T"
												<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>이름</option>
											<option value="C"
												<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>타입</option>
											<option value="W"
												<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>할인율</option>
											<option value="TC"
												<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>이름
												or 타입</option>
											<option value="TW"
												<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>타입
												or 할인율</option>
											<option value="TWC"
												<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>이름
												or 타입 or 할인율</option>
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
											<li class="paginate_button page-item previous"><a href="${pageMaker.startPage -1}" class="page-link">Previous</a></li>
										</c:if>
				
										<c:forEach var="num" begin="${pageMaker.startPage}"	end="${pageMaker.endPage}">
											<li class="paginate_button page-item  ${pageMaker.cri.pageNum == num ? "active":""} ">
												<a href="${num}" class="page-link">${num}</a>
											</li>
										</c:forEach>
				
										<c:if test="${pageMaker.next}">
											<li class="paginate_button page-item next"><a href="${pageMaker.endPage +1 }" class="page-link">Next</a></li>
										</c:if>
				
									</ul>
								</div>
								<!-- 페이징 -->
				
								<!-- 페이징 폼-->
								<form id='actionForm' action="/admin/admin_coupon" method='get'>
								<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
								<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
								<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'>
								<input type='hidden' name='keyword'	value='<c:out value="${ pageMaker.cri.keyword }"/>'>
								</form>
								<!-- 페이징 폼  -->

						</div>
				
				</div>

					
			</div>


			</div>



  </div>
  
  		
  
  
  <!-- /.content-wrapper -->

<%@include file="../include/admin_footer.jsp"%>
<script type="text/javascript"> 
	$(document).ready(function() {

		$("#creat_coupon_btn").on("click", function() {
			self.location = "/admin/admin_coupon_create";
		});

	/* 	var result = '<c:out value="${result}"/>';
		console.log(result);
		checkModal(result);
		history.replaceState({}, null, null);

		function checkModal(result) {
	
			if (result === '' || history.state) {
				$("#myModal").modal("fade");
				return;
			}

			if (parseInt(result) > 0) {
				$(".modal-body").html("쿠폰 " + parseInt(result)	+ " 번이 생성되었습니다.");
			}

			$("#myModal").modal("show");
		} */


		var actionForm = $("#actionForm");

		
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
	
		$(".move").on("click",function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='c_cp_idx' value='" + $(this).attr("href")	+ "'>");
			actionForm.attr("action", "/admin/admin_coupon_get");
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

</body>
</html>
