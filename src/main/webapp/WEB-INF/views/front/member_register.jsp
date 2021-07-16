<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../include/front_setting.jsp"%>
 <%@include file="../include/front_header.jsp"%>
 	
 	<div class="container sign_up_section_container">
                <div class="row">
                    <div class="header_record">
                        <div class="title">
                           
                        
                        </div>

                        <div class="sidebar">
                            <div class="sign_in_container">
                                <a href="#">Invite Spring<br><span>Market</span></a>
                                </div>
                        </div>
                    </div>
                    
                    <div class="form_container">
                          <div class="title">
                            <h2>회원가입</h2>
                        
                        </div>
                        
                        <div style="text-align: center;">
                            <div class="stepLine">
                              <div title="이용약관" class="stepDot activeStep"></div>
                              <div title="정보입력" class="stepDot" id="stepInfo"></div>
                              <div title="가입완료" class="stepDot"></div>
                            </div>
                            <br><br><br>
                        </div>
                          
                          <div class="yak_container" id="yak_container">
								<form action="" id="joinForm" name="yak_form">
									<ul class="join_box">
										<li class="checkBox check01">
											<ul class="clearfix">
												<li>이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 안내 메일 수신(선택)에
													모두 동의합니다.</li>
												<li class="checkAllBtn"><input type="checkbox"
													name="chkAll" id="chk" class="chkAll"
													onclick="selectAll(this);"></li>
											</ul>
										</li>
										<li class="checkBox check02">
											<ul class="clearfix">
												<li>이용약관 동의(필수)</li>
												<li class="checkBtn"><input type="checkbox" name="chk1"
													class="y_chk" id="yak1" onclick="yak_check();"></li>
											</ul> <textarea>여러분을 환영합니다. Spring Market 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 Spring Market의 이용과 관련하여 Spring Market를 제공하는 Spring Market과 이를 이용하는 Spring Market 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 Spring Market 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
				                           </textarea>
										</li>
										<li class="checkBox check03">
											<ul class="clearfix">
												<li>개인정보 수집 및 이용에 대한 안내(필수)</li>
												<li class="checkBtn"><input type="checkbox" name="chk2"
													class="y_chk" id="yak2" onclick="yak_check();"></li>
											</ul> <textarea>여러분을 환영합니다. Spring Market 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 Spring Market의 이용과 관련하여 Spring Market를 제공하는 Spring Market과 이를 이용하는 Spring Market 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 Spring Market 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
				                           </textarea>
										</li>
										<li class="checkBox check03">
											<ul class="clearfix">
												<li>위치정보 이용약관 동의(선택)</li>
												<li class="checkBtn"><input type="checkbox" name="chk3"
													class="y_chk"></li>
											</ul> <textarea>여러분을 환영합니다.Spring Market 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 Spring Market의 이용과 관련하여 Spring Market를 제공하는 Spring Market과 이를 이용하는 Spring Market 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 Spring Market 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
				                           </textarea>
										</li>
										<li class="checkBox check04">
											<ul class="clearfix">
												<li>이벤트 등 프로모션 알림 메일 수신(선택)</li>
												<li class="checkBtn"><input type="checkbox" name="chk4">
												</li>
											</ul>
				
										</li>
									</ul>
									<ul class="footBtwrap clearfix">
										<li><button class="fpmgBt2" id="nextBtn" disabled>동의</button></li>
										<li><button class="fpmgBt1">돌아가기</button></li>
									</ul>
								</form>
						 </div>
                        
                        	<!-- style="display: none;" -->
					 	  <div id="register_container" style="display: none;">
	                        <form class="user" id="reg_form" role="form" method="POST" action="/front/member_register">                
	                            <input type="hidden" name="${_csrf.parameterName}"
	                                value="${_csrf.token}" />
	
	                            <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="user_id">아이디</label>
                                        <input type="text" class="form-control form-control-user" id="id"
                                            placeholder="아이디" name="userid">
                           				<div class="check_font" id="id_check"></div>
                                    </div>
                          
                                    <div class="col-sm-6">
                                        <label for="user_id">이름</label>
                                        <input type="text" class="form-control form-control-user" id="name"
                                            placeholder="이름" name="username">
                                        <div class="check_font" id="name_check"></div>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="user_id">비밀번호</label>
                                        <input type="password" class="form-control form-control-user" id="pass1"
                                            placeholder="비밀번호" name="userpw">
                           				<div class="check_font" id="pass1_check"></div>
                                    </div>
                          
                                    <div class="col-sm-6">
                                        <label for="user_id">비밀번호 재확인</label>
                                        <input type="password" class="form-control form-control-user" id="pass2"
                                            placeholder="비밀번호 확인">
                                        <div class="check_font" id="pass2_check"></div>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-4 mb-3 mb-sm-0">
                                        <label for="user_id">PHONE</label>
                                        <input type="text" class="form-control form-control-user" id="phone1"
                                            placeholder="id" name="phone1">
                           				<div class="check_font" id="phone1_check"></div>
                                    </div>
                          
                                    <div class="col-sm-4">
                                        <label for="user_id">.</label>
                                        <input type="text" class="form-control form-control-user" id="phone2"
                                            placeholder="nickname" name="phone2">
                                        <div class="check_font" id="phone2_check"></div>
                                    </div>

                                    <div class="col-sm-4">
                                        <label for="user_id">.</label>
                                        <input type="text" class="form-control form-control-user" id="phone3"
                                            placeholder="nickname" name="phone3">
                                        <div class="check_font" id="phone3_check"></div>
                                    </div>
                                </div>
                                <!-- 본인확인 이메일 -->
                                <div class="form-group">
                                    <label for="user_email">이메일</label>
                                        <input type="text" class="form-control" name="email" id="email" placeholder="E-mail" required>
                                        <div class="check_font" id="email_check"></div>
                                </div>
                                <!-- 휴대전화 -->
                                <div class="form-group row">
                                    <div class="col-4">
                                        <label for="user_id">우편번호</label>
                                        <input type="text" class="form-control form-control-user" id="zip"
                                            placeholder="우편번호" name="zipcode">
                           				<div class="check_font" id="zip_check"></div>
                                    </div>
                                    <div class="col-3">
                                        <label for="user_id">.</label>
                                         <div>
                                           <input type="button" class="btn btn-primary" onclick="openZipSearch();" value="검색">                      
                                         </div>    
                                    </div>
        
                                </div>

                                <div class="reg_button">
                                    <button class="btn btn-primary px-3" id="reg_submit" disabled>
                                        <i class="fa fa-heart pr-2" aria-hidden="true"></i>가입하기
                                    </button>
                                      <a class="btn btn-danger px-3" href="/front/index">
                                        <i class="fa fa-rotate-right pr-2" aria-hidden="true" ></i>돌아가기
                                    </a>&emsp;&emsp;
                                </div>
	                        
	                        
	
	
	                        </form>
	                     </div>
                    </div>

                </div>
            </div>
 
 
  <%@include file="../include/front_footer.jsp"%>
  <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
  <script>

  //다음 우편번호API
  function openZipSearch() {
  	new daum.Postcode({
  		oncomplete: function(data) {
  			$('[name=zipcode]').val(data.zonecode); // 우편번호 (5자리)
  			$('[name=addr1]').val(data.address);
  			$('[name=addr2]').val(data.buildingName);
  		}
  	}).open();
  }

  //약관 체크박스 함수
  function selectAll(selectAll)  {
      
      const checkboxes 
          = document.querySelectorAll('input[type="checkbox"]');
      
      checkboxes.forEach((checkbox) => {
          checkbox.checked = selectAll.checked
      });

      if ($("input:checkbox[name=chk1]").is(":checked") == true && $("input:checkbox[name=chk2]").is(":checked")) {
              //체크가 되어있을때.    
              $("#nextBtn").attr("disabled", false);
              $("#nextBtn").css("background-color", "#94EB3E");
      } else {
              //체크가 안되어있을때.
              $("#nextBtn").attr("disabled", true);
              $("#nextBtn").css("background-color", "#FF4646");
      }
      
  }

  //약관 체크박스 함수
  function yak_check(){

      
      if ($("input:checkbox[name=chk1]").is(":checked") == true && $("input:checkbox[name=chk2]").is(":checked")) {
              //체크가 되어있을때.    
              $("#nextBtn").attr("disabled", false);
              $("#nextBtn").css("background-color", "#94EB3E");
      } else {
              //체크가 안되어있을때.
              $("#nextBtn").attr("disabled", true);
              $("#nextBtn").css("background-color", "#FF4646");

      }

  }
  //약관 버튼 함수
  $("#nextBtn").on("click", function(e){

	  //var joinForm = $("#joinForm"); 

      e.preventDefault();

      // joinForm.attr("action","/front/member_register");
      // joinForm.submit();
      document.getElementById("yak_container").style.display = "none";
	  document.getElementById("register_container").style.display = "";
	  $("#stepInfo").addClass('stepDot activeStep');
      
		
   });

   //회원가입 유효성 검사 

	var idJ = /^[a-z0-9]{4,12}$/;
	var pwJ = /^[A-Za-z0-9]{4,12}$/; 
	var nameJ = /^[가-힣a-zA-Z]+$/;
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	

	var id_isFalse = 0;
	var name_isFalse = 0;
	var email_isFalse = 0;
	var pass_isFalse = 0;

	$("#id").blur(function() {
		var user_id = $('#id').val();
		
		if(user_id == ""){
			
			$('#id_check').text('아이디를 입력해주세요 :)');
			$('#id_check').css('color', 'red');
			$("#reg_submit").attr("disabled", true);	
			id_isFalse = 0;
		}else{
			
		$.ajax({
			url : '${pageContext.request.contextPath}/front/member_register/idCheck?id='+user_id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : " + data);							
				console.log("아이디 : " + user_id);	
				console.log("id_false : " + id_isFalse);		
				if (data == 1) {
					
					$("#id_check").text("사용중인 아이디입니다 :p");
					$("#id_check").css("color", "red");
					$("#reg_submit").attr("disabled", true);
					id_isFalse = 0;		
				} else if(!idJ.test(user_id)){
					$("#id_check").text("아이디는 소문자와 숫자 4~12 자리만 가능 합니다 :p");
					$("#id_check").css("color", "red");
					$("#reg_submit").attr("disabled", true);
					id_isFalse = 0;		
				} else {
					$("#id_check").text("사용가능한 아이디입니다 :p");
					$("#id_check").css("color", "green");
					id_isFalse = 1;
					signUp();
				}
			}, error : function() {
						console.log("실패");
				}
			});
		}
		
	});

	$("#name").blur(function() {
			
		var name = $('#name').val();
	
		if(name == ""){
			$('#name_check').text('이름을 입력해주세요 :)');
			$('#name_check').css('color', 'red');
			$("#reg_submit").attr("disabled", true);	
			name_isFalse = 0;
		}else{
		isFalse = 0;
		$.ajax({
			url : '${pageContext.request.contextPath}/front/member_register/nameCheck?name='+name,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : " + data);
				console.log("이름 : " + name);									
				console.log("name_false : " + name_isFalse);
				if (data == 1) {
					
					$("#name_check").text("사용중인 이름입니다 :p");
					$("#name_check").css("color", "red");
					$("#reg_submit").attr("disabled", true);
					name_isFalse = 0;
				}else if(!nameJ.test(name)){
				
					$("#name_check").text("이름은 한글 또는 영문으로 해주세요 :p");
					$("#name_check").css("color", "red");
					$("#reg_submit").attr("disabled", true);
					name_isFalse = 0;		
				} 
				else {
					$("#name_check").text("사용가능한 이름입니다 :p");
					$("#name_check").css("color", "green");
					name_isFalse = 1;
					signUp();
				}
			}, error : function() {
						console.log("실패");
				}
			});
		}
	});

	$("#email").blur(function() {
		var email = $('#email').val();
		
		if(email == ""){
			
			$('#email_check').text('이메일을 입력해주세요 :)');
			$('#email_check').css('color', 'red');
			$("#reg_submit").attr("disabled", true);	
			email_isFalse = 0;
		}else{
			
		$.ajax({
			url : '${pageContext.request.contextPath}/front/member_register/emailCheck?email='+email,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : " + data);							
				console.log("이메일 : " + email);
				console.log("email_false : " + email_isFalse);				
				if (data == 1) {
					
					$("#email_check").text("사용중인 이메일입니다 :p");
					$("#email_check").css("color", "red");
					$("#reg_submit").attr("disabled", true);
					email_isFalse = 0;
				}else if(!mailJ.test(email)){
 
					$("#email_check").text("유효한 이메일을 입력해주세요 :p");
					$("#email_check").css("color", "red");
					$("#reg_submit").attr("disabled", true);
					email_isFalse = 0;		
				}  
				else {
					
					$("#email_check").text("사용가능한 이메일입니다 :p");
					$("#email_check").css("color", "green");
				
					email_isFalse = 1;
					signUp();
				}
			}, error : function() {
						console.log("실패");
				}
			});
		}
	
	});

	$("#pass1").blur(function(){
		var pass = $('#pass1').val();
		
		if(pass == ""){
		
			$('#pass1_check').text('비밀번호를 입력해주세요 :)');
			$('#pass1_check').css('color', 'red');
			$("#reg_submit").attr("disabled", true);
		
		}else if(!pwJ.test(pass)){
				$("#pass1_check").text("숫자 or 문자로만 4~12 자리 입력 ");
				$("#pass1_check").css("color", "red");
				$("#reg_submit").attr("disabled", true);
		}else{
				$("#pass1_check").text("사용가능한 비밀번호 입니다 :p");
			    $("#pass1_check").css("color", "green");
				signUp();
		}
		
	});

	$("#pass2").blur(function(){
		var pass2 = $('#pass2').val();
		var pass_check = $('#pass1').val();
		
		if(pass_check == ""){
			$('#pass2_check').text('비밀번호 입력란에 먼저 입력해주세요');
			$('#pass2_check').css('color', 'red');
			$("#reg_submit").attr("disabled", true);
		}else if(pass2 != pass_check){
			$('#pass2_check').text('비밀번호가 다릅니다.');
			$('#pass2_check').css('color', 'red');
			$("#reg_submit").attr("disabled", true);
		}else{
			$("#pass2_check").text("재확인 되었습니다.");
		    $("#pass2_check").css("color", "green");
			signUp();
		}
		
	});

    $("#phone1").blur(function(){

        var phone1 = $('#phone1').val();
        
        if(phone1 == ""){
            $("#phone1_check").text('입력해주세요.');
            $("#phone1_check").css('color', 'red');
            $("#reg_submit").attr("disabled", true);
        }else{
            $("#phone1_check").text("OK");
		    $("#phone1_check").css("color", "green");
			signUp();

        }

    });

    $("#phone2").blur(function(){

        var phone2 = $('#phone2').val();

        if(phone2 == ""){
            $("#phone2_check").text('입력해주세요.');
            $("#phone2_check").css('color', 'red');
            $("#reg_submit").attr("disabled", true);
        }else{
            $("#phone2_check").text("OK");
            $("#phone2_check").css("color", "green");
            signUp();

        }

    });

    $("#phone3").blur(function(){

        var phone1 = $('#phone3').val();

        if(phone1 == ""){
            $("#phone3_check").text('입력해주세요.');
            $("#phone3_check").css('color', 'red');
            $("#reg_submit").attr("disabled", true);
        }else{
            $("#phone3_check").text("OK");
            $("#phone3_check").css("color", "green");
            signUp();

        }

    });

    $("#zip").blur(function(){

        var zip = $('#zip').val();

        if(zip == ""){
            $("#zip_check").text('입력해주세요.');
            $("#zip_check").css('color', 'red');
            $("#reg_submit").attr("disabled", true);
        }else if(zip.length != 5){
        	$("#zip_check").text('유효하지않은 우편번호입니다.');
            $("#zip_check").css('color', 'red');
            $("#reg_submit").attr("disabled", true);
        }else{
            $("#zip_check").text("OK");
            $("#zip_check").css("color", "green");
            signUp();

        }

    });

	function signUp(){
		var check_id = $('#id_check').html();
		var check_pwd = $('#pass1_check').html();
		var check_pwd2 = $('#pass2_check').html();
   		var check_name = $('#name_check').html();
   		var check_email = $('#email_check').html();
        var check_phone1 = $('#phone1_check').html();
        var check_phone2 = $('#phone2_check').html();
        var check_phone3 = $('#phone3_check').html();
        var check_zip = $('#zip_check').html();
   		
		if(check_id == '사용가능한 아이디입니다 :p' && check_pwd == '사용가능한 비밀번호 입니다 :p'
		&& check_name == '사용가능한 이름입니다 :p' && check_email == '사용가능한 이메일입니다 :p' && check_pwd2 == '재확인 되었습니다.'
        && check_phone1 == 'OK' && check_phone2 == 'OK' && check_phone3 == 'OK' && check_zip == 'OK'){
			$("#reg_submit").attr("disabled", false);
		}
	}



   $("#reg_submit").on("click", function(e){

  	  e.preventDefault();

   	 $("#reg_form").submit();
   	 alert("가입 되셨습니다.");

   });
  //회원가입 유효성 검사끝
  </script> 