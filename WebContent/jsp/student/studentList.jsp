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
function openEdit(stunum){
	   layer.confirm('是否修改？', {icon:3,
	          btn: ['是','否'] //按钮
	        }, function(index){
	        	var obj = document.forms[1];
	            document.forms[1].stunum.value = stunum;
	            obj.submit();
		  },
		  function(){
			  layer.alert('您已放弃操作', {icon:5,
		            time: 20000, //20s后自动关闭
		            btn: ['好的']
		          });

	});
	}
function openDelete(stunum){
	layer.confirm('是否删除？', {icon:3,
		  btn: ['是','否'] //按钮
		}, function(index){
            var params = {
                    stunum:stunum
                 }
         $.ajax({
             type:'POST',
             url:"jsonAjaxstudent.action",
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
<form id="listForm" action="student!list.action" method="post">
<input type="hidden"  id="pageNo" name="pageNo" />
</form>
<form id="editForm" action="studentedit!toedit.action" method="post">
<input type="hidden"  id="stunum" name="stunum" />
</form>
<h3 class="header smaller lighter blue"></h3>
                <div class="table-responsive">
                    <table id="sample-table-2"
                        class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>学号</th>
                                <th>姓名</th>
                                <th>性别</th>
                                <th>年龄</th>
                                <th>年级</th>
                                <th>专业</th>
                                <th>地址</th>
                                <th>邮箱</th>
                                <th>就业状态</th>
                                <th class="text-center">操作</th>
                            </tr>
                        </thead>
                            <tbody>
                        <s:iterator value="page.resultList" id="stu" status="st">
                                <tr>

                                    <td><a href="#"><s:property value="#stu.STUNUM" /></a></td>
                                    <td><a href="#"><s:property value="#stu.REALNAME" /></a></td>
                                    <td><a href="#"><s:if test="#stu.SEX==1">男</s:if><s:if test="#stu.SEX==2">女</s:if></a></td>
                                    <td><a href="#"><s:property value="#stu.AGE" /></a></td>
                                    <td><a href="#"><s:property value="#stu.GRADE" /></a></td>
                                    <td><a href="#"><s:property value="#stu.MAJOR" /></a></td>
                                    <td><a href="#"><s:property value="#stu.ADDRESS" /></a></td>
                                    <td><a href="#"><s:property value="#stu.EMAIL" /></a></td>
                                    <td><a href="#"><s:if test="#stu.STATUS==0">未就业</s:if><s:if test="#stu.STATUS==1">已就业</s:if></a></td>
                                    <td class="text-center">
                                    <button onclick="openEdit(<s:property value="#stu.STUNUM" />)">修改</button>
                                    <button onclick="openDelete(<s:property value="#stu.STUNUM" />)">删除</button>
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