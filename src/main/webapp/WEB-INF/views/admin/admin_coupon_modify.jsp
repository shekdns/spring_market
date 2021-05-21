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
                <h3 class="card-title">쿠폰 수정</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <h4>정보 입력</h4>
                <form action="/admin/admin_coupon_modify" method="post" role="form" enctype="multipart/form-data" name="coupon_form" id="coupon_form">
                      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                	  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
			          <input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
				      <input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
					  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
					  <input type='hidden' name='c_cp_idx' value='<c:out value="${coupon.c_cp_idx }"/>'>
				

                <div class="form-group">
                  <label for="exampleInputBorder">쿠폰 이름</label>
                  <input type="text" class="form-control form-control-border" id="exampleInputBorder" 
                    value='<c:out value="${coupon.c_cp_name }"/>' name="c_cp_name">
                </div>
               <!-- CK에디터 -->
               <div class="form-group">
               <label for="exampleInputBorder">쿠폰 정보</label>
               <textarea id="summernote" name="c_cp_content"><c:out value="${coupon.c_cp_content }"/></textarea>
              </div>
              
               <!-- CK데이터 -->
             <br>
                <div class="form-group">
                  <label for="exampleSelectBorder">쿠폰 타입</label>
                  <select class="custom-select form-control-border" id="exampleSelectBorder" name="c_cp_type">
                   <option value="<c:out value="${coupon.c_cp_type }"/>"><c:out value="${coupon.c_cp_type }"/></option>
				   <option value="기본">기본</option>
				   <option value="신규">신규</option>
				   <option value="감사">감사</option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="exampleSelectBorderWidth2">할인율</label>
                  
                    <c:if test="${coupon.c_cp_price == 1000}">
              		    <c:set var="selected1000" value="selected" />
		            </c:if>
		            <c:if test="${coupon.c_cp_price == 2000}">
		                <c:set var="selected2000" value="selected" />
		            </c:if>
		            <c:if test="${coupon.c_cp_price == 3000}">
		                <c:set var="selected3000" value="selected" />
		            </c:if>

                  <select class="custom-select form-control-border border-width-2" id="exampleSelectBorderWidth2" name="c_cp_price">
                    <%-- <option value="<c:out value="${coupon.c_cp_price }"/>"><c:out value="${coupon.c_cp_price }"/>할인</option> --%>
				    <option value="1000" ${selected1000}>1000할인</option>
				    <option value="2000" ${selected2000}>2000할인</option>
				    <option value="3000" ${selected3000}>3000할인</option>
                  </select>
                </div>
                
                <div class="card-footer">
                	<!-- <button class="btn btn-success" id="coupon_createBtn">생성하기</button>
                	<button class="btn btn-danger" id="coupon_resetBtn">초기화</button>	 -->
                	
	                	<button type="submit" data-oper='modify' class="btn btn-success">Modify</button>
						<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
						<button type="submit" data-oper='list' class="btn btn-info">List</button>
                </div>
           	  
                </form>
           		
            
                
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
   
            <!-- /.card -->
          </div>
          <!--/.col (right) -->
        </div>
        
          <!-- 파일 업로드 부분 -->
        <div class="row">
        	 <div class="col-md-12">
        		<div class="card card-success">
	            	  <div class="card-header">
	              		  <h3 class="card-title">파일 수정</h3>
	             	 </div>
	             	 <div class="card-body">        
	             	 	
	             	 	  <div class="form-group uploadDiv">
		             	 	<label class="input-file-button" for="input-file">
							  업로드
							</label>
							<input type="file"  id="input-file" name="uploadFile" multiple style="display:none"/>
	             	 	  </div>
	             	 
	             	      	 	  
	             	 	  <div class="uploadResult">
	             	 	  	<ul>
	             	 	  		
	             	 	  	
	             	 	  	</ul>
	      
	             	 	  </div>
	             	 	
	             	 </div>
             	 </div>
        	
        	 </div>
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

	  
	  $(document).ready(function() {


		  var formObj = $("form");

		  $('button').on("click", function(e){
		    
		    e.preventDefault(); 
		    
		    var operation = $(this).data("oper");
		    
		    console.log(operation);
		    
		    if(operation === 'remove'){
		      alert("삭제되었습니다.");
		      formObj.attr("action", "/admin/admin_coupon_delete");
		      formObj.submit();
		    }else if(operation === 'list'){
		      //move to list
		      formObj.attr("action", "/admin/admin_coupon").attr("method","get");

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

				var str = "";

				$(".uploadResult ul li").each(function(i, obj){

					var jobj = $(obj);

					console.dir(jobj);
					str += "<input type='hidden' name='c_attachList["+i+"].c_uuid' value='"+jobj.data("uuid")+"'>";
					str += "<input type='hidden' name='c_attachList["+i+"].c_uploadPath' value='"+jobj.data("path")+"'>";
					str += "<input type='hidden' name='c_attachList["+i+"].c_fileName' value='"+jobj.data("filename")+"'>";
					str += "<input type='hidden' name='c_attachList["+i+"].c_filetype' value='"+jobj.data("type")+"'>";
				});
			    
			    formObj.append(str).submit();
			    alert("수정되었습니다.");
			   }
		  });


		  //파일 js
		  
		  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		  var maxSize = 5242880; // 5MB

			//파일 체크
			function checkExtension(fileName, fileSize){

				if(fileSize >= maxSize){
					alert("파일 사이즈 초과");
					return false;
				}

				if(regex.test(fileName)){
					alert("해당 종류의 파일은 업로드 할 수 없습니다.");
					return false;
				}
				return true;
			
			}
			//파일 체크
			
			//showUploadResult
			function showUploadResult(uploadResultArr){
				
				if(!uploadResultArr || uploadResultArr.length == 0){
					return;
				}

				var uploadUL = $(".uploadResult ul");

				var str = "";

				$(uploadResultArr).each(
					function(i, obj){
						
						if(obj.image){
							var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);

							str += "<li data-path='"+obj.uploadPath+"'";
							str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'>"
							str +="<div>";
							str += "<span> " + obj.fileName + "</span>";
							str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
							str += "<img src='/display?fileName="+fileCallPath+"' width='150px' height='150px'>";
							str += "</div>";
							str += "</li>";
						}else{
							var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
							var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");

							str += "<li data-path='"+obj.uploadPath+"'";
							str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
							str +=" ><div>";
							str += "<span> " + obj.fileName + "</span>";
							str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
							str += "<img src='/resources/img/attach.jpg' width='150px' height='150px'></a>";
							str += "</div>"; 
							str += "</li>";
						}

					
					});

					uploadUL.append(str);
			}
			
			//showUploadResult

			$("input[type='file']").change(function(e){

				var header = $("meta[name='_csrf_header']").attr('content');
				var token = $("meta[name='_csrf']").attr('content');
		
				var formData = new FormData();

				var inputFile = $("input[name='uploadFile']");

				var files = inputFile[0].files;

				for(var i = 0; i < files.length; i++){
					
					if(!checkExtension(files[i].name, files[i].size)){
						return false;
					}
					formData.append("uploadFile", files[i]);
				}
				
				$.ajax({
					url : '/uploadAjaxAction',
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST',
					dataType : 'json',
					beforeSend: function(xhr){
	        	 	        xhr.setRequestHeader(header, token);
	        	 	},
					success : function(result){
						console.log(result);
						showUploadResult(result);
					}

				});



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
				              str += "<span> "+attach.c_fileName+" </span> ";
							  str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				              str += "<img src='/display?fileName="+fileCallPath+"' width='200px' height='200px'>";
				              str += "</div>";
				              str += "</li>";
					
							}else{
				              str += "<li data-path='"+attach.c_uploadPath+"' data-uuid='"+attach.c_uuid+"' data-filename = '"+attach.c_fileName+"' data-type='"+attach.c_filetype+"'><div>";
				              str += "<span> "+attach.c_fileName+" </span> ";
							  str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				              str += "<img src='/resources/img/attach.jpg' width='150px' height='150px'></a>";
				              str += "</div>";
				              str += "</li>";

						}

					});

       					   $(".uploadResult ul").html(str);
          
				});
	
			})();

			
			$(".uploadResult").on("click", "button", function(e){

				console.log("delete file");

				if(confirm("정말 삭제 하시겠습니까? ")){

					var targetLi = $(this).closest("li");
					targetLi.remove();
				}

			});
			


			
	});
	</script>
</body>
</html>