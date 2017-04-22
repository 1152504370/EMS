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
				
						<div class="space"></div>
						
						<h1 class="grey lighter smaller">
							<span class="green bigger-125"> <i class="icon-leaf"></i>
								欢迎您
							</span>
							<s:property value="#session.username" />
							<s:if test="#session.type==1">同学</s:if>
							<s:if test="#session.type==2">管理员大人</s:if>
						</h1>

						<h3 class="lighter smaller">
							<i class="icon-calendar"></i> 今天是 <%
								java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat(
										"yyyy年MM月dd日 E");
								java.util.Date currentTime = new java.util.Date();
								out.print(formatter.format(currentTime));
							%>
						</h3>

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

</body>
</html>
