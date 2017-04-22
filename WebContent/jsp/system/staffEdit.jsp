<%@page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<title>Charging System</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- basic styles -->
<link href="<%=path%>/assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="<%=path%>/assets/css/font-awesome.min.css" rel="stylesheet" />

<!-- zcb styles -->
<link rel="stylesheet" href="<%=path%>/assets/css/zcb.min.css" />
<link rel="stylesheet" href="<%=path%>/assets/css/zcb-rtl.min.css" />

<!-- basic scripts #header..# -->
<script src="<%=path%>/assets/js/jquery-2.0.3.min.js"></script>
<script src="<%=path%>/assets/js/bootstrap.min.js"></script>
<script src="<%=path%>/assets/js/typeahead-bs2.min.js"></script>

<!-- zcb scripts -->
<script src="<%=path%>/assets/js/zcb-extra.min.js"></script>
<script src="<%=path%>/assets/js/zcb-elements.min.js"></script>
<script src="<%=path%>/assets/js/zcb.min.js"></script>

<script type="text/javascript">
	$(function() {
		if ($("#msg").val() == "0") {
			Notify('保存失败！该员工账号已存在！', 'top-center', '3000', 'warning',
					'fa-exclamation', true);
		} else if ($("#msg").val() == "2") {
			Notify('保存失败！', 'top-center', '3000', 'danger', 'fa-exclamation',
					true);
		} else if ($("#msg").val() == "1") {
			Notify('保存成功！', 'top-center', '3000', 'success', 'fa-check', true);
		}
		$("#msg").val("");
	});

	function saveValidate() {
		$(".validate-hit").addClass("display-none");
		if ($("#id").val() == "") {
			$("#idI").removeClass("display-none");
			$("#idHit1").removeClass("display-none");
			return false;
		}
		return true;
	}
</script>
<body>
	<div class="page-content">
		<div class="header bg-themeprimary">
			<h1 class="grey lighter smaller">
				<s:if test="oper==1">添加员工</s:if>
				<s:elseif test="oper==2">修改员工信息</s:elseif>
			</h1>
		</div>

		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
				<form class="form-horizontal" action="staff!save.action">
					<!-- 隐藏域 -->
					<s:hidden name="oper" id="oper" />
					<s:hidden name="msg" id="msg" />
					<!-- 隐藏域 -->


					<div class="form-group">
						<label class="col-sm-5 control-label no-padding-right"
							for="username"> 员工账号</label>
						<div class="col-sm-7">
							<input type="text" name="username" id="username"
								value="<s:property value="username" />" class="col-xs-10 col-sm-5" />
						</div>
					</div>

					<div class="space-4"></div>

					<div class="form-group">
						<label class="col-sm-5 control-label no-padding-right"
							for="password"> 员工密码 </label>
						<div class="col-sm-7">
							<input type="text" name="password" id="password"
								value="<s:property value="password" />"
								class="col-xs-10 col-sm-5" />
						</div>
					</div>
					
					<div class="space-4"></div>

					<div class="form-group">
						<label class="col-sm-5 control-label no-padding-right"
							for="password2"> 确认密码 </label>
						<div class="col-sm-7">
							<input type="text" name="password2" id="password2"
								value="<s:property value="password" />"
								class="col-xs-10 col-sm-5" />
						</div>
					</div>

					<div class="space-4"></div>

					<div class="form-group">
						<label class="col-sm-5 control-label no-padding-right"
							for="name"> 员工姓名</label>

						<div class="col-sm-7">
							<input type="text" name="name" id="name"
								value="<s:property value="name" />"
								class="col-xs-10 col-sm-5" />
						</div>
					</div>

					<div class="space-4"></div>

					<div class="form-group">
						<label class="col-sm-5 control-label no-padding-right"
							for="user_tel"> 手机号码 </label>

						<div class="col-sm-7">
							<input type="text" name="user_tel" id="user_tel"
								value="<s:property value="user_tel" />"
								class="col-xs-10 col-sm-5" />
						</div>
					</div>

					<div class="space-4"></div>

					<div class="form-group">
						<label class="col-sm-5 control-label no-padding-right"
							for="user_sex">员工性别</label>

						<div class="col-sm-7">
							<input type="text" name="user_sex" id="user_sex"
							 value="<s:property value="user_sex" />"
								class="col-xs-10 col-sm-5" />
						</div>
					</div>

					<div class="space-4"></div>

					<div class="form-group">
						<label class="col-sm-5 control-label no-padding-right"
							for="user_level"> 员工级别 </label>

						<div class="col-sm-7">
							<input type="text" name="user_level" id="user_level"
							 value="<s:property value="user_level" />"
								class="col-xs-10 col-sm-5" />
						</div>
					</div>

					<div class="space-4"></div>

					<div class="form-group">
						<div class="col-md-offset-4 col-md-9">
							<button class="btn btn-info" type="button"
								onclick="history.go(-1);">
								<i class="icon-arrow-left bigger-110"></i> Back
							</button>
							&nbsp; &nbsp; &nbsp;
							<button class="btn btn-info" type="submit">
								<i class="icon-ok bigger-110"></i> Submit
							</button>

							&nbsp; &nbsp; &nbsp;
							<button class="btn btn-info" type="reset">
								<i class="icon-undo bigger-110"></i> Reset
							</button>
						</div>
					</div>

					<div class="hr hr-24"></div>
				</form>
			</div>
			<!-- /PAGE CONTENT END -->
		</div>
		<!-- /row -->
	</div>
	<!-- /.page-content -->
</body>
</html>
