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


<!-- datetime -->

<link rel="stylesheet" href="<%=path%>/assets/css/daterangepicker.css" />

<script src="<%=path%>/assets/js/datetime/moment.js"></script>
<script src="<%=path%>/assets/js/datetime/daterangepicker.js"></script>

<script type="text/javascript">
	function search() {
		var obj = document.forms[0];
		document.forms[0].pageNo.value = 1;
		obj.submit();
	}
</script>
<body>
	<div class="page-content">
		<form class="form" action="operationLog!show.action" method="post">
			<s:hidden name="pageNo" id="pageNo" />
			<input type="hidden" name="begin_time" id="begin_time"
				value='<s:property value="begin_time"/>'> <input
				type="hidden" name="end_time" id="end_time"
				value='<s:property value="end_time"/>'>

			<div class="form-group">
				<label class="col-sm-1 control-label align-left">操作人员</label>
				<div class="col-sm-2 no-padding-horizontal">
					<input name="name" value="<s:property value="name" />" type="text"
						class="form-control input-sm" id="name">
				</div>
				<label class="col-sm-1 control-label align-left">操作时间 </label>
				<div class="col-sm-3 no-padding-horizontal">
					<div class="controls ">
						<div class="input-group no-padding-horizontal ">
							<span class="input-group-addon"> <i class="icon-calendar"></i>
							</span> <input type="text" class="form-control col-sm-10 input-sm"
								id="reservation" />
						</div>
					</div>
				</div>
				<label class="col-sm-1 control-label align-left">操作內容</label>
				<div class="col-sm-2 no-padding-horizontal">
					<input name="content" value="<s:property value="content" />"
						type="text" class="form-control input-sm" id="content">
				</div>
				<div class="col-sm-2 text-right">
					<button onclick="searsh();" class="btn btn-info btn-sm">
						<i class="icon-search bigger-110"></i>搜索
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
						class="table table-striped table-bordered table-hover table-condensed">
						<thead>
							<tr>
								<th>模块编号</th>
								<th>模块名称</th>
								<th>操作情况</th>
								<th>操作时间</th>
								<th>操作账号</th>
								<th>操作人员</th>
								<th>操作IP</th>

							</tr>
						</thead>
						<s:iterator value="page.resultList" id="org" status="st">
							<tbody>
								<tr>
									<td><a href="#"><s:property value="#org.MENUID" /></a></td>
									<td><s:property value="#org.MENU_NAME" /></td>
									<td><s:property value="#org.CONTENT" /></td>
									<td><s:property value="#org.TIME" /></td>
									<td><s:property value="#org.USERNAME" /></td>
									<td><s:property value="#org.NAME" /></td>
									<td><s:property value="#org.IP" /></td>

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


<script type="text/javascript">
	document.getElementById("reservation").value = $("#begin_time").val()
			+ " - " + $("#end_time").val();
	//--Bootstrap Date Range Picker--

	$('#reservation').daterangepicker(
			{
				maxDate : moment(),
				format : 'YYYY-MM-DD',
				locale : {
					applyLabel : '确定',
					cancelLabel : '取消',
					fromLabel : '起始时间',
					toLabel : '结束时间',
					customRangeLabel : '自定义',
					daysOfWeek : [ '日', '一', '二', '三', '四', '五', '六' ],
					monthNames : [ '一月', '二月', '三月', '四月', '五月', '六月', '七月',
							'八月', '九月', '十月', '十一月', '十二月' ],
					firstDay : 1
				}
			}, function(start, end, lable) {
				$("#begin_time").val(start.format('YYYY-MM-DD'));
				$("#end_time").val(end.format('YYYY-MM-DD'));
			});
</script>
</html>
