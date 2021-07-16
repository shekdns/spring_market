<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 <%@include file="../include/front_setting.jsp"%>
<!--  <link rel="stylesheet" href="/resources/css/category.css"> -->
 <link rel="stylesheet" href="/resources/css/product_info.css">
 <%@include file="../include/front_header.jsp"%>
   <meta name="_csrf_header" content="${_csrf.headerName}">
  <meta name="_csrf" content="${_csrf.token}">


<div class="container single_product_container">
	<div class="row">
		<div class="col">

			<div class="breadcrumbs d-flex flex-row align-items-center">
				<ul>
					<li><a href="/front/index">Home</a></li>
					<li><a href="/front/category"><i class="fa fa-angle-right"
							aria-hidden="true"></i>Category</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-7">
			<div class="single_product_pics">
				<div class="row">
					<div class="col-lg-3 thumbnails_col order-lg-1 order-2">
							<div class="single_product_thumbnails">
								<ul>
									
									<c:if test="${not empty pro_file[0].pd_uploadPath}">
										<li class="active"><img src="/resources/upload/${pro.main_img}" alt="" data-image="/resources/upload/${pro.main_img}"></li>
										<c:forEach items="${pro_file}" var="pro">
									
										<li><img src="/resources/upload/<c:out value="${pro.pd_uploadPath}" />\<c:out value="${pro.pd_uuid}" />_<c:out value="${pro.pd_fileName}" />" alt="" 
										data-image="/resources/upload/<c:out value="${pro.pd_uploadPath}" />\<c:out value="${pro.pd_uuid}" />_<c:out value="${pro.pd_fileName}" />"></li>
								
										</c:forEach>
									</c:if>
									<c:if test="${empty pro_file[0].pd_uploadPath}">
										<li><img src="/resources/img/noimage.png" alt="" data-image="/resources/img/noimage.png"></li>
									</c:if>
									
									
								</ul>
							</div>
						</div>	
				
				
					<div class="col-lg-9 image_col order-lg-2 order-1">
						<div class="single_product_image">
				
							<div class="single_product_image_background">
							  <c:if test="${not empty pro.main_img}">
								<img id="main_img" src="/resources/upload/${pro.main_img}"> 
								<%-- <div class="single_product_image_background" style="background-image:url(/resources/upload/${pro.main_img});"></div> --%>
							  </c:if>
							  <c:if test="${empty pro.main_img}">
								<img src="/resources/img/noimage.png"/>
							  </c:if>
							</div>
						
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-5">
			<div class="product_details">
				<div class="product_details_title">
					<h2><c:out value="${pro.pdname }"/></h2>
					<p><c:out value="${pro.pdcontent }" escapeXml="false"/></p>
				
					
				</div>
		
				<div class="show_price">가격 :</div> <div class="product_price"><c:out value="${pro.pdprice }"/></div>

				<div
					class="quantity d-flex flex-column flex-sm-row align-items-sm-center">
						
						<span>수량:</span>
						<div class="quantity_selector">
							<span class="minus"><i class="fa fa-minus"aria-hidden="true"></i></span> 
							
							<span id="quantity_value">1</span> 
							<span class="plus"><i class="fa fa-plus" aria-hidden="true"></i></span>
						</div>
						
					<sec:authorize access="isAuthenticated()">
					
						<div class="red_button add_to_cart_button2">
							<a href="#" id="basket_go" data-username="${principal.username}">장바구니 넣기</a>
						</div>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						
						<div class="red_button add_to_cart_button2">
							<a href="#" id="plz_login">장바구니 넣기</a>
						</div>
					</sec:authorize>
				</div>
				
			<sec:authorize access="isAuthenticated()">
						<c:set var="flag" value="false" />
										<c:forEach items="${list}" var="list">
											<c:if test="${list.userid == principal.username && list.pdid == pro.pdid}">
										   		<c:set var="flag" value="true" />
											</c:if>
										</c:forEach>	
										
										<c:choose>
											   <c:when test="${flag}">
											     	<div class='like-wrapper'>									
											<a class='like-button liked' id="wish_delete"
											data-pdid="<c:out value="${pro.pdid}" />"
											data-id="${principal.username}"
											> <span class='like-icon'>
													<div class='heart-animation-1'></div>
													<div class='heart-animation-2'></div>
											</span> Like
											</a>

										</div>
											   </c:when>
											   <c:otherwise>
											     	<div class='like-wrapper'>									
											<a class='like-button' id="wish_like"
											data-pdid="<c:out value="${pro.pdid}" />"
											data-id="${principal.username}"
											> <span class='like-icon'>
													<div class='heart-animation-1'></div>
													<div class='heart-animation-2'></div>
											</span> Like
											</a>

										</div>
											   </c:otherwise>
											</c:choose>
			</sec:authorize>
				
			</div>
		</div>
	</div>
</div>

<div class="tabs_section_container">
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="tabs_container">
					<ul
						class="tabs d-flex flex-sm-row flex-column align-items-left align-items-md-center justify-content-center">
						<!-- <li class="tab active" data-active-tab="tab_1"><span>related Products</span></li> -->
						<li class="tab" data-active-tab="tab_3"><span>Reviews
								(2)</span></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">


				<div id="tab_3" class="tab_container">
					<div class="row">

						<div class="col-lg-6 reviews_col">
							<div class="tab_title reviews_title active">
								<h4>Reviews (2)</h4>
							</div>
							<div class="review_active">
							
							
							</div>
					<!-- 	<div class="user_review_container d-flex flex-column flex-sm-row active" >
								<div class="user">
									<div class="user_pic"></div>

								</div>
								<div class="review">
									<div class="review_date">27 Aug 2016</div>
									<div class="user_name">Brandon William</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua.</p>
								</div>
							</div> -->
							<div class="panel-footer"></div>
						</div>

						<div class="col-lg-6 add_review_col">
							<div class="add_review">
								<form id="review_form" action="post">
									<div>
										<textarea id="review_message" class="input_review"
											name="message" placeholder="리뷰" rows="4" required
											data-error="Please, leave us a review."></textarea>
									</div>
								</form>
									<div class="text-left text-sm-right">
										<sec:authorize access="isAuthenticated()">
											<button id="modalRegisterBtn" class="red_button review_submit_btn trans_300" data-username="${principal.username}"
												value="Submit" style="margin-top: 15px;">등록</button>
										</sec:authorize>
										<sec:authorize access="isAnonymous()">
											<button id="review_login" class="red_button review_submit_btn trans_300" value="Submit"
											style="margin-top: 15px;">등록</button>
										</sec:authorize>
										
									</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
		                <label>Reply</label> 
		                <input class="form-control" name='reply' value='New Reply!!!!'>
					</div>      
					<div class="form-group">
						<label>Replyer</label> 
						<input class="form-control" name='replyer' value='replyer' readonly="readonly">
					</div>
					<div class="form-group">
						<label>Reply Date</label> 
						<input class="form-control" name='regDate' value='2018-01-01 13:13'>
					</div>
				</div>
				
				<div class="modal-footer">
					<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
					<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
					<button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
					<button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
        <!-- /.modal-dialog -->
	</div>
	<!-- /댓글 modal -->


<%@include file="../include/front_footer.jsp"%>
 <script src="/resources/js/active.js"></script>
  <script src="/resources/js/reply.js"></script>


<script type="text/javascript">
$(document).ready(function () {

	var pdidValue = '<c:out value="${pro.pdid}"/>';
	console.log(pdidValue);
	   
	var replyUL = $(".review_active");

	showList(1);
	
	
	function showList(page){
		
		// console.log("show list " + page);
	    
		replyService.getList({pdid:pdidValue, page: page|| 1 }, function(replyCnt, list) {
	      
		    // console.log("replyCnt: "+ replyCnt );
		    // console.log("list: " + list);
		    // console.log(list);
	    	
			if(page == -1){
				pageNum = Math.ceil(replyCnt/10.0);
				showList(pageNum);
				return;
			}
 			
			var str="";
	     
			if(list == null || list.length == 0){
				replyUL.html("");
				return;
			}
	   
			for (var i = 0, len = list.length || 0; i < len; i++) {
				str +="<div class='user_review_container d-flex flex-column flex-sm-row active r_li' data-rno='"+list[i].rno+"'>";
				str +="<div class='user'>";
				str +="<div class='user_pic'></div>";
				str +="</div>";
				str +="<div class='review'>";
				str +="<div class='review_date'>"+replyService.displayTime(list[i].regDate)+"</div>";
				str +="<div class='user_name'>"+list[i].replyer+"</div>";
				str +="<p>"+list[i].reply+"</p>";
				str +="</div>";
				str +="</div>";
	
			/* 	str +="  <div><div class='header'><strong class='primary-font'>["
					+ list[i].rno+"] "+list[i].replyer+"</strong>"; 
				str +="    <small class='pull-right text-muted'>"
					+ replyService.displayTime(list[i].replyDate)+"</small></div>";
				str +="    <p>"+list[i].reply+"</p></div></li>"; */
			}
    
			replyUL.html(str);
	     
			showReplyPage(replyCnt);

	 
		});//end function
	     
	}//end showList

	var pageNum = 1;  
    var replyPageFooter = $(".panel-footer"); 
    function showReplyPage(replyCnt){
      
      var endNum = Math.ceil(pageNum / 10.0) * 10;  
      var startNum = endNum - 9;  
      
      var prev = startNum != 1; 
      var next = false; 

  
      if(endNum * 10 >= replyCnt){
        endNum = Math.ceil(replyCnt/10.0);
      }
      
      if(endNum * 10 < replyCnt){
        next = true;
      }
      
      var str = "<ul class='pagination pull-right2'>";
      
      if(prev){
        str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
      }
      
      for(var i = startNum ; i <= endNum; i++){
        
        var active = pageNum == i? "active":"";
        
        str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
      }
      
      if(next){
        str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
      }
      
      str += "</ul></div>";
      
      console.log(str);
      
      replyPageFooter.html(str);
    }
     
    replyPageFooter.on("click","li a", function(e){
       e.preventDefault();
       console.log("page click");
       
       var targetPageNum = $(this).attr("href");
       
       console.log("targetPageNum: " + targetPageNum);
       
       pageNum = targetPageNum;
       
       showList(pageNum);
     });
 	
    

	var modal = $(".modal");
    var modalInputReply = modal.find("input[name='reply']");
    var modalInputReplyer = modal.find("input[name='replyer']");
    var modalInputregDate = modal.find("input[name='regDate']");
    var modalModBtn = $("#modalModBtn");
    var modalRemoveBtn = $("#modalRemoveBtn");
    var modalRegisterBtn = $("#modalRegisterBtn");


	var replyer = null;


    <sec:authorize access="isAuthenticated()">
    	var replyer = '<sec:authentication property="principal.username"/>';   
    	 
	</sec:authorize>


	const csrfHeaderName ="${_csrf.headerName}"; 
	const csrfTokenValue="${_csrf.token}";
    
    $("#modalCloseBtn").on("click", function(e){
    	modal.modal('hide');
    });
    
/*     $("#addReplyBtn").on("click", function(e){
		modal.find("input").val("");
		modal.find("input[name='replyer']").val(replyer);
		modalInputregDate.closest("div").hide();
		modal.find("button[id !='modalCloseBtn']").hide();
		
		modalRegisterBtn.show();
		$(".modal").modal("show");
    }); */


    $(document).ajaxSend(function(e, xhr, options) { 
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
	});
	

	modalRegisterBtn.on("click",function(e){
		var pdidValue = '<c:out value="${pro.pdid}"/>';
		var userid = $(this).attr('data-username');
		var reply = {
			reply:  $("#review_message").val(), 
            replyer:userid,
            r_pdid:pdidValue 
		};

		replyService.add(reply, function(result){
        
        alert(result);
        
        modal.find("input").val("");
        modal.modal("hide");
        
        showList(1);
      });
      
    });
    

    $(".review_active").on("click", ".r_li", function(e){
      
		var rno = $(this).data("rno");
		console.log(rno);
		
		replyService.get(rno, function(reply){

			modalInputReply.val(reply.reply);
			modalInputReplyer.val(reply.replyer);
			modalInputregDate.val(replyService.displayTime(reply.regDate)).attr("readonly","readonly");
			modal.data("rno", reply.rno);
			
			modal.find("button[id !='modalCloseBtn']").hide();
			modalModBtn.show();
			modalRemoveBtn.show();
			
			$(".modal").modal("show");
		});
	});
	

	modalModBtn.on("click", function(e){
		
		var originalReplyer = modalInputReplyer.val();
		
		var reply = {
				rno:modal.data("rno"), 
				reply: modalInputReply.val(),
				replyer: originalReplyer
				};

		if(!replyer){
			alert("로그인후 수정이 가능합니다.");
			modal.modal("hide");
			return;
		}

		console.log("Original Replyer: " + originalReplyer);

		if(replyer  != originalReplyer){
			alert("자신이 작성한 댓글만 수정이 가능합니다.");
			modal.modal("hide");
			return;
		}
		  
		replyService.update(reply, function(result){
			alert(result);
			modal.modal("hide");
			showList(pageNum);
		});
	});


	modalRemoveBtn.on("click", function (e){
	  	  
		var rno = modal.data("rno");

		console.log("RNO: " + rno);
		console.log("REPLYER: " + replyer);

		if(!replyer){
			alert("로그인후 삭제가 가능합니다.");
			modal.modal("hide");
			return;
		}
	   	  
		var originalReplyer = modalInputReplyer.val();
	   	  
		console.log("Original Replyer: " + originalReplyer);
		if(replyer !== originalReplyer){
	   		  
			alert("자신이 작성한 댓글만 삭제가 가능합니다.");
			modal.modal("hide");
			return;
		}
	   	  
		replyService.remove(rno, originalReplyer, function(result){
	   	        
			alert(result);
			modal.modal("hide");
			showList(pageNum);
		});
	});
	
	
});

</script>



  <script>

 	    $(document).ready(function() {

			$("#basket_go").on("click", function() {

				var header = $("meta[name='_csrf_header']").attr('content');
	        	var token = $("meta[name='_csrf']").attr('content');
				
				var pdid = "<c:out value="${pro.pdid}" />";
				console.log(pdid);
				var value = $('#quantity_value');
				var bk_cnt = parseInt(value.text());
				console.log(bk_cnt);
				var userid = $(this).attr('data-username');
				console.log(userid);

			 	$.ajax({
        			url : '/front/basket_input',
        			type:  "POST",
        			data:{
        				pdid : pdid,
 						bk_cnt : bk_cnt,
 						userid : userid
        			}, 
 					dataType : 'json', 
/* 	        	 	contentType: 'application/json', */
        			beforeSend: function(xhr){
                	 	        xhr.setRequestHeader(header, token);
                	},
        			success : function(data){

						if(data == 2){						
							console.log(data);
        				 	if (confirm("장바구니에 담겼습니다. 장바구니 페이지로 이동하시겠습니가?") == true) {
	   		    	          	self.location = "/front/basket?userid="+userid;
		   		              	} else {
		   		                  return;
		   		              	}
		   		              	
						}else{
							console.log(data);
							alert("이미 장바구니에 들어간 상품 입니다.");
							return;
						}
        			},error : function(){
        					console.log("실패");

        			}

        		}); 
				
			});

			$("#plz_login").on("click", function() {

				alert("로그인을 해주세요");
 
				
			});

 	    });	

		

			$('.like-button').on('click', function(e) {

				var header = $("meta[name='_csrf_header']").attr('content');
	        	var token = $("meta[name='_csrf']").attr('content');


				var data_pdid = $(this).attr('data-pdid');
				var data_id = $(this).attr('data-id');
				console.log(data_pdid);
				console.log(data_id);
				$(this).toggleClass('liked');


							$.ajax({
									url:'/front/checkList',
									type : "POST",
									 data: { 
										 pdid : data_pdid, 
					        	 		 userid :  data_id 
					        	 		 
					        	 	   },
					        	 	  dataType : 'json',  
					        	 	  beforeSend: function(xhr){
					        	 	        xhr.setRequestHeader(header, token);
					        	 	    },
								    success : function(data){
								    	 console.log(data);
								    	 if(data == 2){
												alert("관심상품에 등록되었습니다.");
							                 }else{
												alert("관심상품이 해제되었습니다.");
												
							                 }
											
									 },
									  error : function() {
												console.log("실패");
										  }

								});	   

			});

			//좋아요 해제
			$('.like-button liked').on('click', function(e) {
				  var header = $("meta[name='_csrf_header']").attr('content');
				  var token = $("meta[name='_csrf']").attr('content');


				var data_pdid = $(this).attr('data-pdid');
				var data_id = $(this).attr('data-id');
				console.log(data_pdid);
				console.log(data_id);
				$(this).toggleClass('liked');
				  $.ajax({
						url:'/front/checkList',
						type : "POST",
						 data: { 
							 pdid : data_pdid, 
		        	 		 userid :  data_id 
		        	 		 
		        	 	 }, 
		        	  dataType : 'json', 
				 	  beforeSend: function(xhr){
				 	        xhr.setRequestHeader(header, token);
				 	    },
					    success : function(data){
					    	 console.log(data);
							 if(data == 2){
								alert("관심상품에 등록되었습니다.");
			                 }else{
								alert("관심상품이 해제되었습니다.");
			                 }
							
								
						 },
						  error : function() {
									console.log("실패");
							  }

					});	  	 
				
			});

			$('#review_submit').on('click', function(e) {

				var header = $("meta[name='_csrf_header']").attr('content');
	        	var token = $("meta[name='_csrf']").attr('content');
				
				var replyer = $(this).attr('data-username');
				var r_pdid = "<c:out value="${pro.pdid}" />";
				var reply = $('#review_message').val();

				console.log(replyer);
				console.log(r_pdid);
				console.log(reply);

				  $.ajax({
						url:'/front/checkList',
						type : "POST",
						 data: { 
							 pdid : data_pdid, 
		        	 		 userid :  data_id 
		        	 		 
		        	 	 },  
				 	  beforeSend: function(xhr){
				 	        xhr.setRequestHeader(header, token);
				 	    },
					    success : function(data){
					    	 console.log(data);
							 if(data == 2){
								alert("관심상품에 등록되었습니다.");
			                 }else{
								alert("관심상품이 해제되었습니다.");
			                 }
							
								
						 },
						  error : function() {
									console.log("실패");
							  }

					});	  	 
				
				
			});

			$('#review_login').on('click', function(e) {

				alert("로그인을 해주세요");
			});
</script>