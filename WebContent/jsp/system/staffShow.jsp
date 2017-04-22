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
	function search() {
		var obj = document.forms[0];
		document.forms[0].pageNo.value = 1;
		obj.submit();
	}

	function add() {
		var obj = document.forms[0];
		obj.action = "staff!add.action";
		obj.submit();
	}

	function del(username) {
		if (confirm("确定要删除员工（" + username + "）吗？")) {
			var obj = document.forms[0];
			obj.action = "staff!delete.action?username=" + username;
			obj.submit();
		}
	}

	function modify(menuid) {
		var obj = document.forms[0];
		obj.action = "staff!modify.action?username=" + username;
		obj.submit();
	}
</script>
<body>
	<div class="page-content">
		<form class="form" action="staff!show.action" method="post">
			<s:hidden name="pageNo" id="pageNo" />
			<div class="form-group">
				<label class="col-sm-1 control-label align-left">查询条件</label>
				<div class="col-sm-2 no-padding-horizontal">
					<input name="queryStr" value="<s:property value="queryStr" />"
						type="text" class="form-control input-sm" id="queryStr"
						placeholder="姓名或手机号">
				</div>
				<label class="col-sm-1 control-label">员工性别 </label>
				<div class="col-sm-1 no-padding-horizontal">
					<s:select list="#{null:'所有',1:'男',0:'女'}"
						Class="form-control input-sm" name="querySex">
					</s:select>
				</div>
				<div class="col-sm-7 text-right">
					<button onclick="searsh();" class="btn btn-info btn-sm">
						<i class="icon-search bigger-120"></i>搜索
					</button>
					<button onclick="add();" class="btn btn-info btn-sm">
						<i class="icon-plus bigger-120"></i>添加
					</button>
				</div>
			</div>
		</form>

		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
				<h3 class="header smaller lighter blue"></h3>

				<div class="table-responsive">
					<table id="sample-table-2"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class="center"><label> <input type="checkbox"
										class="ace" /> <span class="lbl"></span>
								</label></th>
								<th>员工账号</th>
								<th>员工姓名</th>
								<th>手机号码</th>
								<th>员工性别</th>
								<th>员工级别</th>
								<th class="text-center">操作</th>
							</tr>
						</thead>
						<s:iterator value="page.resultList" id="org" status="st">
							<tbody>
								<tr>
									<td class="center"><label> <input type="checkbox"
											class="ace" /> <span class="lbl"></span>
									</label></td>

									<td><a href="#"><s:property value="#org.USERNAME" /></a></td>
									<td><s:property value="#org.NAME" /></td>
									<td><s:property value="#org.USER_TEL" /></td>
									<td><s:if test="#org.USER_SEX==1">男</s:if> <s:elseif
											test="#org.USER_SEX==0">女</s:elseif></td>
									<td><s:if test="#org.USER_LEVEL==0">普通员工</s:if><s:elseif
									test="#org.USER_LEVEL==6">初级管理员</s:elseif> <s:elseif
									test="#org.USER_LEVEL==7">中级管理员</s:elseif> <s:elseif
									test="#org.USER_LEVEL==8">高级管理员</s:elseif><s:elseif
									test="#org.USER_LEVEL==9">超级管理员</s:elseif></td>

									<td class="text-center">
										<div
											class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
											<a class="green" href="#"> <i
												class="icon-edit bigger-130"></i>
											</a> <a class="red" href="#"> <i
												class="icon-trash bigger-130"></i>
											</a>
										</div>
									</td>
								</tr>

							</tbody>
						</s:iterator>
						<s:if test="page.resultList.size()==0">
							<tr>
								<td colspan="10">没有数据！</td>
							</tr>
						</s:if>
					</table>
				</div>
			</div>
		</div>
		<!-- PAGE CONTENT ENDS -->
		<!-- 分页组件 -->
		<jsp:include page="/jsp/common/page.jsp"></jsp:include>
	</div>
	<!-- /.page-content -->


</body>
</html>
