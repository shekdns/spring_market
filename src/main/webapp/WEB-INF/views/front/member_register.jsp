<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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

                        <form class="user" role="form" method="POST" action="/login">                
                            <input type="hidden" name="${_csrf.parameterName}"
                                value="${_csrf.token}" />

                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="user_id">아이디</label>
                                        <input type="text" class="form-control form-control-user" id="id"
                                            placeholder="id" name="userid">
                           				<div class="check_font" id="id_check"></div>
                                    </div>
                          
                                    <div class="col-sm-6">
                                        <label for="user_id">아이디</label>
                                        <input type="text" class="form-control form-control-user" id="name"
                                            placeholder="nickname" name="userName">
                                        <div class="check_font" id="name_check"></div>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-4 mb-3 mb-sm-0">
                                        <label for="user_id">아이디</label>
                                        <input type="text" class="form-control form-control-user" id="id"
                                            placeholder="id" name="userid">
                           				<div class="check_font" id="id_check"></div>
                                    </div>
                          
                                    <div class="col-sm-4">
                                        <label for="user_id">아이디</label>
                                        <input type="text" class="form-control form-control-user" id="name"
                                            placeholder="nickname" name="userName">
                                        <div class="check_font" id="name_check"></div>
                                    </div>

                                    <div class="col-sm-4">
                                        <label for="user_id">아이디</label>
                                        <input type="text" class="form-control form-control-user" id="name"
                                            placeholder="nickname" name="userName">
                                        <div class="check_font" id="name_check"></div>
                                    </div>
                                </div>

                            	<div class="form-group">
                                    <label for="user_id">아이디</label>
                                        <input type="text" class="form-control" id="user_id" name="user_id" placeholder="ID" required>
                                    <div class="check_font" id="id_check"></div>
                                </div>
                                <!-- 비밀번호 -->
                                <div class="form-group">
                                    <label for="user_pw">비밀번호</label>
                                        <input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="PASSWORD" required>
                                    <div class="check_font" id="pw_check"></div>
                                </div>
                                <!-- 비밀번호 재확인 -->
                                <div class="form-group">
                                    <label for="user_pw2">비밀번호 확인</label>
                                        <input type="password" class="form-control" id="user_pw2" name="user_pw2" placeholder="Confirm Password" required>
                                    <div class="check_font" id="pw2_check"></div>
                                </div>
                                <!-- 이름 -->
                                <div class="form-group">
                                    <label for="user_name">이름</label>
                                        <input type="text" class="form-control" id="user_name" name="user_name" placeholder="Name" required>
                                    <div class="check_font" id="name_check"></div>
                                </div>
                                <!-- 생년월일 -->
                                <div class="form-group required">
                                    <label for="user_birth">생년월일</label>
                                        <input type="text" class="form-control" id="user_birth" name="user_birth" placeholder="ex) 19990415" required>
                                    <div class="check_font" id="birth_check"></div>
                                </div>
                                <!-- 본인확인 이메일 -->
                                <div class="form-group">
                                    <label for="user_email">이메일</label>
                                        <input type="text" class="form-control" name="user_email" id="user_email" placeholder="E-mail" required>
                                        <!-- <input type="text" style="margin-top: 5px;"class="email_form" name="email_confirm" id="email_confirm" placeholder="인증번호를 입력해주세요!" required>
                                            <button type="button" class="btn btn-outline-danger btn-sm px-3" onclick="confirm_email()">
                                                <i class="fa fa-envelope"></i>&nbsp;인증
                                            </button>&nbsp;
                                            <button type="button" class="btn btn-outline-info btn-sm px-3">
                                                <i class="fa fa-envelope"></i>&nbsp;확인
                                            </button>&nbsp; -->
                                        <div class="check_font" id="email_check"></div>
                                </div>
                                <!-- 휴대전화 -->
                                <div class="form-group">
                                    <label for="user_phone">휴대전화 ('-' 없이 번호만 입력해주세요)</label>
                                    <input type="text" class="form-control" id="user_phone" name="user_phone" placeholder="Phone Number" required>
                                    <div class="check_font" id="phone_check"></div>
                                </div>
                                <div class="reg_button">
                                    <a class="btn btn-danger px-3" href="${pageContext.request.contextPath}">
                                        <i class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소하기
                                    </a>&emsp;&emsp;
                                    <button class="btn btn-primary px-3" id="reg_submit">
                                        <i class="fa fa-heart pr-2" aria-hidden="true"></i>가입하기
                                    </button>
                                </div>
                        
                        


                        </form>
                    </div>

                </div>
            </div>
 
 
  <%@include file="../include/front_footer.jsp"%>