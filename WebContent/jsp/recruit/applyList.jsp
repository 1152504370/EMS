<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employment Manage System</title>

<!-- basic scripts #header..# -->
<script src="<%=path%>/assets/js/jquery-2.0.3.min.js"></script>
<script src="<%=path%>/assets/js/bootstrap.min.js"></script>
<script src="<%=path%>/assets/js/typeahead-bs2.min.js"></script>
<script src="<%=path%>/assets/layer.js"></script>
<!-- 
<script src="<%=path%>/assets/js/jquery-jbox/2.3/jquery.jBox-2.3.min.js"></script>
 -->
<!-- wtn scripts -->
<script src="<%=path%>/assets/js/wtn-extra.min.js"></script>
<script src="<%=path%>/assets/js/wtn-elements.min.js"></script>
<script src="<%=path%>/assets/js/wtn.min.js"></script>
<!-- basic styles 
-->
<link rel="stylesheet" href="<%=path%>/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=path%>/assets/css/font-awesome.min.css" />
<!-- 
 -->

<!-- wtn styles -->

<link rel="stylesheet" href="<%=path%>/assets/css/wtn.min.css" />
<style>
.jbox-content{
overflow:visible;
overflow-y:visible;
}
</style>
<script>
function openAccept(appid){
	layer.confirm('是否接受求职申请？', {icon:3,
		  btn: ['愉快的接受','让我再想想'] //按钮
		}, function(index){
         $.ajax({
             type:'POST',
             url:"jsonAjaxrecruit!dealApply.action",
             data:"appid="+appid+"&status="+1,
             dataType:'text',
             success:function(json){
                  var obj = $.parseJSON(json);  //使用这个方法解析json
                     var state_value = obj.result;  //result是和action中定义的result变量的get方法对应的
                     layer.alert(state_value, {icon: 6,
                                                 	 
                    		 btn:['确认'],
                    		 yes:function(){
                 window.location.reload();
                    		 }});
             },
             error:function(json){
                 layer.msg("操作异常", {icon: 5});
             }
         });
      }, function(){
		  layer.alert('您已放弃操作', {icon:5,
		    time: 20000, //20s后自动关闭
		    btn: ['好的']
		  });
		});
}
function openRefuse(appid){
	layer.confirm('是否拒绝求职申请？', {icon:3,
		  btn: ['残忍的拒绝','让我再想想'] //按钮
		}, function(index){
         $.ajax({
             type:'POST',
             url:"jsonAjaxrecruit!dealApply.action",
             data:"appid="+appid+"&status="+2,
             dataType:'text',
             success:function(json){
                  var obj = $.parseJSON(json);  //使用这个方法解析json
                     var state_value = obj.result;  //result是和action中定义的result变量的get方法对应的
                     layer.alert(state_value, {icon: 6,
                                                 	 
                    		 btn:['确认'],
                    		 yes:function(){
                 window.location.reload();
                    		 }});
             },
             error:function(json){
                 layer.msg("操作异常", {icon: 5});
             }
         });
      }, function(){
		  layer.alert('您已放弃操作', {icon:5,
		    time: 20000, //20s后自动关闭
		    btn: ['好的']
		  });
		});
}
function revokeApply(appid){
	layer.confirm('是否取消这个申请？', {icon:3,
		  btn: ['是的，我想好了','不，我还想再看看'] //按钮
		}, function(index){
            var params = {
            		appid:appid
                 }
         $.ajax({
             type:'POST',
             url:"jsonAjaxrecruit!revokeapp.action",
             data:params,
             dataType:'text',
             success:function(json){
                  var obj = $.parseJSON(json);  //使用这个方法解析json
                     var state_value = obj.result;  //result是和action中定义的result变量的get方法对应的
                     layer.alert(state_value, {icon: 6,
                                                 	 
                    		 btn:['确认'],
                    		 yes:function(){
                 window.location.reload();
                    		 }});
             },
             error:function(json){
                 layer.msg("操作异常", {icon: 5});
             }
         });
      }, function(){
		  layer.alert('您已放弃申请', {icon:5,
		    time: 20000, //20s后自动关闭
		    btn: ['好的']
		  });
		});
}

</script>
</head>
<body>

<form id="listForm" <s:if test="#session.type==1">action="recruit!listMy.action"</s:if>
<s:elseif test="#session.type==2">action="recruit!listapply.action"</s:elseif>  method="post">
<input type="hidden"  id="pageNo" name="pageNo" />
</form>
<!-- 
<form id="editForm" action="recruitedit!toedit.action" method="post">
<input type="hidden"  id="recid" name="recid" />
</form>
 -->
<h3 class="header smaller lighter blue"></h3>
                <div class="table-responsive">
                    <table id="sample-table-2"
                        class="table table-striped table-bordered table-hover">
                        <thead>
                             <tr>
                                <th>公司名称</th>
                                <th>招聘标题</th>
                                <th>应聘学生学号</th>
                                <th>应聘学生姓名</th>
                                <th>申请时间</th>
                                <th>状态</th>
                                <th class="text-center">操作</th>
                            </tr>
                        </thead>
                            <tbody>
                        <s:iterator value="page.resultList" id="app" status="st">
                                <tr>

                                    <td><a href="#"><s:property value="#app.COMNAME" /></a></td>
                                    <td><a href="#"><s:property value="#app.TITLE" /></a></td>
                                    <td><a href="#"><s:property value="#app.STUNUM" /></a></td>
                                    <td><a href="#"><s:property value="#app.STUNAME" /></a></td>
                                    <td><a href="#"><s:property value="#app.TIME" /></a></td>
                                    <td><a href="#">
                                             <s:if test="#app.STATUS==0">未审批</s:if>
                                             <s:elseif test="#app.STATUS==1">已被接受</s:elseif>
                                             <s:elseif test="#app.STATUS==2">已被拒绝</s:elseif>
                                        </a></td>
                                    <td class="text-center">
                                    <s:if test="#app.STATUS==0">
                                    <s:if test="#session.type==1">
                                    <button onclick="revokeApply(<s:property value="#app.ID" />)">取消申请</button>
                                    </s:if>
                                    <s:if test="#session.type==2">
                                    <button onclick="openAccept(<s:property value="#app.ID" />)">接受</button>
                                    <button onclick="openRefuse(<s:property value="#app.ID" />)">拒绝</button>
                                    </s:if>
                                    </s:if>
                                    <s:else >
                                    不可操作
                                    </s:else>
                                    </td>
                                    </tr>
                                    </s:iterator>
                                    </tbody>
                                    </table>
                                    </div>
                                    <!-- 分页组件 -->
        <jsp:include page="/jsp/common/page.jsp"></jsp:include>
</body>
</html>