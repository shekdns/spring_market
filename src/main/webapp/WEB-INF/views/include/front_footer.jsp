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
    


</body>
 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>  
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
 <script src="/resources/js/custom.js"></script>
 <script>
 
	 $("#login_btn").on("click", function(e){
		      
		      var p_id = $("#id").val();
			  var p_pw = $("#pass").val();
				
		  if(p_id == "" || p_pw == ""){
		
		  	 alert("id 또는 pw를 입력해주세요 !! ");
				 window.history.back();
		
		  	}else{  
			      $("form").submit();
				}
					
		   
	});

 </script>
 </html> 