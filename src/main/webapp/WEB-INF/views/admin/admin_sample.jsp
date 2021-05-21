<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 어드민 셋팅 -->

<%@include file="../include/admin_setting.jsp"%>

</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">

 <!-- 메인 헤더 -->
	<%@include file="../include/admin_header.jsp"%>	
 <!-- 메인 헤더 -->
 <!-- 사이드 -->
 	<%@include file="../include/admin_side.jsp"%>
 <!-- 사이드 -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">쿠폰 관리</h1>
          </div><!-- /.col -->
        
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
	<div class="row">
		<div class="col-lg-12">
				<div class="card">
		              <div class="card-header">
		                <h2 class="coupon-title">
		                	쿠폰 목록
		               	</h2>
		                <div class="pull-right">
		                	<button type="button" class="btn btn-block btn-success">쿠폰 생성</button>
		                </div>
		              </div>
		              <!-- /.card-header -->
		              <div class="card-body">
		              
		              
		               </div>
				
				</div>
			</div>

	</div>


  </div>
  <!-- /.content-wrapper -->
	<%@include file="../include/admin_footer.jsp"%>
</body>
</html>
