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
function openEdit(comid){
	   layer.confirm('是否修改？', {icon:3,
	          btn: ['是','否'] //按钮
	        }, function(index){
	        	var obj = document.forms[1];
	            document.forms[1].comid.value = comid;
	            obj.submit();
		  },
		  function(){
			  layer.alert('您已放弃操作', {icon:5,
		            time: 20000, //20s后自动关闭
		            btn: ['好的']
		          });

	});
	}
function openDelete(comid){
	layer.confirm('是否删除？', {icon:3,
		  btn: ['是','否'] //按钮
		}, function(index){
            var params = {
                    comid:comid
                 }
         $.ajax({
             type:'POST',
             url:"jsonAjaxcompany.action",
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
		  layer.alert('您已放弃操作', {icon:5,
		    time: 20000, //20s后自动关闭
		    btn: ['好的']
		  });
		});
	/*
	layer.msg('是否删除？', {
        time: 0 //不自动关闭
        ,btn: ['是的', '不要']
        ,yes: function(index){
        	  var params = {
                      id:id
                   }
           $.ajax({
               type:'POST',
               url:"jsonAjax.action",
               data:params,
               dataType:'text',
               success:function(json){
                    var obj = $.parseJSON(json);  //使用这个方法解析json
                       var state_value = obj.result;  //result是和action中定义的result变量的get方法对应的
                       layer.alert(state_value, {icon: 6});
                   window.location.reload();
               },
               error:function(json){
                   layer.msg("操作异常", {icon: 5});
               }
           });
        }
      });
	*/
	/*
	if(confirm("是否删除？")){
		$("#deleteForm").id.val(id);
		$("#deleteForm").submit();
		var params = {
		           id:id
		        }
		$.ajax({
			type:'POST',
			url:"jsonAjax.action",
			data:params,
			dataType:'text',
			success:function(json){
				 var obj = $.parseJSON(json);  //使用这个方法解析json
	                var state_value = obj.result;  //result是和action中定义的result变量的get方法对应的
	                alert(state_value);
				window.location.reload();
			},
			error:function(json){
				alert("操作异常");
			}
		});
	}
		*/
}
</script>
</head>
<body>
<form id="listForm" action="company!list.action" method="post">
<input type="hidden"  id="pageNo" name="pageNo" />
</form>
<form id="editForm" action="companyedit!toedit.action" method="post">
<input type="hidden"  id="comid" name="comid" />
</form>
<h3 class="header smaller lighter blue"></h3>
                <div class="table-responsive">
                    <table id="sample-table-2"
                        class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>公司Id</th>
                                <th>公司名称</th>
                                <th>公司类别</th>
                                <th>公司地址</th>
                                <th>联系电话</th>
                                <th width="33%">公司简介</th>
                                <s:if test="#session.type==2">
                                <th class="text-center">操作</th>
                                </s:if>
                            </tr>
                        </thead>
                            <tbody>
                        <s:iterator value="page.resultList" id="com" status="st">
                                <tr>

                                    <td><a href="#"><s:property value="#com.COMID" /></a></td>
                                    <td><a href="#"><s:property value="#com.COMNAME" /></a></td>
                                    <td><a href="#"><s:property value="#com.COMTYPE" /></a></td>
                                    <td><a href="#"><s:property value="#com.ADDRESS" /></a></td>
                                    <td><a href="#"><s:property value="#com.TELEPHONE" /></a></td>
                                    <td><a href="#"><s:property value="#com.INFO" /></a></td>
                                    <s:if test="#session.type==2">
                                    <td class="text-center">
                                    <button onclick="openEdit(<s:property value="#com.COMID" />)">修改</button>
                                    <button onclick="openDelete(<s:property value="#com.COMID" />)">删除</button>
                                    </td>
                                    </s:if>
                                    </tr>
                                    </s:iterator>
                                    </tbody>
                                    </table>
                                    </div>
                                    <!-- 分页组件 -->
        <jsp:include page="/jsp/common/page.jsp"></jsp:include>
</body>
</html>