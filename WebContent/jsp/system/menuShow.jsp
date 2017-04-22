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
		obj.action = "menu!add.action";
		obj.submit();
	}

	function del(menuid) {
		if (confirm("确定要删除菜单（" + menuid + "）吗？")) {
			var obj = document.forms[0];
			obj.action = "menu!delete.action?menuID=" + menuid;
			obj.submit();
		}
	}
	
	function modify(menuid) {
		var obj = document.forms[0];
		obj.action = "menu!modify.action?menuID=" + menuid;
		obj.submit();
	}
</script>
<body>
	<div class="page-content">
		<form class="form" action="menu!show.action" method="post">
			<s:hidden name="pageNo" id="pageNo" />
			<div class="form-group">
				<label class="col-sm-1 control-label align-left">查询条件</label>
				<div class="col-sm-2 no-padding-horizontal">
					<input name="queryStr" value="<s:property value="queryStr" />"
						type="text" class="form-control input-sm" id="queryStr"
						placeholder="菜单编号或名称">
				</div>
				<label class="col-sm-1 control-label align-left">菜单级别</label>
				<div class="col-sm-1 no-padding-horizontal">
					<input name="queryLevel" value="<s:property value="queryLevel" />"
						type="text" class="form-control input-sm" id="queryLevel"
						placeholder="菜单级别">
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
								<th>菜单编号</th>
								<th>上级菜单</th>
								<th>菜单名称</th>
								<th>菜单路径</th>
								<th>菜单级别</th>
								<th>菜单图标</th>
								<th>菜单顺序</th>
								<th class="text-center">操作</th>
							</tr>
						</thead>
						<s:iterator value="page.resultList" id="org" status="st">
							<tbody>
								<tr>
									<td class="center"><label> <input type="checkbox"
											class="ace" /> <span class="lbl"></span>
									</label></td>

									<td><a href="#"><s:property value="#org.MENUID" /></a></td>
									<td><s:property value="#org.SUPERID" /></td>
									<td><s:property value="#org.MENU_NAME" /></td>
									<td><s:property value="#org.MENU_URL" /></td>
									<td><s:property value="#org.MENU_LEVEL" /></td>
									<td><s:property value="#org.MENU_LOGO" /></td>
									<td><s:property value="#org.MENU_ORDER" /></td>
									<td class="text-center">
										<div
											class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
											<a class="green" href="javascript:modify('${org.MENUID}')"> <i
												class="icon-edit bigger-130"></i>
											</a> <a class="red" href="javascript:del('${org.MENUID}')"> <i
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
