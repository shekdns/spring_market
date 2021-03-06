<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<body>

    <!--모달창-->
      <div id="myModal" class="modal fade">
        <div class="modal-dialog modal-login">
            <div class="modal-content">
                <div class="modal-header">				
                    <h4 class="modal-title">Member Login</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <form action="/login" method="post" role="form" id="login_form" name="login_form">
                        <div class="form-group">
                            <i class="fa fa-user"></i>
                            <input type="text" class="form-control" placeholder="Username" required="required" name="username">
                        </div>
                        <div class="form-group">
                            <i class="fa fa-lock"></i>
                            <input type="password" class="form-control" placeholder="Password" required="required" name="password">					
                        </div>
                        <div class="form-group">
                            <input type="button" class="btn btn-primary btn-block btn-lg" value="Login" id="login_btn">
                        </div>
                        
                         <input type="hidden" name="${_csrf.parameterName}"
                             				 value="${_csrf.token}" />
                    </form>
                     <div class="form-group">
                            <input type="button" class="btn btn-danger btn-block btn-lg" value="Google-Login" id="google_btn" onclick="google_test();">
                     </div>
                </div>
                <div class="modal-footer">
                    <a href="/front/find_id_pw">Forgot Id OR Password?</a>
                </div>
            </div>
        </div>
    </div> 
    <!-- 모달창 끝-->


    <div class="super_container">

        <header class="header trans_300">
                <div class="top_nav">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="top_nav_left"></div>
                            </div>
                            <div class="col-md-6 text-right">
                                <div class="top_nav_right">
                                
                                    <ul class="top_nav_menu">
                                       
                                        <li class="account">
                                        <a href="#">
                                            <sec:authorize access="isAnonymous()">
                                            My Account <i class="fa fa-angle-down"></i>
                                             </sec:authorize>
                                        	<sec:authorize access="isAuthenticated()">
                                        	${principal.username} <i class="fa fa-angle-down"></i>
                                        	</sec:authorize>
                                        </a>
                                        
                                        <ul class="account_selection">
                                        <sec:authorize access="isAnonymous()">
                                            <li><a href="#myModal" data-toggle="modal"><i class="fa fa-share" aria-hidden="true"></i>로그인</a></li >
                                            <li><a href="member_register"><i class="fa fa-user-plus" aria-hidden="true"></i>회원가입</a></li>
                                        </sec:authorize>
                                        <sec:authorize access="isAuthenticated()">
                                        
                                        	<sec:authorize access="hasRole('ROLE_ADMIN')" >	
                                        	<li><a href="/admin/admin_index"><i class="fa fa-home" aria-hidden="true"></i>관리자이동</a></li>
                                        	<li><a href="/logout"><i class="fa fa-share" aria-hidden="true"></i>로그아웃</a></li>
	                                      
                                        	</sec:authorize>
                                        	
                                        	<sec:authorize access="hasRole('ROLE_USER')" >
	                                        <li><a href="/logout"><i class="fa fa-share" aria-hidden="true"></i>로그아웃</a></li>
	                                        <li><a href="user_info"><i class="fa fa-user" aria-hidden="true"></i>내 정보</a></li>
	                                        <li><a href="${principal.username}" class="basket_move"> <i class="fa fa-shopping-cart" aria-hidden="true"></i>장바구니</a></li>
	                                        <li><a href="${principal.username}" class="wish_move">  <i class="fa fa-heart" aria-hidden="true"></i>관심상품</a></li>
	                                       
	                                    	</sec:authorize>
	                                    	
	                                     </sec:authorize>   
                                        
                                        </ul>
                                
                                        </li>
                                    </ul>
                                              
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="main_nav_container">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 text-right">
                                <div class="logo_container">
                                <a href="index">Spring<span>Market</span></a>
                                </div>
                                    <nav class="navbar">
                                        <ul class="navbar_menu">
                                            <li><a href="/front/index">메인</a></li>
                                            <li><a href="/front/category">카테고리</a></li>
                                            <li><a href="/front/qa_board/qa_board_list">고객게시판</a></li>
                                            <li><a href="#">찾아오시는길</a></li>
                                        </ul>
                                    <sec:authorize access="isAuthenticated()">
                                    <ul class="navbar_user">
                                        <li><a href="#"><i class="fa fa-user" aria-hidden="true"></i></a></li>
                                        <li class="checkout">
                                            <a href="${principal.username}" class="basket_move"> 
                                                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                                
                                            </a>
                                        </li>
                                         <li class="checkout">
                                            <a href="${principal.username}" class="wish_move">
                                                <i class="fa fa-heart" aria-hidden="true"></i>
                                               <!--  <span id="checkout_items" class="checkout_items"></span> -->
                                            </a>
                                        </li>
                                    </ul>
                                    </sec:authorize>
                                        <div class="hamburger_container">
                                        <i class="fa fa-bars" aria-hidden="true"></i>
                                        </div>
                                    </nav> 
                             </div>
                        </div>
                    </div>
                </div>
                


            </header>
            <div class="fs_menu_overlay"></div>
            <div class="hamburger_menu">
                <div class="hamburger_close"><i class="fa fa-times" aria-hidden="true"></i></div>
                <div class="hamburger_menu_content text-right">
                    <ul class="menu_top_nav">
                        <li class="menu_item has-children">
                            <a href="#">
                                 <sec:authorize access="isAnonymous()">
                                  My Account <i class="fa fa-angle-down"></i>
                                  </sec:authorize>
                                  <sec:authorize access="isAuthenticated()">
                                 ${principal.username} <i class="fa fa-angle-down"></i>
                                  </sec:authorize>
                            </a>
                            <ul class="menu_selection">
                            	<sec:authorize access="isAnonymous()">
                            		<li><a href="#myModal" data-toggle="modal"><i class="fa fa-share" aria-hidden="true"></i>로그인</a></li >
                                    <li><a href="member_register"><i class="fa fa-user-plus" aria-hidden="true"></i>회원가입</a></li>        
                            	</sec:authorize>
                            	
                            	  <sec:authorize access="isAuthenticated()">
                                        
                                    <sec:authorize access="hasRole('ROLE_ADMIN')" >	
                                        	<li><a href="/admin/admin_index"><i class="fa fa-home" aria-hidden="true"></i>관리자이동</a></li>
                                        	<li><a href="/logout"><i class="fa fa-share" aria-hidden="true"></i>로그아웃</a></li>
	                                      
                                    </sec:authorize>
                                        	
                                    <sec:authorize access="hasRole('ROLE_USER')" >
	                                         <li><a href="/logout"><i class="fa fa-share" aria-hidden="true"></i>로그아웃</a></li>
	                                        <li><a href="user_info"><i class="fa fa-user" aria-hidden="true"></i>내 정보</a></li>
	                                        <li><a href="${principal.username}" class="basket_move"> <i class="fa fa-shopping-cart" aria-hidden="true"></i>장바구니</a></li>
	                                        <li><a href="${principal.username}" class="wish_move"> <i class="fa fa-heart" aria-hidden="true"></i>관심상품</a></li>
	                                </sec:authorize>
	                                    	
	                            </sec:authorize>   
                            </ul>
                        </li>
                        <li class="menu_item"><a href="/front/index">메인</a></li>
                        <li class="menu_item"><a href="/front/category">카테고리</a></li>
                        <li class="menu_item"><a href="/front/qa_board/qa_board_list">고객게시판</a></li>
                        <li class="menu_item"><a href="#">찾아오시는길</a></li>
                    </ul>
                </div>
            </div>

            

		</div>