<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 <%@include file="../include/front_setting.jsp"%>
 <link rel="stylesheet" href="/resources/css/category.css">
 <%@include file="../include/front_header.jsp"%>
   <meta name="_csrf_header" content="${_csrf.headerName}">
  <meta name="_csrf" content="${_csrf.token}">
 
 	
 	       <div class="container sign_up_section_container">
                <div class="row">
                   <div class="col product_section clearfix">
                        <div class="breadcrumbs d-flex flex-row align-items-center">
                            <ul>
                                <li>
                                    <a href="/front/index">Home</a>
                                </li>
                                <li>
                                    <a href="/front/category">
                                        <i class="fa fa-angle-right" aria-hidden="true">Category</i>
                                    </a>
                                </li>
                            </ul>


                        </div>
                        
                         <div class="sidebar">
                            <div class="sidebar_section">
                                <div class="sidebar_title">
                                    <h5>상품 카테고리</h5>
                                </div>
                                <ul class="sidebar_categories">
                                	<c:forEach items="${ca_list}" var="ca" >
                             		 	<li><a href="/front/category?cacode=<c:out value="${ca.cacode}" />"><c:out value="${ca.caname}" /></a></li>
                             		</c:forEach>
                                </ul>
                            </div>
                        </div>
                        <div class="main_content">
                        	
                        	     <div class="product_sorting_container product_sorting_container_top" style="margin-bottom: 30px;"> 
                                        <ul class="product_sorting">
                                            <li>
                                                <span class="type_sorting_text">Default Sorting</span>
                                                <i class="fa fa-angle-down"></i>
                                                <ul class="sorting_type">
                                                    <li class="type_sorting_btn" data-isotope-option='{ "sortBy": "original-order" }'><span>Default Sorting</span></li>
                                                    <li class="type_sorting_btn" data-isotope-option='{ "sortBy": "price" }'><span>Price</span></li>
                                                    <li class="type_sorting_btn" data-isotope-option='{ "sortBy": "name" }'><span>Product Name</span></li>
                                                </ul>
                                            </li>
                                        </ul>
    
                                    </div>
                        
                            <div class="products_iso">
                           
                            	
                                <div class="container">
                 
                                    <div class="row ca_row">
                                    
                                <%--     <c:forEach items="${list}" var="pro" >
                                      <div class="col-sm-3 list_start">
                                        <div class="product_item">
                                            <div class="product discount product_filter">
                                                <div class="product_image">
                                                <div class="pdid_scroll" data-pdid="<c:out value="${pro.pdid}" />" data-cacode="<c:out value="${pro.cacode}" />"></div>
                                                <c:if test="${null ne pro.main_img}">
                                                	<img src="/resources/upload/${pro.main_img}">
                                                </c:if>
                                                 <c:if test="${null eq pro.main_img}">
                                               	 <img src="/resources/img/noimage.png" alt="">
                                               	</c:if>
                                                </div>
                                                <div class="favorite favorite_left"></div>
                                               <!--  <div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center"><span>-$20</span></div> -->
                                                <div class="product_info">
                                                <h6 class="product_name"><a class="move" href="<c:out value="${pro.pdid}"/>"><c:out value="${pro.pdname}" /></a></h6>
                                                <div class="product_price"><c:out value="${pro.pdprice}" /><span><c:out value="${pro.pdprice + 300}" /></span></div>
                                                </div>
                                            </div>
                                            <div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>
                                        </div>
                                      </div>
 									</c:forEach> --%>
 									
 									
 									<c:forEach items="${list}" var="pro">
 									    <div class="col-sm-3 list_start">
	                                        <div class="product-item">
	                                            <div class="product discount product_filter">
	                                                <div class="product_image">
	                      								<div class="pdid_scroll" data-pdid="<c:out value="${pro.pdid}" />" data-cacode="<c:out value="${pro.cacode}" />"></div>
	                                                     <c:if test="${null ne pro.main_img}">
			                                                	<img src="/resources/upload/${pro.main_img}">
			                                                </c:if>
			                                                 <c:if test="${null eq pro.main_img}">
			                                               	 <img src="/resources/img/noimage.png" alt="">
			                                             </c:if>
	                                                    
	                                                </div>
	                                           
	                                                <div class="product_info">
	                                                    <h6 class="product_name"><a class="move" href="<c:out value="${pro.pdid}"/>"><c:out value="${pro.pdname}" /></a></h6>
	                                                     <div class="product_price"><c:out value="${pro.pdprice}" /></div>
	                                                </div>
	                                            </div>
	                                            <div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>
	                                        </div>
	                                       </div>
	                                     </c:forEach>
                          
                                    </div>
                                    
                                  </div>
                                        

                                    </div>

                                    

                                </div>
                                
                                <form id='actionForm' action="/front/category" method='get'>

								</form>
                                
                            </div>
                        </div>

                   </div>
 
 
  <%@include file="../include/front_footer.jsp"%>
  <script>


	 $(document).ready(function() {

			 var actionForm = $("#actionForm");

			$(".move").on("click",function(e) {
				e.preventDefault();
				actionForm.append("<input type='hidden' name='pdid' value='" + $(this).attr("href")	+ "'>");
				actionForm.attr("action", "/front/product_info"); 
				/* actionForm.attr("action", "/front/product_info2"); */
				actionForm.submit();
			});

	 });

	var lastScrollTop = 0;

	 $(window).scroll(function(){

		var header = $("meta[name='_csrf_header']").attr('content');
		var token = $("meta[name='_csrf']").attr('content');

		
		var currentScrollTop = $(window).scrollTop();
		
		
        if(currentScrollTop - lastScrollTop > 0 ){

			if($(window).scrollTop() >= ($(document).height() - $(window).height()) ){
                
                var lastPdid = $(".pdid_scroll:last").attr("data-pdid");
				var cacode = $(".pdid_scroll").attr("data-cacode");
				console.log(lastPdid);
				console.log(cacode);
                 $.ajax({
                    type: "POST",
                    url: "/front/infiniteScrollDown",
                    dataType: 'json',
					data :  // 서버로 보낼 데이터 명시 
						{pdid : lastPdid,
						cacode : cacode}
					,beforeSend: function(xhr){
				        xhr.setRequestHeader(header, token);
					},
                    success : function(data){
                        
                        var str = "";
						
                        if(data != ""){
                        	 //$(".col-sm-3").empty();// 셀렉터 태그 안의 모든 텍스트를 지운다.
                            $(data).each(
                                function(index){
                    				console.log(this);
                                    str += "<div class="+"'col-sm-3 list_start'"+">";
                                    str	+= "<div class="+"'product-item'"+">";
									str	+= "<div class="+"'product discount product_filter'"+">";
									str	+= "<div class="+"'product_image'"+">";
									str	+= "<div class="+"'pdid_scroll'"+"data-pdid='"+this.pdid+"'data-cacode='"+this.cacode+"'>"+"</div>";
									if(this.main_img != null){
									str += "<img src="+"'/resources/upload/'"+this.main_img+"/>"
									}else{
									str += "<img src="+"'/resources/img/noimage.png'"+"alt="+"''" +"/>";
									}
									str += "</div>";
									str += "<div class="+"'product_info'"+">";
									/* str += "<h6 class="+"'product_name'"+">"+"<a class="+"'move'"+"href="+this.pdid+">"+this.pdname+"</a></h6>"; */
									str += "<h6 class="+"'product_name'"+">"+"<a href="+"/front/product_info?pdid="+this.pdid+">"+this.pdname+"</a></h6>";
									str += "<div class="+"'product_price'"+">"+this.pdprice+"</div>";
									str += "</div>";
									str += "</div>";
									str += "<div class="+"'red_button add_to_cart_button'"+">"+"<a href="+"'#'"+">"+"add to cart"+"</a></div>";
									str += "</div>";
									str += "</div>";
                 

                            });
                          // $(".ca_row").empty();// 셀렉터 태그 안의 모든 텍스트를 지운다.
                           //$(".ca_row").after(str);						
							//$(".ca_row2").after(str);
							//$(".row ca_row2").after(str);
                           $(".ca_row").append(str);
                        }else{
							alert("상품이 없습니다.");
                        }
                       

                    }
					


                }); 
				var position = $(".col-sm-3 list_start:first").offset();// 위치 값
				//var position = $(".col-sm-3:first").offset();// 위치 값
				// 이동  위로 부터 position.top px 위치로 스크롤 하는 것이다. 그걸 500ms 동안 애니메이션이 이루어짐.
				//$('html,body').stop().animate({scrollTop : position.top }, 600, 'easeInQuint');
	
            }
        	
        	lastScrollTop = currentScrollTop;

        }else {
			
        	//lastScrollTop = currentScrollTop;
        }


    }); 


  </script>