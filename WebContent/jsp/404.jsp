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

<script src="<%=path%>/assets/js/jquery-2.0.3.min.js"></script>
<script src="<%=path%>/assets/js/bootstrap.min.js"></script>
</head>
<body>
	<div>
		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->

				<div class="error-container">
					<div class="well">
						<h1 class="grey lighter smaller">
							<span class="blue bigger-125"> <i class="icon-sitemap"></i>
								404
							</span> Page Not Found
						</h1>

						<hr />
						<h3 class="lighter smaller">We looked everywhere but we
							couldn't find it!</h3>

						<div>
							<form class="form-search">
								<span class="input-icon align-middle"> <i
									class="icon-search"></i> <input type="text"
									class="search-query" placeholder="Give it a search..." />
								</span>
								<button class="btn btn-sm" onclick="return false;">Go!</button>
							</form>

							<div class="space"></div>
							<h4 class="smaller">Try one of the following:</h4>

							<ul class="list-unstyled spaced inline bigger-110 margin-15">
								<li><i class="icon-hand-right blue"></i> Re-check the url
									for typos</li>

								<li><i class="icon-hand-right blue"></i> Read the faq</li>

								<li><i class="icon-hand-right blue"></i> Tell us about it</li>
							</ul>
						</div>

						<hr />
						<div class="space"></div>

						<div class="center">
							<button onclick="history.go(-1);" class="btn btn-grey"> <i
								class="icon-arrow-left"></i> Go Back
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
	</div>
	<!-- /.main-content -->

</body>
</html>
