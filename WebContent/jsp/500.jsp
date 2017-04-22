<!DOCTYPE HTML>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

</head>

<body>
	<div class="row">
		<div class="col-xs-12">
			<div class="error-container">
				<div class="well">
					<h1 class="grey lighter smaller">
						<span class="blue bigger-125"> <i class="icon-random"></i>
							500
						</span> Something Went Wrong
					</h1>

					<hr />
					<h3 class="lighter smaller">
						But we are working <i
							class="icon-wrench icon-animated-wrench bigger-125"></i> on it!
					</h3>

					<div class="space"></div>

					<div>
						<h4 class="lighter smaller">Meanwhile, try one of the
							following:</h4>

						<ul class="list-unstyled spaced inline bigger-110 margin-15">
							<li><i class="icon-hand-right blue"></i> Read the faq</li>

							<li><i class="icon-hand-right blue"></i> Give us more info
								on how this specific error occurred!</li>
						</ul>
					</div>

					<hr />
					<div class="space"></div>

					<div class="center">
						<button onclick="history.go(-1);" class="btn btn-grey"> <i class="icon-arrow-left"></i>
							Go Back
						</button> <button onclick="#" class="btn btn-primary"> <i
							class="icon-dashboard"></i> Dashboard
						</button>
					</div>
				</div>
			</div>
			<!-- PAGE CONTENT ENDS -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
</body>
</html>
