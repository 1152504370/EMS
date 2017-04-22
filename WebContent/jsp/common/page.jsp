<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!--这个是页码输出的控件-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pagenav1.1.cn.js"></script>
<script type="text/javascript">

function setPageAction(number) {
	var obj = document.forms[0];
	document.forms[0].pageNo.value = number;
	obj.submit();
}

$(document).ready(function(){
	pageNav.go(<s:property value="page.currentPage" />, <s:property value="page.totalPages" />);
	pageNav.fn = function(p, pn) {
		setPageAction(p);
	};
	
	$("#to_page").bind('keydown', function(){
		
		if (event.keyCode == 13) {
			var s=$("#to_page").val();
			var totalPage='<s:property value="page.totalPages" />';
			if(s=="") return;
			if(s=="0") s="1";
			if(parseInt(s)>parseInt(totalPage)){
				alert('你所输入的页码已超出总页数!');
				$("#to_page").val(totalPage);
				$("#to_page").focus();
				return;
			}
			setPageAction(s);
		}
	});
});
</script>
<style type="text/css" media="screen">
div.table-paginate-row {
	padding-top: 8px;
	padding-bottom: 10px;
}

div.paginate_info {
	padding-top: 8px;
}

div.paginate_button {
    float: right;
    margin: 0;
}

</style>
<div class="row table-paginate-row">
	<div class="col-xs-6">
		<div class="paginate_info">第<input type="text" id="to_page" size="3" style="width: 30px" value='<s:property value="page.currentPage" />' onkeyup="value=value.replace(/[^\d]/g,'');"/>页 共  <span class="themeprimary"><b><s:property value="page.totalRecords" /></b></span> 条记录</div>
	</div> 
	<div class="col-xs-6">
		<div class="paginate_button" id="page-nav"></div>
	</div>
</div>