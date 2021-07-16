<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 어드민 셋팅 -->

<%@include file="../../include/admin_setting.jsp"%>
<link rel="stylesheet" href="/resources/admin_css/category_nav.css">

</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">

 <!-- 메인 헤더 -->
	<%@include file="../../include/admin_header.jsp"%>	
 <!-- 메인 헤더 -->
 <!-- 사이드 -->
 	<%@include file="../../include/admin_side.jsp"%>
 <!-- 사이드 -->


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">상품 관리</h1>
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
		                	상품 목록
		               	</h2>
		             	
		             	<div class="pull-right">  
		                	<button type="button" id="create_product_btn" class="btn btn-block btn-success">상품 등록</button>
		                </div>
		                
		                <div class="pull-right"> 
		              	  <a href="#myModal2" data-toggle="modal"> 
		                	<button type="button" id="info_category_btn" class="btn btn-block btn-danger">카테고리 관리</button>
		                  </a>
		                </div>
		              
		             	
		             	 <div class="pull-right">
		                	<a href="#myModal" data-toggle="modal">
		                		<button type="button" id="create_category_btn" class="btn btn-block btn-primary">카테고리 생성</button>
		                	</a>
		                </div>
		             
		              </div>
		              
		               <div class="card-header">
		              		<div class="category-section">
								<%--  <c:forEach items="${ca_list}" var="ca" >
			               			<a href="/admin/product/admin_product?cacode=<c:out value="${ca.cacode}"/>">
			               				<input type="button" class="btn btn-secondary" value="<c:out value="${ca.caname}"/>">
			               			</a>
			               		 </c:forEach>           --%>
							
								<div class="cate_nav">
									<nav id="menu-container" class="arrow">
										<div id="btn-nav-previous">&lt;</div>
										<div id="btn-nav-next">&gt;</div>
										<div class="menu-inner-box">
											<div class="menu">

												<c:forEach items="${ca_list}" var="ca">
													<a
														href="/admin/product/admin_product?cacode=<c:out value="${ca.cacode}"/>">
														<input type="button" class="btn btn-secondary"
														value="<c:out value="${ca.caname}"/>">
													</a>
												</c:forEach>

											</div>
										</div>
									</nav>
								</div>



							</div>
		              
		               </div>
		              <!-- /.card-header -->
		              <div class="card-body">
		                <table id="example2" class="table table-bordered table-hover">
		                  <thead>
		                  <tr>
		                    <th>#</th>
		                    <th>이미지</th>
		                    <th>상품 이름</th>
		                    <th>가격</th>
		                    <th>댓글 횟수</th>
		                    <th>본 횟수</th>
		                    <th>등록일</th>
		                    <th>수정일</th>
		                    <th>카테고리</th>
		                  </tr>
		                  </thead>
		                  <tbody>
		                   	 
		                     <c:forEach items="${product}" var="pro" >
		                   	   
		                   	   <tr>
		                   	 		<td><c:out value="${pro.pdid}" /></td>
		                   	 		<%-- <c:if test="${not empty pro.pd_attachList[0].pd_uploadPath}">
		                   	 		<td><img src="/resources/upload/<c:out value="${pro.pd_attachList[0].pd_uploadPath}" />\<c:out value="${pro.pd_attachList[0].pd_uuid}" />_<c:out value="${pro.pd_attachList[0].pd_fileName}" />" height='50' width='50'></td>
		                   	 		</c:if>
		                   	 		<c:if test="${empty pro.pd_attachList[0].pd_uploadPath}">
		                   	 		<td><img src="/resources/img/noimage.png" height='50' width='50'></td>
		                   	 		</c:if> --%>
		                   	 		<c:if test="${null ne pro.main_img}">
                                    <td><img src="/resources/upload/${pro.main_img}" width="50" height="50"></td>
                                    </c:if>
                                    <c:if test="${null eq pro.main_img}">
                                    <td><img src="/resources/img/noimage.png" alt="" width="50" height="50"></td>
                                    </c:if>
		                   	 		<td><a class='move' href='<c:out value="${pro.pdid}"/>'>
		                   	 		<c:out value="${pro.pdname}" /></a></td>
		                   	 		<td><c:out value="${pro.pdprice}" /></td>
		                   	 		<td><c:out value="${pro.pdreviewcnt}" /></td>
		                   	 		<td><c:out value="${pro.pdhit}" /></td>
		                   	 		<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${pro.regdate}"/></td>
		                   	 		<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${pro.updateDate}"/></td>
		                   	 		<td><c:out value="${pro.cacode}" /></td>
		                   	   </tr>
		                   	 </c:forEach> 
	                   	 
		                   	 
		                 </tbody>
		                </table>
							
							
							<br>
							<!-- 검색 -->
							<div class='row'>
								<div class="col-lg-12">

									<form id='searchForm' action="/admin/product/admin_product" method='get'>
										<select name='type' class="select_bar">
											<option value=""
												<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
											<option value="T"
												<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>이름</option>
											<option value="C"
												<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
											<option value="W"
												<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>가격</option>
											<option value="TC"
												<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>이름
												or 내용</option>
											<option value="TW"
												<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>이름
												or 가격</option>
											<option value="TWC"
												<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>이름
												or 내용 or 가격</option>
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
								<form id='actionForm' action="/admin/product/admin_product" method='get'>
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
		
		<!--카데고리  생성 Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">카테고리 생성</h4>
				</div>
				<div class="modal-body">
					<form action="/admin/product/category_create" method="post" role="form" enctype="multipart/form-data" name="category_form">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						
						<div class="form-group">
			                <label>카테고리 이름</label> 
			                <input class="form-control" name='caname' value=''>
						</div>    		
						
					</form>
				</div>
				
				<div class="modal-footer">
					<button id='modalRegisterBtn' type="button" class="btn btn-primary">만들기</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal" aria-hidden="true">닫기</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
        <!-- /.modal-dialog -->
	</div>
	<!-- 카데고리 모달 modal -->	
	
	
	<!--카데고리 관리 생성 Modal -->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">카테고리 관리</h4>
				</div>
				<div class="modal-body">
					
						<c:forEach items="${ca_list}" var="ca" varStatus="status">
							<form class="form-group row" name="abc">		
							  <div class="col-sm-4 mb-3 mb-sm-0">
                                        <input type="text" class="form-control" 
                                            value='<c:out value="${ca.cacode}"/>' id="c_${status.count}" name="cacode" readonly="readonly">
                           				
                              </div>
                              <div class="col-sm-4 mb-3 mb-sm-0">
                                        <input type="text" class="form-control" 
                                            value='<c:out value="${ca.caname}"/>' name="caname">
                           				
                              </div>
                              <div class="col-sm-4">
			               	 <button type="button" class="btn btn-primary " name ="ca_update_btn">수정</button>
							 <button type="button" class="btn btn-success " name ="ca_delete_btn">삭제</button>
			                </div>
												
						</form>	
						</c:forEach>	
						 
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal" aria-hidden="true">닫기</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
        <!-- /.modal-dialog -->
	</div>
	<!-- 카데고리 관리 모달 modal -->	



  </div>
  
  		
  
  
  <!-- /.content-wrapper -->

<%@include file="../../include/admin_footer.jsp"%>
<script type="text/javascript"> 
	$(document).ready(function() {

		$("#create_product_btn").on("click", function() {
			self.location = "/admin/product/admin_product_create";
		});

		var actionForm = $("#actionForm");

		
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
	
		$(".move").on("click",function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='pdid' value='" + $(this).attr("href")	+ "'>");
			actionForm.attr("action", "/admin/product/admin_product_get");
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


		
		$("#modalRegisterBtn").on("click", function(e){

		 	var ca_name = document.category_form.caname.value;

			if(!ca_name){
				 alert("카테고리 이름을 적어주세요");
				 document.category_form.caname.focus();
		         return;
				
			}else{

				$("form").submit();
				alert("카테고리 생성 성공");
	
			}
			
			 

		});



	    $('#btn-nav-previous').click(function(){
            $(".menu-inner-box").animate({scrollLeft: "-=100px"});
        });
        
        $('#btn-nav-next').click(function(){
            $(".menu-inner-box").animate({scrollLeft: "+=100px"});
        });


        $('[name="ca_delete_btn"]').on("click", function(e){

       		var header = $("meta[name='_csrf_header']").attr('content');
        	var token = $("meta[name='_csrf']").attr('content');
        	
        	var index = $('[name="ca_delete_btn"]').index(this);
        	console.log(index);
        /* 	var caname = $('[name="caname"]')[index+1].value;
        	console.log(caname); */
        	var cacode = $('[name="cacode"]')[index].value;
        	console.log(cacode);

 			$.ajax({
        			url : '/admin/product/category_delete',
        			type:  "POST",
        			data:  {
    						cacode : cacode
        			},
        			beforeSend: function(xhr){
                	 	        xhr.setRequestHeader(header, token);
                	},
        			success : function(){
        					console.log(cacode);
        					alert("삭제 완료");
        					window.location.href = "/admin/product/admin_product";
        				
        			},error : function(){
        					console.log(cacode);
        					console.log("실패");

        			}

        		});  
        				 

        });


        $('[name="ca_update_btn"]').on("click", function(e){

       		var header = $("meta[name='_csrf_header']").attr('content');
        	var token = $("meta[name='_csrf']").attr('content');
        	
        	var index = $('[name="ca_update_btn"]').index(this);
        	console.log(index);
        	var caname = $('[name="caname"]')[index+1].value;
        	console.log(caname); 
        	var cacode = $('[name="cacode"]')[index].value;
        	console.log(cacode);

 		 	$.ajax({
        			url : '/admin/product/category_update',
        			type:  "POST",
        			data:  {
    						cacode : cacode,
    						caname : caname
        			},
        			beforeSend: function(xhr){
                	 	        xhr.setRequestHeader(header, token);
                	},
        			success : function(){
        					console.log(cacode);
        					alert("수정 완료");
        					window.location.href = "/admin/product/admin_product";
        				
        			},error : function(){
        					console.log(cacode);
        					console.log("실패");

        			}

        		});   
        				 

        });


		

		
	});



</script>

</body>
</html>
