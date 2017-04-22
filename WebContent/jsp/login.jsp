<!DOCTYPE html>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<title>Employment Manage System</title>
<jsp:directive.page import="java.net.URLDecoder" />
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- basic styles -->

<link rel="stylesheet" href="<%=path%>/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=path%>/assets/css/font-awesome.min.css" />

<!-- wtn styles -->
<script type="text/javascript" src="<%=path%>/assets/js/jquery-2.0.3.min.js"></script>
<link rel="stylesheet" href="<%=path%>/assets/css/wtn.min.css" />

<%
	String username = "";
	Cookie[] cs = request.getCookies();
	if (cs != null) {
		String temp;
		int i = 0;
		while (i < cs.length) {
			if ("adminlogin".equals(cs[i].getName())) {
				temp = cs[i].getValue();
				if (temp != null) {
					username = URLDecoder.decode(temp);
				}
				break;
			}
			i++;
		}
	}
%>
<script>
$(function(){
	if(self!=top){  
	    parent.window.location.replace("login!exit.action");  
	} 
});
	function checkLogin() {
		if ($.trim($('#username').val()) == '') {
			alert("用户名不能为空");
			return false;
		}
		if ($.trim($('#password').val()) == '') {
			alert("密码不能为空");
			document.getElementById("password").focus();
			return false;
		}
		var username=$("#username").val();
		var password=$("#password").val();
		$("#loginform").submit();
		/*
		document.forms[0].submit();
		*/
	}
</script>
</head>

<body class="login-layout" style="background: #000000">
	<div class="main-container">
		<div class="main-content">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="login-container">
						<div class="center">
							<h1>
								<i class="icon-leaf green"></i> <span class="red">Employment Manage</span>
								<span class="white">System</span>
							</h1>
							<h4 class="blue">&copy; Qdu</h4>
						</div>

						<div class="space-6"></div>

						<div class="position-relative">
							<div id="login-box"
								class="login-box visible widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header blue lighter bigger">
											<i class="icon-coffee green"></i> Please Enter Your
											Information
										</h4>

										<div class="space-6"></div>

										<form name="check" id="loginform" action="login!login.action"  method="post">
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														name="username" id="username" type="text"
														class="form-control" placeholder="Username" /> <i
														class="icon-user"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														name="password" id="password" type="password"
														class="form-control" placeholder="Password" /> <i
														class="icon-lock"></i>
												</span>
												</label>

												<div class="space"></div>

												<div class="loginbox-submit">
													<label class="inline"> <input type="checkbox"
														class="ace" /> <span class="lbl"> Remember Me</span>
													</label>
													<button type="button"
														class="width-35 pull-right btn btn-sm btn-primary"
														onclick="return checkLogin();">
														<i class="icon-key"></i> Login
													</button>

												</div>
												<div class="loginbox-submit">
													<div id="err-box" class="alert alert-warning"
														style="display:none">
														<button class="close" data-dismiss="alert">×</button>
														<i class="fa-fw fa fa-times"></i> <strong>错误!</strong> <strong>错误!</strong>
														<s:property value="errorcontent" />
													</div>
												</div>

												<div class="space-4"></div>
											</fieldset>
										</form>

										<div class="social-or-login center">
											<span class="bigger-110">Welcome to China</span>
										</div>

										<div class="social-login center">
											<a class="btn btn-primary"> <i class="icon-facebook"></i>
											</a> <a class="btn btn-info"> <i class="icon-twitter"></i>
											</a> <a class="btn btn-danger"> <i class="icon-google-plus"></i>
											</a>
										</div>
									</div>
									<!-- /widget-main -->

									<div class="toolbar clearfix">
										<div>
											<a href="http://www.qdu.edu.cn//" target="_blank"
												class="forgot-password-link"> <i class="icon-arrow-left"></i>
												Qdu information
											</a>
										</div>

										<div>
											<a href="#" onclick="show_box('author-box'); return false;"
												class="user-signup-link"> Author information <i
												class="icon-arrow-right"></i>
											</a>
										</div>
									</div>
								</div>
								<!-- /widget-body -->
							</div>
							<!-- /login-box -->

							<div id="author-box" class="signup-box widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header green lighter bigger">
											<i class="icon-group blue"></i> Author Information
										</h4>

										<div class="space-6"></div>
										<div class="profile-user-info">
											<div class="profile-info-row">
												<div class="profile-info-name">Username</div>

												<div class="profile-info-value">
													<span>wtn</span>
												</div>
											</div>
											<div class="profile-info-row">
												<div class="profile-info-name">Location</div>

												<div class="profile-info-value">
													<i class="icon-map-marker light-orange bigger-110"></i> <span>China</span>
												</div>
											</div>
											<div class="profile-info-row">
												<div class="profile-info-name">Age</div>

												<div class="profile-info-value">
													<span>23</span>
												</div>
											</div>

											<div class="profile-info-row">
												<div class="profile-info-name">Email</div>

												<div class="profile-info-value">
													<span>1152504370@qq.com</span>
												</div>
											</div>
											<div class="profile-info-row">
												<div class="profile-info-name">About Me</div>

												<div class="profile-info-value">
													<span>I will graduate from QD University.</span>
												</div>
											</div>
										</div>


									</div>

									<div class="toolbar center">
										<a href="#" onclick="show_box('login-box'); return false;"
											class="back-to-login-link"> <i class="icon-arrow-left"></i>
											Back to login
										</a>
									</div>
								</div>
								<!-- /widget-body -->
							</div>
							<!-- /signup-box -->
						</div>
						<!-- /position-relative -->
					</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->

	<script src="<%=path%>/assets/js/jquery-2.0.3.min.js"></script>

	<!-- inline scripts related to this page -->

	<script type="text/javascript">
		function show_box(id) {
			jQuery('.widget-box.visible').removeClass('visible');
			jQuery('#' + id).addClass('visible');
		}
	</script>
	<s:if test="errorcontent!=null && errorcontent!=''">
		<script type="text/javascript">
			$("#err-box").fadeIn();
			setTimeout(function() {
				$("#err-box").fadeOut();
			}, 5000);
		</script>
	</s:if>

</body>
</html>
