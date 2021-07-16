<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 <%@include file="../include/front_setting.jsp"%>
 <%@include file="../include/front_header.jsp"%>
  <link rel="stylesheet" href="/resources/css/basket.css">
  <meta name="_csrf_header" content="${_csrf.headerName}">
  <meta name="_csrf" content="${_csrf.token}">


<section class="pt-5 pb-5" style="margin-top: 180px;">
	  <div class="container">
	    <div class="row w-100">
	        <div class="col-lg-12 col-md-12 col-12">
	            <h3 class="display-5 mb-2 text-center">관심상품</h3>
	            <p class="mb-5 text-center">
	                <i class="text-info font-weight-bold"><c:out value="${count}"/></i> 개의 상품이 관심목록에 있습니다.</p>
	            <table id="shoppingCart" class="table table-condensed table-responsive">
	                <thead>
	                    <tr>
	                    	<th style="width:13%"><input type="checkbox" class="check_style" name="reportChkBx" id="check_all"></th>
	                        <th style="width:60%">상품</th>
	                        <th style="width:12%">가격</th>
	                        <th style="width:10%">조회수</th>
	                        <th style="width:16%">#</th>
	                    </tr>
	                </thead>
	                <tbody class="basket_body">
	                <c:forEach items="${wish}" var="wish" >
	                    <tr>
		                    <td>
		                    <input type='checkbox' id='check'class='check_style check' name='chk' value="${wish.wish_idx},${wish.pdid}">
		                    </td>
	                        <td data-th="Product">
	                            <div class="row">
	                                <div class="col-md-3 text-left">
	                                   <c:if test="${not empty wish.product.main_img}">
                                         <img src="/resources/upload/${wish.product.main_img}" class="img-fluid d-none d-md-block rounded mb-2 shadow " width="250" height="250">
                                       </c:if>
                                       <c:if test="${empty wish.product.main_img}">
                                         <img src="/resources/img/noimage.png" alt="" class="img-fluid d-none d-md-block rounded mb-2 shadow " width="250" height="250">
                                       </c:if>
	                                    
	                                </div>
	                                <div class="col-md-9 text-left mt-sm-2">
	                                    <h4><c:out value="${wish.product.pdname}"/></h4>
	                                    <p class="font-weight-light"><c:out value="${wish.category.caname}"/></p>
	                                </div>
	                            </div>
	                        </td>
								<td data-th="Price" style="padding-top: 50px; font-size: 20px;"><c:out
										value="${wish.product.pdprice}" /></td>
								<td data-th="Hit" style="padding-top: 50px; font-size: 20px;"><c:out
										value="${wish.product.pdhit}" /></td>
	                        <td class="actions" data-th="">
	                            <div class="text-right">
	                            
	                            	<c:set var="flag" value="false" />
										<c:forEach items="${list}" var="list">
											<c:if test="${list.userid == principal.username && list.pdid == wish.pdid}">
										   		<c:set var="flag" value="true" />
											</c:if>
										</c:forEach>	
										
										<c:choose>
											   <c:when test="${flag}">
											     	<div class='like-wrapper'>									
											<a class='like-button liked' id="wish_delete"
											data-pdid="<c:out value="${wish.pdid}" />"
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
											data-pdid="<c:out value="${wish.pdid}" />"
											data-id="${principal.username}"
											> <span class='like-icon'>
													<div class='heart-animation-1'></div>
													<div class='heart-animation-2'></div>
											</span> Like
											</a>

										</div>
											   </c:otherwise>
											</c:choose>
	                            
	                            
	                            </div>
	                        </td>
	                    </tr>
					</c:forEach> 

	                </tbody>
	            </table>
	        </div>
	    </div>
	    <div class="row mt-4 d-flex align-items-center">
	        <div class="col-sm-6 order-md-2 text-right">
	        	<button class="btn btn-danger mb-4 btn-lg pl-5 pr-5" id="check_delete">체크삭제</button>
	        	<button class="btn btn-primary mb-4 btn-lg pl-5 pr-5" id="basket_go_btn">장바구니보내기</button>
	        </div>
	        <div class="col-sm-6 mb-3 mb-m-1 order-md-1 text-md-left">
	            <a href="catalog.html">
	                <i class="fas fa-arrow-left mr-2"></i>쇼핑하러 가기</a>
	        </div>

	    </div>
	</div>
</section>






<%@include file="../include/front_footer.jsp"%>
 <!-- Popper JS -->
<script>

$("#check_all").click(function(){
    //클릭되었으면
    if($("#check_all").prop("checked")){
        //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
        $("input[name=chk]").prop("checked",true);
        //클릭이 안되있으면
    }else{
        //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
        $("input[name=chk]").prop("checked",false);
    }
})


$(document).ready(function() {

 

});




//주문하기 체크한 것만
$('#basket_go_btn').on('click', function(){


	 var header = $("meta[name='_csrf_header']").attr('content');
	 var token = $("meta[name='_csrf']").attr('content');
	 var userid = "${principal.username}";
	 var cnt = $("input[name='chk']:checked").length;

	 var params = {};

	 var i = 0;

	 
	 if(cnt == 0){
			alert("체크 항목이 없습니다.");
		 }else{

			  if (confirm("장바구니에 넣으시겠습니까?") == true) {
						for(i =0 ; i< cnt; i++){
							 
							var sp1 = $("input[name='chk']:checked")[i].value;
							var sp2 = sp1.split(",");

							params['check_list['+i+'].userid'] = userid;
							params['check_list['+i+'].pdid'] = sp2[1];
							params['check_list['+i+'].bk_cnt'] = 1;
							
						}
						console.log(params);
						$.ajax({
							url : '/front/wish/wish_to_basket',
							type:  "POST",
							data:  params,
							dataType : 'json',  
							beforeSend: function(xhr){
					    	 	        xhr.setRequestHeader(header, token);
					    	},
							success : function(data){

									if(data == "성공"){
										console.log("들어간 값 : "+params);
										console.log("data : "+data);
										alert("전체 상품이 장바구니로 등록되었습니다.");
										if (confirm("장바구니로 이동하시겠습니까?") == true) {
										window.location.href = "/front/basket?userid="+userid;
										}else{
											return;
										}
									}else if(data == "중복제외"){
										console.log("들어간 값 : "+params);
										console.log("data : "+data);
										alert("이미 등록된 상품 제외 장바구니로 등록되었습니다.");
										if (confirm("장바구니로 이동하시겠습니까?") == true) {
										window.location.href = "/front/basket?userid="+userid;
										}else{
											return;
										}

									}else{
										console.log("들어간 값 : "+params);
										console.log("data : "+data);
										alert("이미 상품들이 등록되어있습니다.");
										window.location.href = "/front/basket?userid="+userid;
									}
							},error : function(){
									
									console.log("실패");
					
							}
					
						}); 

			 	}else{
					return;
				} 
		 }
		
});
 
 
// 체크박스 체크 한 항목만 삭제
 $('#check_delete').on('click',function(){

	 var header = $("meta[name='_csrf_header']").attr('content');
	 var token = $("meta[name='_csrf']").attr('content');
	 var userid = "${principal.username}";
	 var cnt = $("input[name='chk']:checked").length;
	 console.log(cnt);
	 var params = {};
	 
	 var i = 0;
	 
	 if(cnt == 0){
		alert("체크 항목이 없습니다.");
	 }else{

		 if (confirm("정말 삭제하시겠습니까?") == true) {
					for(i =0 ; i< cnt; i++){

					    var sp1 = $("input[name='chk']:checked")[i].value;
						var sp2 = sp1.split(",");
						
						params['check_list['+i+'].wish_idx'] = sp2[0];
		

						
						/* params['check_list['+i+'].wish_idx'] = $("input[name='chk']:checked")[i].value;
						console.log(params['check_list['+i+'].wish_idx'] = $("input[name='chk']:checked")[i].value); */
					}
					console.log(params);
			
			 	$.ajax({
						url : '/front/wish/wish_check_delete',
						type:  "POST",
						data:  params,
						beforeSend: function(xhr){
				    	 	        xhr.setRequestHeader(header, token);
				    	},
						success : function(){
			
								console.log("삭제된 값 : "+params);
								window.location.href = "/front/wish_list?userid="+userid;
								
						},error : function(){
								
								console.log("실패");
				
						}
				
					});  

		 	}else{
				return;
			}
		 }
 });


 $('.like-button').on('click', function(e) {

		var header = $("meta[name='_csrf_header']").attr('content');
 		var token = $("meta[name='_csrf']").attr('content');

 		var id = "${principal.username}";
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
										window.location.href = "/front/wish_list?userid="+id;
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

		var id = "${principal.username}";
		
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
						window.location.href = "/front/wish_list?userid="+id;
	                 }
					
						
				 },
				  error : function() {
							console.log("실패");
					  }

			});	  	 
		 

	});




</script>