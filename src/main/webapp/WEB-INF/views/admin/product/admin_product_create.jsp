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
                <h3 class="card-title">상품 등록</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <h4>정보 입력</h4>
                <form action="/admin/product/admin_product_create" method="post" role="form" enctype="multipart/form-data" name="product_form" id="product_form">
                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                	<input type="hidden" name="main_img" value="">
                <div class="form-group">
                  <label for="exampleInputBorder">상품 이름</label>
                  <input type="text" class="form-control form-control-border" id="exampleInputBorder" placeholder="" name="pdname">
                </div>
                
	           <div class="form-group">
                  <label for="exampleSelectBorder">카테고리 선택</label>
                  <select class="custom-select form-control-border" id="exampleSelectBorder" name="cacode">
                    <option value="">선택해주세요</option>
                   <c:forEach items="${ca_list}" var="ca">
      				<option value="${ca.cacode}"><c:out value="${ca.caname}" /></option>
          		   </c:forEach>
                  </select>
                </div>
               
                <div class="form-group">
                  <label for="exampleInputBorder">상품 가격</label>
                  <input type="text" class="form-control form-control-border" id="pdprice" placeholder="" name="pdprice">
                </div>
               <!-- CK에디터 -->
	             <div class="form-group">
	               <label for="exampleInputBorder">상품 내용</label>
	               <textarea id="summernote" name="pdcontent"></textarea>
	              </div>
             
               <!-- CK데이터 -->
             <br>  	  
       
	             
		           <div class="inputArea">
						 <label class="gdsImg" for="gdsImg">업로드</label>
						 <input type="file"  id="gdsImg" name="file" multiple style="display:none" />
						 <div class="select_img"><img src="" />
						 
						 </div>
						 

					</div>
             
             
             
             
                </form>
           		
           		<div class="card-footer">
                	<button class="btn btn-success" id="product_createBtn">생성하기</button>
                	<button class="btn btn-danger float-right" id="product_resetBtn">초기화</button>	
                </div>
                
                
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
	              		  <h3 class="card-title">파일 업로드</h3>
	             	 </div>
	             	 <div class="card-body">
	             	 	<!-- <input type="file" name="uploadFile" multiple> -->
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
	<%@include file="../../include/admin_footer.jsp"%>
	<script type="text/javascript">


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


	  $("#product_createBtn").on("click", function(e){
		
			var pdprice = $('summernote').val(); 

			var price_check = document.product_form.pdprice.value;
			

			var formObj = $("form[role='form']");
			var formObj2 = document.product_form;
			
			if(!document.product_form.pdname.value){
				 alert("상품 이름을 적어주세요");
				 document.product_form.pdname.focus();
		         return;
				
			}else if(!document.product_form.pdcontent.value){
				 alert("상품 내용을 적어주세요");
				 document.product_form.pdcontent.focus();
		         return;
				
			}else if(!document.product_form.pdprice.value){
				  alert("가격을 적어주세요");
		          document.product_form.pdprice.focus();
		          return;
			}else if(isFinite(price_check) == false){

				alert("정확한 가격을 적어주세요");
		        document.product_form.pdprice.focus();
		        return;
				
			}else{
				e.preventDefault();
				/* $("form").submit(); */
				var str = "";

				$(".uploadResult ul li").each(function(i, obj){

					var jobj = $(obj);

					console.dir(jobj);
					str += "<input type='hidden' name='pd_attachList["+i+"].pd_uuid' value='"+jobj.data("uuid")+"'>";
					str += "<input type='hidden' name='pd_attachList["+i+"].pd_uploadPath' value='"+jobj.data("path")+"'>";
					str += "<input type='hidden' name='pd_attachList["+i+"].pd_fileName' value='"+jobj.data("filename")+"'>";
					str += "<input type='hidden' name='pd_attachList["+i+"].pd_filetype' value='"+jobj.data("type")+"'>";
					
				});

				formObj.append(str).submit();
				alert("생성되었습니다."); 
				
			}

		});

	  
	  $("#product_resetBtn").on("click", function(e){

		  var pd_content = $('summernote').val(); 
		  
		  $( "#product_form" ).each( function () {
	            this.reset();
	            pd_content.reset();
	        });

	  });


	  $(document).ready(function(){

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
	  });
	  
	  $(".uploadResult").on("click", "button", function(e){

			var header = $("meta[name='_csrf_header']").attr('content');
			var token = $("meta[name='_csrf']").attr('content');
			
			console.log("delete file");

			var targetFile = $(this).data("file");
			var type = $(this).data("type");

			var targetLi = $(this).closest("li");

			$.ajax({
				url: '/deleteFile',
				data : {fileName: targetFile,
						type: type
					   },
				dataType : 'text',
				type : 'POST',
				beforeSend: function(xhr){
    	 	        xhr.setRequestHeader(header, token);
    	        },
				success : function(result){
						alert(result);
						targetLi.remove();
				}

			});

	  });

	</script>
</body>
</html>