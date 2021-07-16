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
          
	                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	                	<input type="hidden" name="qa_file" value="">
	                <div class="form-group">
	                  <label for="exampleInputBorder">글 제목</label>
	                  <input type="text" class="form-control form-control-border" id="exampleInputBorder" 
	                  placeholder="" name="qa_title" value="<c:out value="${qa_board.qa_title}"/>" readonly="readonly">
	                </div>
	                
	               
	                <div class="form-group">
	                  <label for="exampleInputBorder">작성자</label>
	                  <input type="text" class="form-control form-control-border" id="" placeholder="" 
	                  	name="userid" value="<c:out value="${qa_board.userid}"/>" readonly="readonly">
	                </div>
	               <!-- CK에디터 -->
		             <div class="form-group">
		               <label for="exampleInputBorder">내용</label>
		               <textarea id="summernote" name="qa_content" readonly="readonly"><c:out value="${qa_board.qa_content}"/></textarea>
		              </div>
	             
	               <!-- CK데이터 -->
	             <br>  	  
		             
			                <div class="form-group">
                  <label for="exampleInputBorder">등록일자</label>
                  <input type="text" class="form-control form-control-border" 
                  value='<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${qa_board.regdate}"/>' readonly="readonly" name="regdate">
                </div>
                
                <c:if test="${not empty qa_board.updatedate}">
                	
                <div class="form-group">
                  <label for="exampleInputBorder">수정일자</label>
                  <input type="text" class="form-control form-control-border" 
                  value='<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${qa_board.updatedate}"/>' readonly="readonly" name="updateDate">
                </div>

				</c:if>
				
				<div class="form-group">
				
					 <label for="exampleInputBorder">메인 이미지</label>
					  <div>
						<c:if test="${not empty qa_board.qa_file}">
						<a href="/resources/upload/${qa_board.qa_file}"
							target="_blank"> <img
							src="/resources/upload/${qa_board.qa_file}" height='300'
							width='300'></a>
						</c:if>
						
	<%-- 					<c:if test="${empty product.main_img}">
								<a href="/resources/img/noimage.png" target="_blank">
								<img src="/resources/img/noimage.png" height='200' width='200'></a>
						</c:if> --%>
					 </div>
				</div>

	          
	           
	           	<div class="card-footer">
                		<sec:authentication property="principal" var="pinfo"/>
							<sec:authorize access="isAuthenticated()">
								<c:if test="${pinfo.username eq qa_board.userid}">
				                	<button data-oper='modify' class="btn btn-primary">수정하기</button>
				                	<button data-oper='list' class="btn btn-info">목록</button>
	                			</c:if>
	       						<c:if test="${pinfo.username ne qa_board.userid}">
				                	<button id="reply_button" class="btn btn-warning">답글달기</button>
				                	<button data-oper='list' class="btn btn-info">목록</button>
	                			</c:if>
	                	</sec:authorize>

                </div>
                
                
                <form id='operForm' action="/front/qa_board/qa_board_modify" method="get">
					<input type='hidden' id='qa_idx' name='qa_idx' value='<c:out value="${qa_board.qa_idx}"/>'>
					<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
					<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
					<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
					<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>  
				</form>
	                
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
  
$('#summernote').summernote('disable');
  
$("#gdsImg").change(function(){
	   if(this.files && this.files[0]) {
	    var reader = new FileReader;
	    reader.onload = function(data) {
	     $(".select_img img").attr("src", data.target.result).width(300);        
	    }
	    reader.readAsDataURL(this.files[0]);
	   }
	  });


$(document).ready(function() {


});


$("#reply_button").on("click", function(){


	
});



$(document).ready(function() {
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){
    
    operForm.attr("action","/front/qa_board/qa_board_modify").submit();
    
  });
  
    
  $("button[data-oper='list']").on("click", function(e){
    
    operForm.find("#pdid").remove();
    operForm.attr("action","/front/qa_board/qa_board_list");
    operForm.submit();
    
  });  


});

</script>