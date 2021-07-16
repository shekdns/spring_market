<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
            <div class="newsletter">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div
                                class="newsletter_text d-flex flex-column justify-content-center align-items-lg-start align-items-md-center text-center">
            
                            </div>
                        </div>
                        <div class="col-lg-6">
            
                        </div>
                    </div>
                </div>
            </div>
            
            <footer class="footer">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div
                                class="footer_nav_container d-flex flex-sm-row flex-column align-items-center justify-content-lg-start justify-content-center text-center">
                                <ul class="footer_nav">
                                    <li><a href="#">Blog</a></li>
                                    <li><a href="#">FAQs</a></li>
                                    <li><a href="contact.html">Contact us</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="footer_nav_container">
                              
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
        
        	<form id='actionForm' action="" method='get'>
		
			</form>
    


</body>
 <script src="https://code.jquery.com/jquery-3.4.1.js"></script> 
 <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
 <script src="/resources/js/custom.js"></script>
 <script>
 
	 $("#login_btn").on("click", function(e){
		      
		      //var p_id = $("#id").val();
			  //var p_pw = $("#pass").val();

			  var p_id = document.login_form.username.value;
			  var p_pw = document.login_form.password.value;
				
		  if(p_id == "" || p_pw == ""){
		
		  	 alert("id 또는 pw를 입력해주세요 !! ");
				 window.history.back();
		
		  	}else{  
			      $("#login_form").submit();
				}
					
		   
	});

	function google_test(){
		location.href = "${google_url}";
	}

	 $(document)
	   .ready(
	   		function() {

	   			// replaceState(data, title [, url ]) 히스토리를 수정
	   			history.replaceState({}, null, null);
	   			var actionForm = $("#actionForm");
	   			
	   			$(".basket_move")
	   			.on(
	   					"click",
	   					function(e) {
	   						e.preventDefault();
	   						actionForm
	   								.append("<input type='hidden' name='userid' value='"
	   										+ $(this).attr(
	   												"href")
	   										+ "'>");
	   						actionForm.attr("action",
	   								"/front/basket");
	   						actionForm.submit();
	   					});

	   			$(".wish_move")
	   			.on(
	   					"click",
	   					function(e) {
	   						e.preventDefault();
	   						actionForm
	   								.append("<input type='hidden' name='userid' value='"
	   										+ $(this).attr(
	   												"href")
	   										+ "'>");
	   						actionForm.attr("action",
	   								"/front/wish_list");
	   						actionForm.submit();
	   					});
	   			
	   			
	   		});

	
 </script>
 </html> 