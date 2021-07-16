 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-client_id" content="24627743299-h6519li8hjiikqnfvbuo0fg5n9bg1ifl.apps.googleusercontent.com">
<title>HELLO OAuth</title>

</head>

<body>
	<!-- <fieldset>
		<label>로그인</label> <br>
		<div id="googleLoginBtn" style="cursor: pointer">
			<img id="googleLoginImg" src="/resources/img/gb.png">
		</div>
	</fieldset> -->
	<div class="g-signin2" data-onsuccess="onSignIn"></div>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>  
<script>
 /* 	const onClickGoogleLogin = (e) => {
    	//구글 인증 서버로 인증코드 발급 요청
 		window.location.replace("https://accounts.google.com/o/oauth2/v2/auth?
        client_id=yourClientID
        &redirect_uri=http://localhost:8080/google_login
        &response_type=code
        &scope=email%20profile%20openid
        &access_type=offline")
 	}
	
	const googleLoginBtn = document.getElementById("googleLoginBtn");
	googleLoginBtn.addEventListener("click", onClickGoogleLogin); */

	function onSignIn(googleUser) {
		  var profile = googleUser.getBasicProfile();
		  var id_token = googleUser.getAuthResponse().id_token;
		  $("#googleBtn").click(function(){
			  $.ajax({
				  url: 'http://localhost:8080/google_login',
				  type: 'POST',
				  data: 'idtoken=' + id_token, 
				  dataType: 'JSON',
				  beforeSend : function(xhr){
					  xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
				  },
				  success: function(json) {
					  if (json.login_result == "success"){
						  location.href = "/front/index";
					  }//end if
		          }//success
			  });//ajax
		  });//click
</script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
</html> 


<%-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>LoginTest</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  <style type="text/css">
  html, div, body,h3{
  	margin: 0;
  	padding: 0;
  }
  h3{
  	display: inline-block;
  	padding: 0.6em;
  }
  </style>
</head>
<body>
<div style="background-color:#15a181; width: 100%; height: 50px;text-align: center; color: white; "><h3>SIST Login</h3></div>
<br>
<!-- 구글 로그인 화면으로 이동 시키는 URL -->
<!-- 구글 로그인 화면에서 ID, PW를 올바르게 입력하면 oauth2callback 메소드 실행 요청-->
<div id="google_id_login" style="text-align:center"><a href="${google_url}"><img width="230" src="${pageContext.request.contextPath}/resources/img/btn_google_signin_dark_normal_web@2x.png"/></a></div>
</body>
</html> --%>