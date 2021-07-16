<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 <%@include file="../include/front_setting.jsp"%>
 <%@include file="../include/front_header.jsp"%>
  <link rel="stylesheet" href="/resources/css/basket.css">
  <link rel="stylesheet" href="/resources/css/order_info.css">
  <meta name="_csrf_header" content="${_csrf.headerName}">
  <meta name="_csrf" content="${_csrf.token}">



<section class="pt-5 pb-5" style="margin-top: 180px;">
	  <div class="container">
	    <div class="row w-100">
	        <div class="col-lg-12 col-md-12 col-12">
	            <h3 class="display-5 mb-2 text-center">주문</h3>
	            <p class="mb-5 text-center">
	                </p>
	            <table id="shoppingCart" class="table table-condensed table-responsive">
	                <thead>
	                    <tr>
	                        <th style="width:60%">상품</th>
	                        <th style="width:22%">가격</th>
	                        <th style="width:20%">갯수</th>
	                        <th style="width:20%">#</th>
	                    </tr>
	                </thead>
	                <tbody class="basket_body">
	                <c:set var="total_pay" value="0"/>
	                <c:set var="total_count" value="0"/>
	                <c:forEach items="${list}" var="od_info" >
	                          <tr class="basket_data_tr">
	                        <td data-th="Product">
	                            <div class="row">
	                                <div class="col-md-3 text-left">             
                                         <img src="${od_info.img}" class="img-fluid d-none d-md-block rounded mb-2 shadow " width="250" height="250">
	                                </div>
	                                <div class="col-md-9 text-left mt-sm-2">
	                                    <h4><c:out value="${od_info.pdname}"/></h4>
	                                    <p class="font-weight-light"><c:out value="${od_info.caname}"/></p>
	                                </div>
	                            </div>
	                        </td>
	                        <td data-th="Price">${od_info.pdprice * od_info.bk_cnt}</td>
	                        <td data-th="Quantity">
	                            <h4 id="quantity_num"><c:out value="${od_info.bk_cnt}"/></h4>
	                        </td>
							<td id="td_pdid"><c:out value="${od_info.pdid}"/></td>
	                    </tr>
	                     <c:set var="total_pay" value="${total_pay + (od_info.pdprice * od_info.bk_cnt)}"/>
	                     <c:set var="total_count" value="${total_count + od_info.bk_cnt}"/>
					</c:forEach> 

	                </tbody>
	            </table>
	        </div>
	    </div>

	</div>
</section> 

 <!-- 결제 영역 -->
            <div class="checkout_area section_padding_100">
                <div class="container">
                    <div class="row">
    
                        <div class="col-12 col-md-6">
                            <div class="checkout_details_area mt-50 clearfix">
    
                                <div class="cart-page-heading">
                                    <h5>주문자 정보</h5>
                                    <p></p>
                                </div>
    
                                <form action="/front/order_insert" method="POST" role="form" name="order_form">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <div class="row">
                                       	<div class="col-12 mb-3">
                                            <label for="company">아이디</label>
                                            <input type="text" class="form-control od_text" id="order_id" value="${principal.username}" name="order_id" readonly="readonly">
                                        </div>
                                       
                                        <div class="col-12 mb-3">
                                            <label for="name">성함<span>*</span></label>
                                            <input type="text" class="form-control od_text" id="order_name" name="order_name" value="${user.username}" required>
                                            <div class="check_font" id="order_name_check"></div>
                                        </div>
                                    
                                        
		                                   <div class="col-md-6 mb-3">
		                                        <label for="user_id">우편번호<span>*</span></label>
		                                        <input type="text" class="form-control form-control-user od_text" id="order_zipcode"
		                                            placeholder="우편번호" name="order_zip" >
		                           				<div class="check_font" id="order_zip_check"></div>
		                                    </div>
		                                    <div class="col-md-6 mb-3">
		                                        <label for="user_id">.</label>
		                                         <div>
		                                           <input type="button" class="btn btn-primary" onclick="openZipSearch();" value="검색">                      
		                                         </div>    
		                                         
		                                    </div>
										<div class="col-12 mb-3">
                                            <label for="street_address">상세주소<span>*</span></label>
                                            <input type="text" class="form-control mb-3 od_text" id="order_addr1" value="" name="order_addr1">
                                            <div class="check_font" id="order_addr1_check"></div>
                                            <input type="text" class="form-control od_text" id="order_addr2" value="" name="order_addr2">
                                            <div class="check_font" id="order_addr2_check"></div>
                                        </div>
                                                                                
                                        <div class="col-12 mb-3">
                                            <label for="city">자택번호 </label>
                                            <input type="text" class="form-control od_text" id="order_tel" value="" name="order_tel">
                                        </div>
                                        
                                        <div class="col-12 mb-3">
                                            <label for="city">휴대폰번호 <span>*</span></label>
                                            <input type="text" class="form-control od_text" id="order_phone" value="" name="order_phone">
                                            <div class="check_font" id="order_phone_check"></div>
                                        </div>
                                        
                                         <div class="col-12 mb-3">
                                            <label for="city">E-MAIL <span>*</span></label>
                                            <input type="text" class="form-control od_text" id="order_email"  value="${user.email }" name="order_email">
                                            <div class="check_font" id="order_email_check"></div>
                                        </div>
                                        
                                        <div class="col-md-6 mb-3">
                                            <label for="city">포인트<span></span></label>
                                           	<div id="user_point">${user.point }</div>
                                        </div>
                                        
                                        <div class="col-md-6 mb-3">
                                            <label for="city">.<span></span></label>
                                           	<input type="text" class="form-control od_text" id="use_point"  value="0">
                                           	<div class="point_btn_area">
                                           		<input class="btn btn-danger" id="free_point" value="사용" readonly="readonly">
                                           		<input class="btn btn-success" id="all_point" value="모두사용" readonly="readonly">
                                           	</div>
                         
                                        </div>
                                        
                                        
                                         <div class="col-12 mb-3">
                                            <label for="country">사용 가능한 쿠폰 <span>*</span></label>
                                            <select class="custom-select d-block w-100 od_text" id="coupon" name="coupon">
                                              <option value="0">선택해주세요.</option>
                                            
                                              <c:forEach items="${coupon_list}" var="coupon">
							      				<option value="${coupon.s_cp_idx}" value2="${coupon.c_coupon.c_cp_price}"><c:out value="${coupon.c_coupon.c_cp_name}" />
							      				</option>
							          		   </c:forEach>
                                        </select>
                                        </div>
                                        
                                         <div class="col-12 mb-3">
                                            <select class="custom-select d-block w-100 od_text" id="order_message" name="order_message">
                                            <option value="메시지없음">배송시 요청사항 (선택사항)</option>
                                            <option value="배송전 ,연락바랍니다.">배송전 ,연락바랍니다.</option>
                                            <option value="부재시, 전화 또는 문자 주세요">부재시, 전화 또는 문자 주세요.</option>
                                            <option value="부재시, 경배실에 맡겨주세요.">부재시, 경배실에 맡겨주세요.</option>
                                        </select>
                                        </div>
    

                                    </div>
                                </form>
                            </div>
                        </div>
    
                        <div class="col-12 col-md-6 col-lg-5 ml-lg-auto">
                            <div class="order-details-confirmation">
    
                                <div class="cart-page-heading">
                                    <h5>Your Order</h5>
                                    <p>상세</p>
                                </div>
    
                                <ul class="order-details-form mb-4">
                                    <li><span>상품 갯수</span><span id="total_count">${total_count}</span></li>
                                    <li><span>할인 이전 가격</span> <span id="total_before">${total_pay}</span></li>
                                    <li><span>할인율</span> <span id="dispay"></span></li>
                                    <li><span>포인트</span> <span id="point_view"></span></li>
                                    <li><span>총 합</span> <span id="total">${total_pay}</span></li>
                                </ul>
                                <button class="btn karl-checkout-btn" id="pay_btn">결제하기</button>
                                <p>
                                <button class="btn karl-checkout-btn2" id="test_btn">테스트</button>
                                <!-- <a href="#" class="btn karl-checkout-btn">결제하기</a> -->
                            </div>
                        </div>
    
                    </div>
                </div>
            </div>
            <!-- 결제 영역 -->





<%@include file="../include/front_footer.jsp"%>
 <!-- Popper JS -->
  <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>


$(document).ready(function(){

	var coupon_val = $("#coupon option:selected").val();

	$('#coupon').change(function(){

		var coupon_pk = $("#coupon option:selected").val();
		var coupon_price = $("#coupon option:selected").attr('value2');
		console.log(coupon_pk);
		console.log(coupon_price);
			
		var total_before = $('#total_before');
		var tb = parseInt(total_before.text());

		if(tb - parseInt(coupon_price) <= 0){
			alert("할인 금액이 총 금액 보다 많습니다.");

			var show_dispay = $('#dispay'); //총 합 
			var s = parseInt(show_dispay.text(0));
	
			var a = parseInt(show_dispay.text());
			console.log(a);
			var zz = $('#total');
			var c = parseInt(zz.text());
			console.log(c);
			var f = c - a;
			console.log(f);
			var k = zz.text(f);

			$("#coupon").val("0").prop("selected", true);
			return;
		}else{

			var show_dispay = $('#dispay'); //총 합 
			var s = parseInt(show_dispay.text(coupon_price));
	
			var a = parseInt(show_dispay.text());
			console.log(a);
			var zz = $('#total');
			var c = parseInt(zz.text());
			console.log(c);
			var f = c - a;
			console.log(f);
			var k = zz.text(f);
		}
		
		
		
		
		
	});
	
});


function openZipSearch() {
	new daum.Postcode({
		oncomplete: function(data) {
			$('[name=order_zip]').val(data.zonecode); // 우편번호 (5자리)
			$('[name=order_addr1]').val(data.address);
			$('[name=order_addr2]').val(data.buildingName);
		}
	}).open();
}

var order_name_isFalse = 0;
var order_zipcode_isFalse = 0;
var order_addr1_isFalse = 0;
var order_addr2_isFalse = 0;
var order_phone_isFalse = 0;
var order_email_isFalse = 0;
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;


$("#order_name").focusout(function() {

	var order_name = $('#order_name').val();
	if(order_name == ""){	
		 $('#order_name_check').text('성함을 입력해주세요 :)');
		 $('#order_name_check').css('color', 'red');
	}else{	

		 $("#order_name_check").text("확인완료");
		 $("#order_name_check").css("color", "green");
		 order_name_isFalse = 1;
				
	}			
});
$("#order_zipcode").focusout(function() {
	
	var order_zipcode = $('#order_zipcode').val();
	
	if(order_zipcode == ""){	
		 $('#order_zip_check').text('우편번호를 입력해주세요 :) -> 검색 버튼을 이용해주세요.');
		 $('#order_zip_check').css('color', 'red');
	}else{	

		 $("#order_zip_check").text("확인완료");
		 $("#order_zip_check").css("color", "green");
		 order_zipcode_isFalse = 1;
				
	}			
});


$("#order_addr1").focusout(function() {
	var order_addr1 = $('#order_addr1').val();
	//var order_addr1_isFalse = 0;
	
	if(order_addr1 == ""){	
		 $('#order_addr1_check').text('주소를 입력해주세요 :)');
		 $('#order_addr1_check').css('color', 'red');
	}else{	

		 $("#order_addr1_check").text("확인완료");
		 $("#order_addr1_check").css("color", "green");
		 order_addr1_isFalse = 1;
				
	}			
});	  
$("#order_addr2").focusout(function() {
	var order_addr2 = $('#order_addr2').val();
	//var order_addr2_isFalse = 0;
	
	if(order_addr2 == ""){	
		 $('#order_addr2_check').text('상세주소를 입력해주세요 :)');
		 $('#order_addr2_check').css('color', 'red');
	}else{	

		 $("#order_addr2_check").text("확인완료");
		 $("#order_addr2_check").css("color", "green");
		 order_addr2_isFalse = 1;
				
	}			
});	
$("#order_phone").focusout(function() {
	var order_phone = $('#order_phone').val();
	//var order_phone_isFalse = 0;
	
	if(order_phone == ""){	
		 $('#order_phone_check').text('휴대폰번호를 입력해주세요 :)');
		 $('#order_phone_check').css('color', 'red');
	}else{	

		 $("#order_phone_check").text("확인완료");
		 $("#order_phone_check").css("color", "green");
		 order_phone_isFalse = 1;
				
	}			
});	  
$("#order_email").focusout(function() {
	var order_email = $('#order_email').val();
	//var order_email_isFalse = 0;
	if(order_email == ""){	
		 $('#order_email_check').text('이메일을 입력해주세요 :)');
		 $('#order_email_check').css('color', 'red');
	}else if(!mailJ.test(order_email)){
		 $('#order_email_check').text('올바른 이메일을 입력해주세요 :)');
		 $('#order_email_check').css('color', 'red');
	}else{	
		 $("#order_email_check").text("확인완료");
		 $("#order_email_check").css("color", "green");
		 order_email_isFalse = 1;
				
	}			
});	 

$("#test_btn").on("click", function(e){
	
	if(order_name != null && order_zipcode_isFalse == 1 && order_addr1_isFalse == 1 
			&& order_addr2_isFalse == 1 && order_phone_isFalse == 1 && order_email != null){

		 var header = $("meta[name='_csrf_header']").attr('content');
		 var token = $("meta[name='_csrf']").attr('content');

		var coupon_var = $("#coupon").val();
		console.log(coupon_var);

		var total_count = $("#total_count").text();
		var total_money = $("#total").text();

		total_count = parseInt(total_count);
		total_money = parseInt(total_money);

		console.log("count : "+total_count);
		console.log("money : "+total_money);

		var tr = $('.basket_data_tr');
		var tr_length = $('.basket_data_tr').length;


		console.log("tr : "+tr);
		console.log("tr_length : "+tr_length);

		var order_detail_pdid_array = new Array();
		var order_detail_od_cnt_array = new Array();

		for(var k=0; k < tr_length; k++){
			
			order_detail_pdid_array[k] =  parseInt($(tr[k]).find('#td_pdid').text());
			order_detail_od_cnt_array[k] = parseInt($(tr[k]).find('#quantity_num').text());
		 }
		 console.log(order_detail_pdid_array);
		 console.log(order_detail_od_cnt_array);

		 var params = {};

		 for(var i =0 ; i< tr_length; i++){

				params['check_list['+i+'].pdid'] = order_detail_pdid_array[i];
				params['check_list['+i+'].od_cnt'] = order_detail_od_cnt_array[i];
			
		}
			console.log(params);

			var od_form = $("form[role='form']");
			var str = ""

 			for(i =0; i< tr_length; i++){
				str += "<input type='hidden' name='check_list["+i+"].pdid' value='"+params['check_list['+i+'].pdid']+"'>";
				str += "<input type='hidden' name='check_list["+i+"].od_cnt' value='"+params['check_list['+i+'].od_cnt']+"'>";
			} 

			str += "<input type='hidden' name='order_total' value='"+total_money+"'>";
			str += "<input type='hidden' name='order_onum' value='"+total_count+"'>";

			
		 	if(coupon_var != null){
				coupon_var = parseInt(coupon_var);
				str += "<input type='hidden' name='s_cp_idx' value='"+coupon_var+"'>";
				
			}  

			var discount_point = $("#point_view").text();
			console.log("포인트 사용 금액 : " + discount_point);
			if(discount_point != null){
				str += "<input type='hidden' name='point' value='"+discount_point+"'>";
				
			} 
			

			od_form.append(str);



		/* 	if(coupon_var != "0"){
				coupon_var = parseInt(coupon_var);
				console.log(coupon_var);
				
				$.ajax({
					url : '/front/send_use_update',
					type:  "POST",
					data:  {
							s_cp_idx : coupon_var,
							situ : '사용'
					},
					beforeSend: function(xhr){
			    	 	        xhr.setRequestHeader(header, token);
			    	},
					success : function(){
						
							console.log("보낸 값 : " +coupon_var);
									
					},error : function(){
							console.log("실패");
			
					}
			
				}); 

			} */
			od_form.submit();	

	}else{

		alert("정보가 올바르게 입력되지 않았습니다.");
		return;
	}

	

});



$("#pay_btn").on("click", function(e){

	var IMP = window.IMP; // 생략가능
	IMP.init('imp34745534'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

	var total = $('#total');
	var total_var = parseInt(total.text());

	var order_addr = String($("#order_addr1").val());
	var order_zip = String($("#order_zipcode").val());
	var order_email = String($("#order_email").val());
	var order_phone = String($("#order_phone").val());
	var order_name = String($("#order_name").val());


	console.log(order_addr);
	console.log(order_zip);
	console.log(order_email);
	console.log(order_phone);
	console.log(order_name);

	
		if(order_name != null && order_zipcode_isFalse == 1 && order_addr1_isFalse == 1 
				&& order_addr2_isFalse == 1 && order_phone_isFalse == 1 && order_email != null){
			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : total_var,
			    buyer_email : order_email,
			    buyer_name : order_name,
			    buyer_tel : order_phone,
			    buyer_addr : order_addr,
			    buyer_postcode : order_zip,
			    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;

					<!-- 주문 ajax -->


					<!-- 주문 ajax -->
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});


		}else{

			alert("정보가 올바르게 입력되지 않았습니다.");
			return;
		}
			

	


});


$("#free_point").on("click", function(e){
	//isNaN
	var point = $("#use_point").val();
	console.log(point);
	
	
	if(isNaN(point) != true){
	
		var user_point = $("#user_point").text();
		console.log(user_point);
		point = parseInt(point);
		user_point = parseInt(user_point);

		var total_before = $("#total_before").text();
		total_before = parseInt(total_before);

		if(point > user_point){
	
			alert("보유하고 계신 포인트 보다 많습니다.");
			$('#use_point').val("0");

		}else{
				var show_point = $("#point_view");
				var a = show_point.text(point);

				var zz = $('#total');
				var f = total_before - point;
				console.log(f);
				var k = zz.text(f);
			
		}
			
	}else{
		
		alert("숫자로 입력해주세요.");
		$('#use_point').val("0");
	}
	/* point = parseInt(point);
	console.log(point); */
	
});

$("#all_point").on("click", function(e){

	var total_before = $("#total_before").text();
	total_before = parseInt(total_before);
	
	var all_point = $("#user_point").text();
	$('#use_point').val(all_point);
	all_point = parseInt(all_point);
	var show_point = $("#point_view");
	var a = show_point.text(all_point);
	var zz = $('#total');
	var f = total_before - all_point;
	console.log(f);
	var k = zz.text(f);
	
	
});
</script>
