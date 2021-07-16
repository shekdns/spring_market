<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 <%@include file="../../include/front_setting.jsp"%>
 <%@include file="../../include/front_header.jsp"%>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
   <link rel="stylesheet" href="/resources/css/qa_register.css">
  <meta name="_csrf_header" content="${_csrf.headerName}">
  <meta name="_csrf" content="${_csrf.token}">


<div class="register_section">
	<div class="content-wrapper">
	   <section class="content-header">
	      <div class="container-fluid">
	        <div class="row mb-2">
	          <div class="col-sm-6">
	            
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
	                
	              </div>
	              <!-- /.card-header -->
	              <div class="card-body">
	            
	                <form action="/front/qa_board/qa_board_register" method="post" role="form" enctype="multipart/form-data" name="qa_form" id="qa_form">
	                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	                	<input type="hidden" name="qa_file" value="">
	                <div class="form-group">
	                  <label for="exampleInputBorder">글 제목</label>
	                  <input type="text" class="form-control form-control-border" id="exampleInputBorder" placeholder="" name="qa_title">
	                </div>
	                
	               
	                <div class="form-group">
	                  <label for="exampleInputBorder">작성자</label>
	                  <input type="text" class="form-control form-control-border" id="" placeholder="" 
	                  	name="userid" value="${principal.username}" readonly="readonly">
	                </div>
	               <!-- CK에디터 -->
		             <div class="form-group">
		               <label for="exampleInputBorder">내용</label>
		               <textarea id="summernote" name="qa_content"></textarea>
		              </div>
	             
	               <!-- CK데이터 -->
	             <br>  	  
	       			 <div class="form-group">
	                  <label for="exampleInputBorder">비밀번호</label>
	                  <input type="password" class="form-control form-control-border" id="exampleInputBorder" placeholder="" name="qa_pw">
	                </div>
		             
			           <div class="inputArea">
							 <label class="gdsImg" for="gdsImg">업로드</label>
							 <label id="file_reset">파일 초기화</label>
							 <input type="file"  id="gdsImg" name="file" multiple style="display:none" />
							 <div class="select_img"><img src="" />
							 
							 </div>
							 
	
						</div>
	             
	             
	             
	             
	                </form>
	           		
	           		<div class="card-footer">
	                	<button class="btn btn-success" id="qa_createBtn">생성하기</button>
	                	<button class="btn btn-danger float-right" id="qa_resetBtn">초기화</button>	
	                </div>
	                
	                
	              </div>
	              <!-- /.card-body -->
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



<%@include file="../../include/front_footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
 <!-- Popper JS -->
<script>
jQuery.curCSS = function(element, prop, val) {
    return jQuery(element).css(prop, val);
};

$('#summernote').summernote({
    placeholder: '글을 적어주세요.',
    tabsize: 2,
    height: 100
  });

$("#gdsImg").change(function(){
	   if(this.files && this.files[0]) {
	    var reader = new FileReader;
	    reader.onload = function(data) {
	     $(".select_img img").attr("src", data.target.result).width(300);        
	    }
	    reader.readAsDataURL(this.files[0]);
	   }
	  });

$("#qa_resetBtn").on("click", function(e){

	  //var pd_content = $('summernote').val(); 
	  
	  $( "#qa_form" ).each( function () {
          this.reset();
          $('#summernote').summernote('reset');
      });

});

$("#file_reset").on("click", function(e){

	$("#gdsImg").val("");
	$(".select_img img").attr("src", "").width(0);  
	//$(".select_img img").hide();
	
});


$("#qa_createBtn").on("click", function(e){

	var form = $("form[role='form']");
	form.submit();	

});

$(document).ready(function() {


});





</script>