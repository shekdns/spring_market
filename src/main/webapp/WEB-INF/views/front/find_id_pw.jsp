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
                            <h2>아이디 비밀번호 찾기</h2>
                        
                          </div>
                          	 <div style="height: auto; width: 400px;">
								 <div class="sign-in-page-data">
									<div class="sign-in-from w-100 pt-5 m-auto">
										<h5 class="mb-3 text-center" >인증된 이메일만 정보 찾기가 가능합니다 :)</h5>
		
										<form class="mt-4">
										     <div style="text-align: center;">
												<div style="margin-bottom: 10px; "
													class="custom-control custom-radio custom-control-inline">
													<input type="radio" class="custom-control-input" id="search_1"
														name="search_total" onclick="search_check(1)"
														checked="checked"> <label
														class="custom-control-label font-weight-bold"
														for="search_1">아이디 찾기</label>
												</div>
												<div class="custom-control custom-radio custom-control-inline">
													<input type="radio" class="custom-control-input" id="search_2"
														name="search_total" onclick="search_check(2)"> 
														<label class="custom-control-label font-weight-bold"
														for="search_2">비밀번호 찾기</label>
														
												</div>
											  </div>
											<div id="searchI">
												<div class="form-group">
													<label class="font-weight-bold" for="inputName_1">이름</label>
													<div>
														<input type="text" class="form-control" id="name"
															name="name" placeholder="name">
													</div>
												</div>
												<div class="form-group">
													<label class="font-weight-bold" for="inputPhone_1">이메일</label>
													<div>
														<input type="text" class="form-control" id="id_email"
															name="email" placeholder="email">
													</div>
												</div>
												<div class="form-group">
													<button id="searchBtn" type="button"
														 class="btn btn-primary btn-block">확인</button>
														<a class="btn btn-danger btn-block" href="/front/sign_in">돌아가기</a>
												</div>
											</div>
											<div id="searchP" style="display: none;">
												<div class="form-group">
													<label class="font-weight-bold" for="inputId">아이디</label>
													<div>
														<input type="text" class="form-control" id="id"
															name="id" placeholder="id">
													</div>
													<div class="check_font" id="id_check"></div>
												</div>
												<div class="form-group">
													<label class="font-weight-bold" for="inputEmail_2">이메일</label>
													<div>
														<input type="email" class="form-control" id="p_email"
															name="email" placeholder="email">
													</div>
													<div class="check_font" id="email_check"></div>
												</div>
												<div class="form-group">
													<button id="searchBtn2" type="button"
														class="btn btn-primary btn-block">확인</button>
													<a class="btn btn-danger btn-block" href="/front/sign_in">돌아가기</a>
												</div>
											</div>
		
										</form>
		
									</div>
								</div>
							</div>
							
							


					</div>

                </div>
            </div>
 
 
  <%@include file="../include/front_footer.jsp"%>
  
  <script>
  function search_check(num){
		if(num == '1'){
			document.getElementById("searchP").style.display = "none";
			document.getElementById("searchI").style.display = "";
		}else{
			document.getElementById("searchI").style.display = "none";
			document.getElementById("searchP").style.display = "";
		}


	}

  $("#searchBtn").on("click", function(){	
		var id_name = $("#name").val();
	    var id_email = $("#id_email").val();
		
		$.ajax({
			url : '${pageContext.request.contextPath}/front/find_id_pw/name_emailCheck?name='+id_name+'&email='+id_email,
			type : "GET",
				success : function(data) {
					var numJson = Number(data);
					console.log("1 = 중복o / 0 = 중복x : " + numJson);									
					if (numJson == 1) {
						// 1 : 이메일가 중복되는 문구
						alert("회원님의 이메일로 아이디가 전송되었습니다.");
						$.ajax({
						url : '${pageContext.request.contextPath}/front/find_id_pw/searchId?name='+id_name+'&email='+id_email,
						type : 'GET'
					  });
					  document.getElementById("name").value = "";
					  document.getElementById("id_email").value = "";
					}else{
						alert("이름과 이메일이 일치하지 않습니다.");
					}
				},
				 error : function() {
					console.log("실패");
			}
		});
		

	});



	$("#searchBtn2").on("click", function(){	
		var p_id = $("#id").val();
	    var p_email = $("#p_email").val();
		
		$.ajax({
			url : '${pageContext.request.contextPath}/front/find_id_pw/id_emailCheck?id='+p_id+'&email='+p_email,
			type : "GET",
				success : function(data) {
					var numJson = Number(data);
					console.log("1 = 중복o / 0 = 중복x : " + numJson);									
					if (numJson == 1) {
						// 1 : 이메일가 중복되는 문구
						alert("회원님의 이메일로 새로운 비밀번호가 전송되었습니다.");
						$.ajax({
						url : '${pageContext.request.contextPath}/front/find_id_pw/searchPassword?id='+p_id+'&email='+p_email,
						type : 'GET'
					  });
					  document.getElementById("id").value = "";
					  document.getElementById("p_email").value = "";

					}else{
						alert("아이디와 이메일이 일치하지 않습니다.");
					}
				},
				 error : function() {
					console.log("실패");
			}
		});
		

	});



  </script>