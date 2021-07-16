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
	            
	                <form action="/front/qa_board/qa_board_modify" method="post" role="form" enctype="multipart/form-data" name="qa_form" id="qa_form">
	                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	                	
	                	  <input type='hidden' name='qa_idx' value='${qa_board.qa_idx }'>
	                	  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
				          <input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
					      <input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
						  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
						  
					
					<c:choose>
						<c:when test="${not empty qa_board.qa_file}">
							<input type="hidden" name="qa_file" value="${qa_board.qa_file}">
						</c:when>
						<c:otherwise>
							<input type="hidden" name="qa_file" value="">
						</c:otherwise>
					</c:choose>
	                	
	                <div class="form-group">
	                  <label for="exampleInputBorder">글 제목</label>
	                  <input type="text" class="form-control form-control-border" id="exampleInputBorder" 
	                  placeholder="" name="qa_title" value="<c:out value="${qa_board.qa_title}"/>">
	                </div>
	                
	               
	                <div class="form-group">
	                  <label for="exampleInputBorder">작성자</label>
	                  <input type="text" class="form-control form-control-border" id="" placeholder="" 
	                  	name="userid" value="<c:out value="${qa_board.userid}"/>" readonly="readonly">
	                </div>
	               <!-- CK에디터 -->
		             <div class="form-group">
		               <label for="exampleInputBorder">내용</label>
		               <textarea id="summernote" name="qa_content"><c:out value="${qa_board.qa_content}"/></textarea>
		              </div>
	             
	               <!-- CK데이터 -->
	             <br>  	  
	       			 <div class="form-group">
	                  <label for="exampleInputBorder">비밀번호</label>
	                  <input type="password" class="form-control form-control-border" id="exampleInputBorder" 
	                  placeholder="" name="qa_pw" value="<c:out value="${qa_board.qa_title}"/>">
	                </div>
		             
			          <div class="form-group">
						 <label for="exampleInputBorder">메인 이미지</label>
						<div>
						<c:if test="${not empty qa_board.qa_file}">
				
							<a href="/resources/upload/${qa_board.qa_file}"
							target="_blank"> <img
							src="/resources/upload/${qa_board.qa_file}" height='300'
							width='300'></a>
						</c:if>
						</div>
						<br>
						<label for="exampleInputBorder">수정될 이미지</label>
						<div class="inputArea">
						 <label class="gdsImg" for="gdsImg">업로드</label>
						 <label id="file_reset">파일 초기화</label>
						 <input type="file"  id="gdsImg" name="file" multiple style="display:none" />
						 <div class="select_img"><img src="" />
						 
						 </div>
						 

					</div>
					</div>
	             
	             
	             
	             
	                </form>
	           		
	            <div class="card-footer">
                	
	                	<button type="submit" data-oper='modify' class="btn btn-success">Modify</button>
						<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
						<button type="submit" data-oper='list' class="btn btn-info">List</button>
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


$("#gdsImg").change(function(){
	   if(this.files && this.files[0]) {
	    var reader = new FileReader;
	    reader.onload = function(data) {
	     $(".select_img img").attr("src", data.target.result).width(300);        
	    }
	    reader.readAsDataURL(this.files[0]);
	   }
	  });

	
$('#summernote').summernote({
     placeholder: '정보를 입력해주세요.',
     tabsize: 2,
     height: 100
   });

$("#main_file_reset").on("click", function(e){

	$("#gdsImg").val("");
	$(".select_img img").attr("src", "").width(0);  
	//$(".select_img img").hide();
	
});

$("#file_reset").on("click", function(e){

	$("#gdsImg").val("");
	$(".select_img img").attr("src", "").width(0);  
	//$(".select_img img").hide();
	
});

$(document).ready(function() {


	  var formObj = $("#qa_form");

	  $('button').on("click", function(e){
	    
	    e.preventDefault(); 
	    
	    var operation = $(this).data("oper");
	    
	    console.log(operation);
	    
	    if(operation === 'remove'){
	      alert("삭제되었습니다.");
	      formObj.attr("action", "/front/qa_board/qa_board_delete");
	      formObj.submit();
	    }else if(operation === 'list'){
	      //move to list
	      formObj.attr("action", "/front/qa_board/qa_board_list").attr("method","get");

	      var pageNumTag = $("input[name='pageNum']").clone();
	      var amountTag = $("input[name='amount']").clone();
	      var keywordTag = $("input[name='keyword']").clone();
	      var typeTag = $("input[name='type']").clone();      
	      
	      formObj.empty();
	      
	      formObj.append(pageNumTag);
	      formObj.append(amountTag);
	      formObj.append(keywordTag);
	      formObj.append(typeTag);
	      formObj.submit();
	    }else{

			console.log("sumbit clicked");

		 
		    formObj.submit();
		    alert("수정되었습니다.");
		   }
	  });


});


</script>