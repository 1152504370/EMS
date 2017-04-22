<!DOCTYPE HTML>
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
<title>Charging System</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- basic styles -->

<link rel="stylesheet" href="<%=path%>/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=path%>/assets/css/font-awesome.min.css" />

<!-- wtn styles -->

<link rel="stylesheet" href="<%=path%>/assets/css/wtn.min.css" />

<script type="text/javascript">
	function countDown(secs, surl) {
		var jumpTo = document.getElementById('jumpTo');
		jumpTo.innerHTML = secs;
		if (--secs > 0) {
			setTimeout("countDown(" + secs + ",'" + surl + "')", 1000);
		} else {
			window.top.location.href = surl;
		}
	}
</script>
<style type="text/css">
.top-bar {
	margin-top: 20px;
}
</style>
</head>

<body>
	<div>
		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->

				<div class="error-container">
					<div class="well">

						<div class="space"></div>

						<div class="form-group">
							<h4 class="red">
								<b>登陆过期</b>
							</h4>
						</div>
						<div class="form-group">
							对不起，您的登陆已经过期。 <span id="jumpTo">5</span>秒后系统会自动跳转登陆页面，也可<a
								href="<%=request.getContextPath()%>" target="_top">点击本处直接跳转</a>
						</div>

						<div class="space"></div>


					</div>
				</div>
				<!-- PAGE CONTENT ENDS -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.main-content -->

	<script type="text/javascript">
		countDown(5,'<%=request.getContextPath()%>
		');
	</script>
</body>
</html>
