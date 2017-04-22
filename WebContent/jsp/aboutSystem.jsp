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

				<div class="center">
                            <h1>
                                <i class="icon-leaf green"></i> <span class="red">Employment Manage</span>
                                <span class="white">System</span>
                            </h1>
                        </div>
                <div class="center">
                <p>  十分感谢您使用高校就业管理系统(V1.0),希望本人的一些微小的工作能为您的工作生活带来便利。</p>
                <p>在使用过程中遇到任何问题，欢迎随时联系我。您可选择<a href="mailto:1152504370@qq.com">发邮件给我</a>，或者<a href="tel:15712704759">拨打</a>我的电话15712704859.</p>
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
