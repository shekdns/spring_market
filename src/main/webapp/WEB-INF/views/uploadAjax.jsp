<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="_csrf_header" content="${_csrf.headerName}">
<meta name="_csrf" content="${_csrf.token}">
 <link rel="stylesheet" href="/resources/css/test.css">
</head>
<body>
	
	<h1>uploadAjax</h1>
	
	<div class="uploadDiv">
		<input type="file" name="uploadFile" multiple>
		
	</div>
	
	<button id="uploadBtn">upload</button>
	
	<div class="uploadResult">
		<ul>


		</ul>
	</div>
	
	
	

</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>  
<script>
	

	$(document).ready(function(){

		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; // 5MB

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


		var cloneObj = $(".uploadDiv").clone();

		var uploadResult = $(".uploadResult ul");

		function showUploadedFile(uploadResultArr){
			
			var str = "";

			$(uploadResultArr).each(
				function(i, obj){
					
					if(!obj.image){

						var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
						
						var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");



						str += "<li><div><a href='/download?fileName="+fileCallPath+"'>" + "<img src='/resources/img/attach.jpg'>" + obj.fileName + "</a>"+
						"<span data-file=\'"+fileCallPath+"\' data-type='file'> x </span>"+ "</div></li>";
					}else{
						
						var fileCallPath = encodeURIComponent( obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
						
						// var originalPath = obj.uploadPath+ "\\"+ obj.uuid + "_" + obj.fileName;
						// originalPath = originalPath.replace(new RegExp(/\\/g),"/");
						
						str += "<li><img src='/display?fileName="+fileCallPath+"'>"+
							"<span data-file=\'"+fileCallPath+"\' data-type='file'> x </span>"+ "</li>";

					}
					

					
				});

			uploadResult.append(str);
		}


		
		$("#uploadBtn").on("click", function(e){

			var formData = new FormData();

			var inputFile = $("input[name='uploadFile']");

			var files = inputFile[0].files;

			console.log(files);

			  var header = $("meta[name='_csrf_header']").attr('content');
			  var token = $("meta[name='_csrf']").attr('content');
			  console.log(header);
			  console.log(token);


			//파일 데이터 추가
			for(var i = 0; i< files.length; i++){
				
				if(!checkExtension(files[i].name, files[i].size)){
					return false;
				}

				formData.append("uploadFile", files[i]);

			}
			
			$.ajax({
				url: '/uploadAjaxAction',
				 processData : false,
				 contentType: false,
				 data: formData,
				 type : 'POST',
				 dataType:'json',
        	 	 beforeSend: function(xhr){
        	 	        xhr.setRequestHeader(header, token);
        	 	 },
				 success: function(result){
				 	
					console.log(result);
					showUploadedFile(result);
					$(".uploadDiv").html(cloneObj.html());
				 }
			});
	
		});


		$(".uploadResult").on("click", "span", function(e){

			var targetFile = $(this).data("file");
			var type = $(this).data("type");
		
			  var header = $("meta[name='_csrf_header']").attr('content');
			  var token = $("meta[name='_csrf']").attr('content');
			$.ajax({

				url:'/deleteFile',
				data: {fileName: targetFile, type:type},
				dataType: 'text',
				type: 'POST',
				beforeSend: function(xhr){
     	 	        xhr.setRequestHeader(header, token);
     	 	 	},
					success: function(result){
						alert(result);
					}

			});


		});

	});

</script>
</html>