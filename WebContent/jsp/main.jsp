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
<title>Employment Manage System</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- basic styles -->
<link href="<%=path%>/assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="<%=path%>/assets/css/font-awesome.min.css" rel="stylesheet" />

<!-- wtn styles -->
<link rel="stylesheet" href="<%=path%>/assets/css/wtn.min.css" />
<link rel="stylesheet" href="<%=path%>/assets/css/wtn-rtl.min.css" />
<link rel="stylesheet" href="<%=path%>/assets/css/wtn-skins.min.css" />

<!-- basic scripts #header..# -->
<script src="<%=path%>/assets/js/jquery-2.0.3.min.js"></script>
<script src="<%=path%>/assets/js/bootstrap.min.js"></script>
<script src="<%=path%>/assets/js/typeahead-bs2.min.js"></script>

<!-- wtn scripts -->
<script src="<%=path%>/assets/js/wtn-extra.min.js"></script>
<script src="<%=path%>/assets/js/wtn-elements.min.js"></script>
<script src="<%=path%>/assets/js/wtn.min.js"></script>

<style type="text/css">
iframe {
	margin: 0px 0px;
	width: 100%;
	height: 100%;
}

.page-body.page-fixed-max {
	left: 0px;
	margin-top: 40px; //
	height: 100%;
	left: 0;
	overflow: auto;
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 99999;
}
</style>
<script type="text/javascript">
	function exit() {
		if (confirm("确定要退出吗？")) {
			window.location.href = "login!exit.action";
		}
	}
</script>
</head>
<body>
	<!-- Header -->
	<div class="navbar navbar-default" id="navbar">
		<script type="text/javascript">
			try {
				wtn.settings.check('navbar', 'fixed')
			} catch (e) {
			}
		</script>

		<div class="navbar-container" id="navbar-container">
			<div class="navbar-header pull-left">
				<a href="#" class="navbar-brand"> <small> <i
						class="icon-leaf"></i> Employment Manage System
				</small>
				</a>
			</div>
			<div class="navbar-header pull-right">
				<ul class="nav ace-nav">
					<li class="light-blue"><a data-toggle="dropdown" href="#"
						class="dropdown-toggle"> <img class="nav-user-photo"
							src="img/admin.jpg" /> <s:property value="#session.username" />
							<i class="icon-caret-down"></i>
					</a>

						<ul
							class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
							<li><a href="#"> <i class="icon-cog"></i> 设置
							</a></li>

							<li>
							<a href='<s:if test="#session.type==1">usereditme!toeditme.action</s:if><s:if test="#session.type==2">usereditme!toeditme.action</s:if>' target="iframe"> 
							<i class="icon-user"></i> 个人资料
							</a></li>

							<li class="divider"></li>

							<li><a href="javascript:exit();"> <i class="icon-off"></i>
									退出
							</a></li>
						</ul></li>
				</ul>

			</div>
			<!-- /Account Area and Settings -->
		</div>
		<!-- /.container -->
	</div>
	<!-- Header -->

	<!-- 外围框架 -->
	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				wtn.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>

		<!-- Page Main-container-inner -->
		<div class="main-container-inner">
			<a class="menu-toggler" id="menu-toggler" href="#"> <span
				class="menu-text"></span>
			</a>

			<!-- Page Sidebar -->
			<div class="sidebar" id="sidebar">
				<script type="text/javascript">
					try {
						wtn.settings.check('sidebar', 'fixed')
					} catch (e) {
					}
				</script>

				<!-- Page Sidebar Header-->
				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						<button class="btn btn-success">
							<i class="icon-signal"></i>
						</button>

						<button class="btn btn-info">
							<i class="icon-pencil"></i>
						</button>

						<button class="btn btn-warning">
							<i class="icon-group"></i>
						</button>

						<button class="btn btn-danger">
							<i class="icon-cogs"></i>
						</button>
					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span> <span class="btn btn-info"></span>

						<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
					</div>
				</div>
				<!-- /Page Sidebar Header -->

				<!-- Sidebar Menu -->
				<ul class="nav nav-list">
				<!-- 学生菜单 -->
				<s:if test="type==1">
				
							<li class="aaaa">
									<a href='<s:property value="#menu.menu_url"/>'
										class="dropdown-toggle"> <i
										class='menu-icon '></i><i class="icon-user"></i> <span
										class="menu-text"> 个人 中心</span>
										<i class="menu-expand"></i> <b class="arrow icon-angle-down"></b>
									</a>
									<ul class="submenu">
												<li>
															<a
																href="usereditme!toeditme.action"
																target="iframe" class="z-menu"
																ref-nav='<s:property value="#menu.menu_name"/>|<s:property value="#item.menu_name"/>'>
																<i class="icon-double-angle-right"></i> <span
																class="menu-text">修改密码</span>
															</a>
															<a
																href='studenteditme!toeditme.action'
																target="iframe" class="z-menu"
																ref-nav='<s:property value="#menu.menu_name"/>|<s:property value="#item.menu_name"/>'>
																<i class="icon-double-angle-right"></i> <span
																class="menu-text">个人信息管理</span>
															</a>
															</li>
									</ul>
									<a href=''
										class="dropdown-toggle"> <i
										class='menu-icon '></i><i class="icon-list"></i> <span
										class="menu-text"> 企业中心</span>
										<i class="menu-expand"></i> <b class="arrow icon-angle-down"></b>
									</a>
									<ul class="submenu">
												<li>
															<a
																href="company!list.action"
																target="iframe" class="z-menu"
																ref-nav='<s:property value="#menu.menu_name"/>|<s:property value="#item.menu_name"/>'>
																<i class="icon-double-angle-right"></i> <span
																class="menu-text">企业信息查询</span>
															</a>
															</li>
									</ul>
									<a href=''
										class="dropdown-toggle"> <i
										class='menu-icon '></i><i class="icon-list"></i> <span
										class="menu-text"> 招聘中心</span>
										<i class="menu-expand"></i> <b class="arrow icon-angle-down"></b>
									</a>
									<ul class="submenu">
												<li>
															<a
																href="recruit!list.action"
																target="iframe" class="z-menu"
																ref-nav='<s:property value="#menu.menu_name"/>|<s:property value="#item.menu_name"/>'>
																<i class="icon-double-angle-right"></i> <span
																class="menu-text">招聘信息查询</span>
															</a>
															<a
																href='recruitme!listMy.action'
																target="iframe" class="z-menu"
																ref-nav='<s:property value="#menu.menu_name"/>|<s:property value="#item.menu_name"/>'>
																<i class="icon-double-angle-right"></i> <span
																class="menu-text">我的求职申请</span>
															</a>
															</li>
									</ul>
									<a href=''
										class="dropdown-toggle"> <i
										class='menu-icon '></i><i class="icon-cog"></i> <span
										class="menu-text"> 其他</span>
										<i class="menu-expand"></i> <b class="arrow icon-angle-down"></b>
									</a>
									<ul class="submenu">
												<li>
															<a
																href="aboutSystem.action"
																target="iframe" class="z-menu"
																ref-nav='<s:property value="#menu.menu_name"/>|<s:property value="#item.menu_name"/>'>
																<i class="icon-double-angle-right"></i> <span
																class="menu-text">关于系统</span>
															</a>
															</li>
									</ul>
								</li>
</s:if>
				<!-- 管理员菜单 -->
				<s:if test="type==2">
				
							<li class="aaaa">
									<a href=''
										class="dropdown-toggle"> <i
										class='menu-icon '></i><i class="icon-user"></i> <span
										class="menu-text"> 账户管理</span>
										<i class="menu-expand"></i> <b class="arrow icon-angle-down"></b>
									</a>
									<ul class="submenu">
												<li>
															<a
																href="user!list.action"
																target="iframe" class="z-menu"
																ref-nav='<s:property value="#menu.menu_name"/>|<s:property value="#item.menu_name"/>'>
																<i class="icon-double-angle-right"></i> <span
																class="menu-text">用户信息管理</span>
															</a>
															<a
																href="useredit!toedit.action"
																target="iframe" class="z-menu"
																ref-nav='<s:property value="#menu.menu_name"/>|<s:property value="#item.menu_name"/>'>
																<i class="icon-double-angle-right"></i> <span
																class="menu-text">添加用户</span>
															</a>
									</ul>
									<a href=''
										class="dropdown-toggle"> <i
										class='menu-icon '></i><i class="icon-pencil"></i> <span
										class="menu-text"> 学生信息管理</span>
										<i class="menu-expand"></i> <b class="arrow icon-angle-down"></b>
									</a>
									<ul class="submenu">
												<li>
															<a
																href="student!list.action"
																target="iframe" class="z-menu"
																ref-nav='<s:property value="#menu.menu_name"/>|<s:property value="#item.menu_name"/>'>
																<i class="icon-double-angle-right"></i> <span
																class="menu-text">查询学生信息</span>
															</a>
															<a
																href="studentedit!toedit.action"
																target="iframe" class="z-menu"
																ref-nav='<s:property value="#menu.menu_name"/>|<s:property value="#item.menu_name"/>'>
																<i class="icon-double-angle-right"></i> <span
																class="menu-text">添加学生信息</span>
															</a>
															</li>
									</ul>
									<a href=''
										class="dropdown-toggle"> <i
										class='menu-icon '></i><i class="icon-list"></i> <span
										class="menu-text"> 企业中心</span>
										<i class="menu-expand"></i> <b class="arrow icon-angle-down"></b>
									</a>
									<ul class="submenu">
												<li>
															<a
																href="company!list.action"
																target="iframe" class="z-menu"
																ref-nav='<s:property value="#menu.menu_name"/>|<s:property value="#item.menu_name"/>'>
																<i class="icon-double-angle-right"></i> <span
																class="menu-text">企业信息查询</span>
															</a>
															<a
																href="companyedit!toedit.action"
																target="iframe" class="z-menu"
																ref-nav='<s:property value="#menu.menu_name"/>|<s:property value="#item.menu_name"/>'>
																<i class="icon-double-angle-right"></i> <span
																class="menu-text">添加企业信息</span>
															</a>
															</li>
									</ul>
									<a href=''
										class="dropdown-toggle"> <i
										class='menu-icon '></i><i class="icon-list"></i> <span
										class="menu-text"> 招聘中心</span>
										<i class="menu-expand"></i> <b class="arrow icon-angle-down"></b>
									</a>
									<ul class="submenu">
												<li>
															<a
																href="recruit!list.action"
																target="iframe" class="z-menu"
																ref-nav='<s:property value="#menu.menu_name"/>|<s:property value="#item.menu_name"/>'>
																<i class="icon-double-angle-right"></i> <span
																class="menu-text">招聘信息查询</span>
															</a>
															<a
																href='recruitedit!toedit.action'
																target="iframe" class="z-menu"
																ref-nav='<s:property value="#menu.menu_name"/>|<s:property value="#item.menu_name"/>'>
																<i class="icon-double-angle-right"></i> <span
																class="menu-text">添加招聘信息</span>
															</a>
															<a
																href='recruitapply!listapply.action'
																target="iframe" class="z-menu"
																ref-nav='<s:property value="#menu.menu_name"/>|<s:property value="#item.menu_name"/>'>
																<i class="icon-double-angle-right"></i> <span
																class="menu-text">管理应聘</span>
															</a>
															</li>
									</ul>
									<a href=''
										class="dropdown-toggle"> <i
										class='menu-icon '></i><i class="icon-cog"></i> <span
										class="menu-text"> 其他</span>
										<i class="menu-expand"></i> <b class="arrow icon-angle-down"></b>
									</a>
									<ul class="submenu">
												<li>
															<a
																href="aboutSystem!show.action"
																target="iframe" class="z-menu"
																ref-nav='<s:property value="#menu.menu_name"/>|<s:property value="#item.menu_name"/>'>
																<i class="icon-double-angle-right"></i> <span
																class="menu-text">关于系统</span>
															</a>
									</ul>
								</li>
</s:if>
				</ul>
				<!-- /Sidebar Menu -->
				<!-- 缩进   -->
				<div class="sidebar-collapse" id="sidebar-collapse">
					<i class="icon-double-angle-left"
						data-icon1="icon-double-angle-left"
						data-icon2="icon-double-angle-right"></i>
				</div>
				<script type="text/javascript">
					try {
						wtn.settings.check('sidebar', 'collapsed')
					} catch (e) {
					}
				</script>
			</div>
			<!-- /Page Sidebar -->

			<!-- Page Content -->
			<div class="main-content">
				<!-- Page Header -->
				<div class="breadcrumbs" id="breadcrumbs">
					<script type="text/javascript">
						try {
							wtn.settings.check('breadcrumbs', 'fixed')
						} catch (e) {
						}
					</script>

					<ul class="breadcrumb">
						<li><i class="icon-home home-icon"></i> <span id="page-title">
								<strong> Welcome to use Employment Manage System (v1.0) </strong>
						</span></li>
					</ul>

					<!--Header Buttons-->
					<div class="nav-search" id="nav-search">
						<div>
							<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">		
								<button class="btn btn-info" id="refresh-iframe-toggler">
									<i class="icon-refresh"></i>
								</button>				
							</div>
						</div>
					</div>
					<!--Header Buttons End-->

				</div>
				<!-- /Page Header -->

				<!-- Page Body -->
				<div class="page-body" style="height:900px;" id="page-body">
					<iframe frameborder=0 src="firstpage.action" name="iframe"
						id="iframe"></iframe>
				</div>
				<!-- /Page Body -->
			</div>
			<!-- /Page Content -->

			<div class="ace-settings-container" id="ace-settings-container">
				<div class="btn btn-app btn-xs btn-warning ace-settings-btn"
					id="ace-settings-btn">
					<i class="icon-cog bigger-150"></i>
				</div>

				<div class="ace-settings-box" id="ace-settings-box">
					<div>
						<div class="pull-left">
							<select id="skin-colorpicker" class="hide">
								<option data-skin="default" value="#438EB9">#438EB9</option>
								<option data-skin="skin-1" value="#222A2D">#222A2D</option>
								<option data-skin="skin-2" value="#C6487E">#C6487E</option>
								<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
							</select>
						</div>
						<span>&nbsp; 选择皮肤</span>
					</div>

					<div>
						<input type="checkbox" class="ace ace-checkbox-2"
							id="ace-settings-navbar" /> <label class="lbl"
							for="ace-settings-navbar"> 固定导航条</label>
					</div>
					<div>
						<input type="checkbox" class="ace ace-checkbox-2"
							id="ace-settings-sidebar" /> <label class="lbl"
							for="ace-settings-sidebar"> 固定菜单栏</label>
					</div>
					<div>
						<input type="checkbox" class="ace ace-checkbox-2"
							id="ace-settings-breadcrumbs" /> <label class="lbl"
							for="ace-settings-breadcrumbs"> 固定标题栏</label>
					</div>
				</div>
			</div>
			<!-- /#ace-settings-container -->
		</div>
		<!-- /.main-container-inner -->

		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="icon-double-angle-up icon-only bigger-110"></i>
		</a>
	</div>
	<div class="navbar navbar-default">
	<center style="font-size:20px;color:#ffffff;font-family=微软雅黑">
	感谢您的使用 如有问题请<a href="mailto:1152504370@qq.com" style="color:#ffffff">联系我</a>
	</center>
	</div>
	<!-- /外围框架 -->

	<script>
		$("#refresh-iframe-toggler").on(
				"click",
				function() {
					document.getElementById('iframe').contentWindow.location
							.reload(true);
				});

		$(".z-menu").on("click", function() {
			var t = $(this).attr("ref-nav"), html = "";

			var s = t.split("|");

			for (var i = 0; i < s.length; i++) {
				if (i == s.length - 1)
					html += '<span class="themeprimary">' + s[i] + '</span>';
				else
					html += s[i] + ' <i class="icon-double-angle-right"></i> ';
			}

			$("#page-title").html(html);
			$(".z-menu").find("i").removeClass("themeprimary");
			$(this).find("i").addClass("themeprimary");

			$(".z-menu").find("span").removeClass("themeprimary");
			$(this).find("span").addClass("themeprimary");

		});
	</script>
</body>
</html>

