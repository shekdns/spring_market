<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 어드민 셋팅 -->

<%@include file="../../include/admin_setting.jsp"%>

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
   <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>상품 관리</h1>
          </div>
        
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
 

            <!-- general form elements -->
            <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">상품 정보</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">             
                <div class="form-group">
                  <label for="exampleInputBorder">상품 이름</label>
                  <input type="text" class="form-control form-control-border"  
                  value='<c:out value="${product.pdname }"/>' readonly="readonly" name="pdname">
                </div>
                
                 <div class="form-group">
                  <label for="exampleInputBorder">카테고리 코드</label>
                  <input type="text" class="form-control form-control-border"  
                  value='<c:out value="${product.cacode }"/>' readonly="readonly" name="cacode">
                </div>
                
                <div class="form-group">
                  <label for="exampleInputBorder">상품 가격</label>
                  <input type="text" class="form-control form-control-border"  
                  value='<c:out value="${product.pdprice }"/>' readonly="readonly" name="pdprice">
                </div>
                   
	          	 <div class="form-group">
	               <label for="exampleInputBorder">상품 내용</label>
	               <textarea id="summernote" name="pdcontent" readonly><c:out value="${product.pdcontent }"/></textarea>
	              </div> 
         
             <br>
             
                <div class="form-group">
                  <label for="exampleInputBorder">등록일자</label>
                  <input type="text" class="form-control form-control-border" 
                  value='<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${product.regdate}"/>' readonly="readonly" name="regdate">
                </div>
                
                <c:if test="${not empty product.updateDate}">
                	
                <div class="form-group">
                  <label for="exampleInputBorder">수정일자</label>
                  <input type="text" class="form-control form-control-border" 
                  value='<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${product.updateDate}"/>' readonly="readonly" name="updateDate">
                </div>

				</c:if>
				
				<div class="form-group">
				
					 <label for="exampleInputBorder">메인 이미지</label>
					  <div>
						<c:if test="${not empty product.main_img}">
						<a href="/resources/upload/${product.main_img}"
							target="_blank"> <img
							src="/resources/upload/${product.main_img}" height='300'
							width='300'></a>
						</c:if>
						
						<c:if test="${empty product.main_img}">
								<a href="/resources/img/noimage.png" target="_blank">
								<img src="/resources/img/noimage.png" height='200' width='200'></a>
						</c:if>
					 </div>
				</div>
				
				
				
             </div>
              <!-- /.card-body -->
            </div>
            
            
             <div class="card card-success">
	              <div class="card-header">
	                <h3 class="card-title">파일</h3>
	              </div>
	            	<div class="card-body">
		              <div class="uploadResult">
		             	 	<ul>
		             	 	  	
		             	 	  	
		             	 	</ul>
		      
		              </div>
	            	</div>
	            
	            
	            <div class="card-footer">
                	<button data-oper='modify' class="btn btn-primary">수정하기</button>
                	<button data-oper='list' class="btn btn-info">목록</button>
                </div>
                
                <form id='operForm' action="/admin/product/admin_product_modify" method="get">
					<input type='hidden' id='pdid' name='pdid' value='<c:out value="${product.pdid}"/>'>
					<input type='hidden' name='pageNum' value='<c:out value="${product.cacode}"/>'>
					<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
					<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
					<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
					<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>  
				</form>
            		
            		
            </div>
            
            
            
            
            <!-- /.card -->
   
            <!-- /.card -->
          </div>
          <!--/.col (right) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
		             
				

  </div>
  <!-- /.content-wrapper -->
	<%@include file="../../include/admin_footer.jsp"%>
	<script type="text/javascript">

		//썸네일 파일명을 가져오는 함수
		function getThumbFileName(fullFilePath) {
			var arrString = fullFilePath.split("/");
			console.log(arrString);
			arrString.splice(-1, 1, "s_" + arrString[arrString.length - 1]);
			return arrString.join("/");
		}

	
	  $('#summernote').summernote({
	        placeholder: '정보를 입력해주세요.',
	        tabsize: 2,
	        height: 100
	  });

	  $('#summernote').summernote('disable');

	  $(document).ready(function() {
		  var operForm = $("#operForm"); 
		  
		  $("button[data-oper='modify']").on("click", function(e){
		    
		    operForm.attr("action","/admin/product/admin_product_modify").submit();
		    
		  });
		  
		    
		  $("button[data-oper='list']").on("click", function(e){
		    
		    operForm.find("#pdid").remove();
		    operForm.attr("action","/admin/product/admin_product")
		    operForm.submit();
		    
		  });  


		//파일 들고오기
			(function(){
				
				var pdid = '<c:out value="${product.pdid}"/>';

				$.getJSON("/admin/product/getProductAttachList", {pdid : pdid}, function(arr){
					console.log(arr);

					var str = "";

					$(arr).each(function(i, attach){

						if(attach.pd_filetype){
							var fileCallPath = encodeURIComponent( attach.pd_uploadPath + "/s_" + attach.pd_uuid + "_" + attach.pd_fileName);

				              str += "<li data-path='"+attach.pd_uploadPath+"' data-uuid='"+attach.pd_uuid+"' data-filename = '"+attach.pd_fileName+"' data-type='"+attach.pd_filetype+"'><div>";
				              str += "<img src='/display?fileName="+fileCallPath+"' width='200px' height='200px'>";
				              str += "</div>";
				              str += "</li>";
					
							}else{
				              str += "<li data-path='"+attach.pd_uploadPath+"' data-uuid='"+attach.pd_uuid+"' data-filename = '"+attach.pd_fileName+"' data-type='"+attach.pd_filetype+"'><div>";
				              str += "<span> "+attach.pd_fileName+" </span><br/> ";
				              str += "<img src='/resources/img/attach.jpg' width='150px' height='150px'></a>";
				              str += "</div>";
				              str += "</li>";

						}

					});

       					   $(".uploadResult ul").html(str);
          
				});
	
			})();


			$(".uploadResult").on("click", "li", function(e){

				console.log("view image");

				var liObj = $(this);

				var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));

			        if(liObj.data("type")){
			          path.replace(new RegExp(/\\/g),"/");
			          if (confirm("다운로드 하시겠습니까?.") == true) {
		    	          self.location = "/download?fileName=" +path;
		              } else {
		                  return;
		              }
			        }else{
			        	  if (confirm("다운로드 하시겠습니까?.") == true) {
			    	          self.location = "/download?fileName=" +path;
			              } else {
			                  return;
			              }
			        }


			});

      
				

			
		  
		});
	</script>
</body>
</html>