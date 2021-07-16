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
	            <h3 class="display-5 mb-2 text-center">장바구니</h3>
	            <p class="mb-5 text-center">
	                <i class="text-info font-weight-bold"><c:out value="${count}"/></i> 개의 상품이 장바구니에 있습니다.</p>
	            <table id="shoppingCart" class="table table-condensed table-responsive">
	                <thead>
	                    <tr>
	                    	<th style="width:13%"><input type="checkbox" class="check_style" name="reportChkBx" id="check_all"></th>
	                        <th style="width:60%">상품</th>
	                        <th style="width:12%">가격</th>
	                        <th style="width:10%">갯수</th>
	                        <th style="width:16%"></th>
	                    </tr>
	                </thead>
	                <tbody class="basket_body">
<%-- 	                 <c:forEach items="${basket}" var="basket" >
	                    <tr>
	                        <td data-th="Product">
	                            <div class="row">
	                                <div class="col-md-3 text-left">
	                                   <c:if test="${not empty basket.product.main_img}">
                                         <img src="/resources/upload/${basket.product.main_img}" class="img-fluid d-none d-md-block rounded mb-2 shadow " width="250" height="250">
                                       </c:if>
                                       <c:if test="${empty basket.product.main_img}">
                                         <img src="/resources/img/noimage.png" alt="" class="img-fluid d-none d-md-block rounded mb-2 shadow " width="250" height="250">
                                       </c:if>
	                                    
	                                </div>
	                                <div class="col-md-9 text-left mt-sm-2">
	                                    <h4><c:out value="${basket.product.pdname}"/></h4>
	                                    <p class="font-weight-light"><c:out value="${basket.category.caname}"/></p>
	                                </div>
	                            </div>
	                        </td>
	                        <td data-th="Price"><c:out value="${basket.product.pdprice}"/></td>
	                        <td data-th="Quantity">
	                            <input type="number" class="form-control form-control-lg text-center" value="1">
	                        </td>
	                        <td class="actions" data-th="">
	                            <div class="text-right">
	                                <button class="btn btn-white border-secondary bg-white btn-md mb-2">
	                                    <i class="fas fa-sync"></i>
	                                </button>
	                                <button class="btn btn-white border-secondary bg-white btn-md mb-2">
	                                    <i class="fas fa-trash"></i>
	                                </button>
	                            </div>
	                        </td>
	                    </tr>
					</c:forEach> --%>
	                </tbody>
	            </table>
	            <div class="float-right text-right">
	            
	                <div class="show_price">총합 : </div>
	                <div class="basket_price"></div>
	                <h1></h1>
	            </div>
	        </div>
	    </div>
	    <div class="row mt-4 d-flex align-items-center">
	        <div class="col-sm-6 order-md-2 text-right">
	        	<button class="btn btn-danger mb-4 btn-lg pl-5 pr-5" id="check_delete">체크삭제</button>
	        	<button class="btn btn-primary mb-4 btn-lg pl-5 pr-5" id="order_btn">주문하기</button>
	        	<!-- <button class="btn btn-primary mb-4 btn-lg pl-5 pr-5" id="test_btn">테스트</button> -->
	        </div>
	        <div class="col-sm-6 mb-3 mb-m-1 order-md-1 text-md-left">
	            <a href="catalog.html">
	                <i class="fas fa-arrow-left mr-2"></i>쇼핑하러 가기</a>
	        </div>

	    </div>
	    
	    <form action="/front/order_info?userid=${principal.username}" method="post" role="form" id="order-data" name="order-data">
	    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	    </form>
	    
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

  get_basket_list();

});


function get_basket_list(){
	var userid = "${principal.username}";
	console.log(userid);

	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');


    $.ajax({
        type: "POST",
        url: "/front/basket_ajax",
        dataType: 'json',
		data : {  // 서버로 보낼 데이터 명시 
			userid : userid
			}
		,beforeSend: function(xhr){
	        xhr.setRequestHeader(header, token);
		},
        success : function(data){
            
            var str = "";
            var sum = 0;
            if(data != ""){
                $(data).each(
                    function(i){
                   
        				console.log(this);
                        str += "<tr id='tr"+i+"'>";
                        str += "<td>"+"<input type="+"'checkbox'"+"id='check"+i+"'class="+"'check_style check'"+"name="+"'chk'"+"value="+this.bk_idx+','+this.product.pdid+','+this.product.pdprice+"></td>";
                        str	+= "<td data-th="+"'Product'"+">";
						str	+= "<div class="+"'row'"+">";
						str	+= "<div class="+"'col-md-3 text-left'"+">";
						if(this.product.main_img != null){
						str += "<img src="+"'/resources/upload/"+this.product.main_img+"'class="+"'img-fluid d-none d-md-block rounded mb-2 shadow'"+"width="+"'250'"+"height="+"'250'" +"/>";
						}else{
						str += "<img src="+"'/resources/img/noimage.png'"+"alt="+"''"+"class="+"'img-fluid d-none d-md-block rounded mb-2 shadow'"+"width="+"'250'"+"height="+"'250'" +"/>";
						}
						str += "</div>";
						str += "<div class="+"'col-md-9 text-left mt-sm-2'"+">";
						str += "<h4>"+this.product.pdname+"</h4>";
						str += "<p class="+"'font-weight-light'"+">"+this.category.caname+"</p>";
						str += "</div>";
						str += "</div>";
						str += "</td>";
						/* str += "<td data-th="+"'Price'"+">"+"<div class="+"'pd_price'"+"id='pd_price"+i+"'>"+"</div></td>"; */
						str += "<td data-th="+"'Price'"+">"+"<div class="+"'pd_price'"+"id='pd_price"+i+"'>"+this.product.pdprice*this.bk_cnt+"</div></td>";
						str += "<td data-th="+"'Quantity'"+">";

						str += "<div class="+"'quantity_selector'"+">";
						str += "<span class="+"'minus'"+"id='minus_"+i+"' onclick="+"'minus("+i+");'"+">"+"<i class="+"'fa fa-minus'"+"aria-hidden="+"'true'"+"></i>";
						str += "<input type='hidden' id='minus_hidden"+i+"'value="+this.product.pdprice+">";
						str += "</span>"
						str += "<span class='quantity_value"+i+" quan_val' id='quan_val'>"+this.bk_cnt+"</span>";
						str += "<span class="+"'plus'"+"id='plus_"+i+"' onclick="+"'plus("+i+");'"+">"+"<i class="+"'fa fa-plus'"+"aria-hidden="+"'true'"+"></i>";
						str += "<input type='hidden' id='plus_hidden"+i+"'value="+this.product.pdprice+">";
						str += "</span>";
						str += "</div>"; 
						/* str += "<input type="+"'number'"+"class="+"'form-control form-control-lg text-center'"+"id="+"'cnt_change'"+"value="+this.bk_cnt+">";  */

						str += "</td>";
						str += "<td class="+"'actions'"+"data-th="+"''"+">";
						str += "<div class="+"'text-right'"+">";
						str += "<button class="+"'btn btn-white border-secondary bg-white btn-md mb-2'"+"name="+"'bk_delete_btn'"+"onclick="+"'bk_delete_btn("+i+");'"+">";
						str += "<input type='hidden' id='bk_idx_hidden"+i+"'value="+this.bk_idx+">";
						str += "<i class="+"'fas fa-trash'"+">"+"</i>";
						str += "</button>";
						str += "</div";
						str += "</td";
					/* 	str += "<input type="+"'hidden'"+"id="+"'price_hidden"+i+"'value='"+this.product.pdprice+"'>"
						str += "<input type='hidden' id='price_hidden"+i+"'value="+this.product.pdprice+">"; */
						str += "</tr>";


						var total = this.product.pdprice*this.bk_cnt;
						sum = total + sum;
						console.log("sum: "+ sum);
						
					   
                });

               
        
               $(".basket_body").append(str);
               var show = $('.basket_price');
               show.text(sum);
            }
           

        }
		


    }); 

} 




function bk_delete_btn(index){

	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');
	
	var hidden = $('#bk_idx_hidden'+index).val();
	var userid = "${principal.username}";
	console.log(hidden);

	if (confirm("정말 삭제하시겠습니까?") == true) {

		$.ajax({
			url : '/front/basket/basket_delete',
			type:  "POST",
			data:  {
					bk_idx : hidden
			},
			beforeSend: function(xhr){
	    	 	        xhr.setRequestHeader(header, token);
	    	},
			success : function(){
				
					console.log("삭제된 값 : "+hidden);
					//window.location.href = "/front/basket?userid="+userid;
				
					$(".basket_body").empty();
					get_basket_list();
					
			},error : function(){
					console.log(hidden);
					console.log("실패");
	
			}
	
		});  
      	
	} else {

	     return;
	}
		
		
	
}


 
 function minus(index){

	
	 var price = $('#pd_price'+index);

	 var hidden = $('#minus_hidden'+index).val();

	 var p = parseInt(price.text());
	 var value = $('.quantity_value'+index);

	 var z = parseInt(value.text()); // 개수

	 var show = $('.basket_price'); //총 합 
	 var s = parseInt(show.text());

	 if(z <= 1){
		z = 1;
	 }else{
		z = z - 1;
		value.text(z);
		console.log("z 값 : " + z);
		
		p = hidden * z;
		console.log("곲한 p: " +p);
		price.text(p);

		s = s - hidden;
		show.text(s);
	 }

	 
 }
 



 function plus(index){

 	//console.log(index); // 인덱스 값 

	var plus_index = index;
	console.log(plus_index); 
	
	var price = $('#pd_price'+index);

	var hidden = $('#plus_hidden'+index).val();

	var h = parseInt(hidden);
	
	console.log("히든 값 : "+hidden);

	 var show = $('.basket_price'); //총 합 
	 var s = parseInt(show.text());


	
	var p = parseInt(price.text()); // 단가
	var value = $('.quantity_value'+index);
	
	var z = parseInt(value.text()); // 개수
	console.log("더하기 전 z 값 : " + z);
	z = z + 1;
	value.text(z);
	console.log("z 값 : " + z);
	
	p = hidden * z;
	console.log("곲한 p: " +p);
	price.text(p);

	s = s + h;
	console.log(s);
	show.text(s);

} 


/*  $('#test_btn').on('click', function(i){


	 var header = $("meta[name='_csrf_header']").attr('content');
	 var token = $("meta[name='_csrf']").attr('content');
	 var userid = "${principal.username}";
	 var cnt = $("input[name='chk']:checked").length;
	 
	 var cnt_params = $("input[name='chk']:checked").parents("tr");
	 var cnt_length = $("input[name='chk']:checked").parents("tr").length;

	 var img = cnt_params.find('img').attr("src");
	 var img_array = new Array();


	 var pdname = cnt_params.find('h4').text();
	 var caname = cnt_params.find('.font-weight-light').text();
		
	 var caname_array = new Array();
     var pdname_array = new Array();
     
		
	 for(var k=0; k < cnt_length; k++){
			
		 //img_array[k] =  $(cnt_params[k]).find('img').attr("src");
		pdname_array[k] = $(cnt_params[k]).find('h4').text();
		caname_array[k] = $(cnt_params[k]).find('.font-weight-light').text();
		 
	 }

	 console.log(pdname_array);
	 console.log(caname_array);
	 //console.log(img_array);
	 
	 var params = {};
	 
	 var i = 0;

 
		
}); */


//주문하기 체크한 것만
$('#order_btn').on('click', function(i){


	 var header = $("meta[name='_csrf_header']").attr('content');
	 var token = $("meta[name='_csrf']").attr('content');
	 var userid = "${principal.username}";
	 var cnt = $("input[name='chk']:checked").length;
	 
	 var cnt_params = $("input[name='chk']:checked").parents("tr");
	 var cnt_length = $("input[name='chk']:checked").parents("tr").length;

	 
	 console.log(cnt_params);

	 var array = new Array(); 
	 var img_array = new Array();
	 var caname_array = new Array();
     var pdname_array = new Array();

	 for(var k=0; k < cnt_length; k++){
		
		 array[k] =  parseInt($(cnt_params[k]).find('#quan_val').text());
		 img_array[k] =  $(cnt_params[k]).find('img').attr("src");
		 pdname_array[k] = $(cnt_params[k]).find('h4').text();
		 caname_array[k] = $(cnt_params[k]).find('.font-weight-light').text();
	 }

	 console.log(array);
	 console.log(img_array);

	 
	 var params = {};
	 
	 var i = 0;

  	 if(cnt == 0){
			alert("체크 항목이 없습니다.");
		 }else{
			
			  if (confirm("주문하시겠습니까?") == true) {
						for(i =0 ; i< cnt; i++){

							var sp1 = $("input[name='chk']:checked")[i].value;
							var sp2 = sp1.split(",");
								
							params['check_list['+i+'].pdid'] = sp2[1];
							params['check_list['+i+'].pdprice'] = sp2[2];
							params['check_list['+i+'].bk_cnt'] = array[i];
							params['check_list['+i+'].userid'] = userid;
							params['check_list['+i+'].img'] = img_array[i];
							params['check_list['+i+'].pdname'] = pdname_array[i];
							params['check_list['+i+'].caname'] = pdname_array[i];
						
						}
						console.log(params);

						var od_form = $("form[role='form']");
						var str = ""

						for(i =0; i< cnt; i++){
							str += "<input type='hidden' name='check_list["+i+"].pdid' value='"+params['check_list['+i+'].pdid']+"'>";
							str += "<input type='hidden' name='check_list["+i+"].pdprice' value='"+params['check_list['+i+'].pdprice']+"'>";
							str += "<input type='hidden' name='check_list["+i+"].bk_cnt' value='"+params['check_list['+i+'].bk_cnt']+"'>";
							str += "<input type='hidden' name='check_list["+i+"].userid' value='"+params['check_list['+i+'].userid']+"'>";
							str += "<input type='hidden' name='check_list["+i+"].img' value='"+params['check_list['+i+'].img']+"'>";
							str += "<input type='hidden' name='check_list["+i+"].pdname' value='"+params['check_list['+i+'].pdname']+"'>";
							str += "<input type='hidden' name='check_list["+i+"].caname' value='"+params['check_list['+i+'].caname']+"'>";
						}
						//str += "<input type='hidden' name='userid' value='"+userid+"'>";
						od_form.append(str);
					    od_form.submit();	

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
						/* params['check_list['+i+'].bk_idx'] = $("input[name='chk']:checked")[i].value;
						console.log(params['check_list['+i+'].bk_idx'] = $("input[name='chk']:checked")[i].value); */

					    var sp1 = $("input[name='chk']:checked")[i].value;
						var sp2 = sp1.split(",");
						
						params['check_list['+i+'].bk_idx'] = sp2[0];

						}
					console.log(params);
			
					$.ajax({
						url : '/front/basket/basket_check_delete',
						type:  "POST",
						data:  params,
						beforeSend: function(xhr){
				    	 	        xhr.setRequestHeader(header, token);
				    	},
						success : function(){
			
								console.log("삭제된 값 : "+params);
								$(".basket_body").empty();
								 get_basket_list();
								
						},error : function(){
				
								console.log("실패");
				
						}
				
					});  

		 	}else{
				return;
			}
		 }
 });





</script>