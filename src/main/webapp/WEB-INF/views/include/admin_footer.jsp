<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
           <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal2 fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="/logout">Logout</a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 쿠폰 생성 Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">쿠폰 생성</h4>
				</div>
				<div class="modal-body">
					<form action="/create_coupon" method="post" role="form" enctype="multipart/form-data">
						
						<div class="form-group">
			                <label>쿠폰 이름</label> 
			                <input class="form-control" name='c_cp_name' value=''>
						</div>    
						  
						<div class="form-group">
							<label>설명</label> 
							<input class="form-control" name='c_cp_content' value=''>
						</div>
								
						<div class="form-group">
							<label>타입</label> 
							<select class="form-control" name="c_cp_type">
				      				<option value="기본">기본</option>
				      				<option value="신규">신규</option>
				      				<option value="감사">감사</option>
				          	</select>
						</div>
						
						<div class="form-group">
							<label>할인율</label> 
							<select class="form-control" name="c_cp_type">
				      				<option value="1000">1000할인</option>
				      				<option value="2000">2000할인</option>
				      				<option value="3000">3000할인</option>
				          	</select>
						</div>
						
						<div class="form-group">
							<div class="fileDrop">
								<br/>
								<br/>
								<p class="text-center"><i class="fa fa-paperclip"></i> 첨부파일을 드래그 해주세요.</p>
							</div>
						</div>
						
						<div class="box-footer">
							<ul class="mailbox-attachments clearfix uploadedFileList"></ul>
						</div>
						
						
					</form>
				</div>
				
				<div class="modal-footer">

					<button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
        <!-- /.modal-dialog -->
	</div>
	<!-- 쿠폰생성 모달 modal -->
    
    
    

    <!-- Bootstrap core JavaScript-->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>  
 	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

    <!-- Core plugin JavaScript-->
    <!-- <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script> -->

    <!-- Custom scripts for all pages-->
    <script src="/resources/admin_js/sb-admin-2.min.js"></script>


</body>

</html>