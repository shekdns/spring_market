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
   <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>쿠폰 관리</h1>
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
                <h3 class="card-title">쿠폰 정보</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">             
                <div class="form-group">
                  <label for="exampleInputBorder">쿠폰 이름</label>
                  <input type="text" class="form-control form-control-border"  
                  value='<c:out value="${coupon.c_cp_name }"/>' readonly="readonly" name="c_cp_name">
                </div>
                
        
          	 <div class="form-group">
               <label for="exampleInputBorder">쿠폰 내용</label>
               <textarea id="summernote" name="c_cp_content" readonly><c:out value="${coupon.c_cp_content }"/></textarea>
              </div> 
         
             <br>
                <div class="form-group">
                  <label for="exampleInputBorder">쿠폰 타입</label>
                  <input type="text" class="form-control form-control-border"  
                  value='<c:out value="${coupon.c_cp_type }"/>' readonly="readonly" name="c_cp_type">
                </div>
                <div class="form-group">
                  <label for="exampleInputBorder">쿠폰 할인율</label>
                  <input type="text" class="form-control form-control-border" 
                  value='<c:out value="${coupon.c_cp_price }"/>' readonly="readonly" name="c_cp_price">
                </div>
                
                 <div class="form-group">
                  <label for="exampleInputBorder">등록일자</label>
                  <input type="text" class="form-control form-control-border" 
                  value='<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${coupon.regdate}"/>' readonly="readonly" name="regdate">
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
                
                <form id='operForm' action="/admin/admin_coupon_modify" method="get">
					<input type='hidden' id='c_cp_idx' name='c_cp_idx' value='<c:out value="${coupon.c_cp_idx}"/>'>
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
	<%@include file="../include/admin_footer.jsp"%>
	<script type="text/javascript">

	  $('#summernote').summernote({
	        placeholder: '정보를 입력해주세요.',
	        tabsize: 2,
	        height: 100
	  });

	  $('#summernote').summernote('disable');

	  $(document).ready(function() {
		  var operForm = $("#operForm"); 
		  
		  $("button[data-oper='modify']").on("click", function(e){
		    
		    operForm.attr("action","/admin/admin_coupon_modify").submit();
		    
		  });
		  
		    
		  $("button[data-oper='list']").on("click", function(e){
		    
		    operForm.find("#c_cp_idx").remove();
		    operForm.attr("action","/admin/admin_coupon")
		    operForm.submit();
		    
		  });  


		//파일 들고오기
			(function(){
				
				var c_cp_idx = '<c:out value="${coupon.c_cp_idx}"/>';

				$.getJSON("/admin/getCouponAttachList", {c_cp_idx : c_cp_idx}, function(arr){
					console.log(arr);

					var str = "";

					$(arr).each(function(i, attach){

						if(attach.c_filetype){
							var fileCallPath = encodeURIComponent( attach.c_uploadPath + "/s_" + attach.c_uuid + "_" + attach.c_fileName);

				              str += "<li data-path='"+attach.c_uploadPath+"' data-uuid='"+attach.c_uuid+"' data-filename = '"+attach.c_fileName+"' data-type='"+attach.c_filetype+"'><div>";
				              str += "<img src='/display?fileName="+fileCallPath+"' width='200px' height='200px'>";
				              str += "</div>";
				              str += "</li>";
					
							}else{
				              str += "<li data-path='"+attach.c_uploadPath+"' data-uuid='"+attach.c_uuid+"' data-filename = '"+attach.c_fileName+"' data-type='"+attach.c_filetype+"'><div>";
				              str += "<span> "+attach.c_fileName+" </span><br/> ";
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
			        }else{
			          self.location = "/download?fileName=" +path;
			        }


			});

      
				

			
		  
		});
	</script>
</body>
</html>