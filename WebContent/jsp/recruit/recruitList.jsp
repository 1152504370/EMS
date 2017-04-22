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
function openEdit(recid){
       layer.confirm('是否修改？', {icon:3,
              btn: ['是','否'] //按钮
            }, function(index){
                var obj = document.forms[1];
                document.forms[1].recid.value = recid;
                obj.submit();
          },
          function(){
              layer.alert('您已放弃操作', {icon:5,
                    time: 20000, //20s后自动关闭
                    btn: ['好的']
                  });

    });
    }
function openDelete(recid){
    layer.confirm('是否删除？', {icon:3,
          btn: ['是','否'] //按钮
        }, function(index){
            var params = {
                    recid:recid
                 }
         $.ajax({
             type:'POST',
             url:"jsonAjaxrecruit!delete.action",
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
}
function sendApply(recid){
    layer.confirm('是否应聘这个工作？', {icon:3,
          btn: ['是的，我想好了','不，我还想再看看'] //按钮
        }, function(index){
            var params = {
                    recid:recid
                 }
         $.ajax({
             type:'POST',
             url:"jsonAjaxrecruit!seekJob.action",
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

</script>
</head>
<body>
<form id="listForm" action="recruit!list.action" method="post">
<input type="hidden"  id="pageNo" name="pageNo" />
</form>
<form id="editForm" action="recruitedit!toedit.action" method="post">
<input type="hidden"  id="recid" name="recid" />
</form>
<h3 class="header smaller lighter blue"></h3>
                <div class="table-responsive">
                    <table id="sample-table-2"
                        class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>公司名称</th>
                                <th>招聘标题</th>
                                <th>招聘类型</th>
                                <th>岗位</th>
                                <th>薪资</th>
                                <th>联系邮箱</th>
                                <th>联系人</th>
                                <th width="33%">招聘详情</th>
                                <th class="text-center">操作</th>
                            </tr>
                        </thead>
                            <tbody>
                        <s:iterator value="page.resultList" id="rec" status="st">
                                <tr>

                                    <td><a href="#"><s:property value="#rec.COMNAME" /></a></td>
                                    <td><a href="#"><s:property value="#rec.TITLE" /></a></td>
                                    <td><a href="#"><s:property value="#rec.TYPE" /></a></td>
                                    <td><a href="#"><s:property value="#rec.JOB" /></a></td>
                                    <td><a href="#"><s:property value="#rec.SALARY" /></a></td>
                                    <td><a href="#"><s:property value="#rec.EMAIL" /></a></td>
                                    <td><a href="#"><s:property value="#rec.LINKMAN" /></a></td>
                                    <td><a href="#"><s:property value="#rec.DETAIL" /></a></td>
                                    <td class="text-center">
                                    <s:if test="#session.type==1">
                                    <button onclick="sendApply(<s:property value="#rec.RECID" />)">应聘</button>
                                    </s:if>
                                    <s:if test="#session.type==2">
                                    <button onclick="openEdit(<s:property value="#rec.RECID" />)">修改</button>
                                    <button onclick="openDelete(<s:property value="#rec.RECID" />)">删除</button>
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