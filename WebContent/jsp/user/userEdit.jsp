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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- basic styles -->
<link href="<%=path%>/assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="<%=path%>/assets/css/font-awesome.min.css" rel="stylesheet" />

<!-- wtn styles -->
<link rel="stylesheet" href="<%=path%>/assets/css/wtn.min.css" />
<link rel="stylesheet" href="<%=path%>/assets/css/wtn-rtl.min.css" />

<!-- basic scripts #header..# -->
<script src="<%=path%>/assets/js/jquery-2.0.3.min.js"></script>
<script src="<%=path%>/assets/js/bootstrap.min.js"></script>
<script src="<%=path%>/assets/js/typeahead-bs2.min.js"></script>
<script src="<%=path%>/assets/js/jquery-validation/1.11.0/jquery.validate.js"></script>

<!-- wtn scripts -->
<script src="<%=path%>/assets/js/wtn-extra.min.js"></script>
<script src="<%=path%>/assets/js/wtn-elements.min.js"></script>
<script src="<%=path%>/assets/js/wtn.min.js"></script>
<script>
$(function(){
	$("#userEditForm").validate({
	    rules:{
	        username:{
	        	required:true,
	        	rangelength:[2,8]
	        },
            password:{
                required:true,
                rangelength:[6,12]
            },
            type:{
            	required:true
            }
	    }
	});
});
</script>
<title>Employment Manage System</title>
</head>
<body>
<div class="page-content">
        <div class="header bg-themeprimary">
            <h1 class="grey lighter smaller">
                <s:if test="oper==1">添加用户</s:if>
                <s:elseif test="oper==2">修改用户信息</s:elseif>
                <s:elseif test="oper==3">修改个人账户信息</s:elseif>
            </h1>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <form id="userEditForm" class="form-horizontal" action="usersave!saveedit.action" method="post">
                    <!-- 隐藏域 -->
                    <s:hidden name="oper" id="oper" />
                    <s:hidden name="stunum" id="stunum" />
                    <!-- 隐藏域 -->
              

                    <div class="form-group">
                        <label class="col-sm-5 control-label no-padding-right"
                            for="username">用户名</label>
                        <div class="col-sm-7">
                            <input type="text" name="username" id="username"
                                value="<s:property value="username" />" class="col-xs-10 col-sm-5 " />
                        </div>
                    </div>

                    <div class="space-4"></div>

                    <div class="form-group">
                        <label class="col-sm-5 control-label no-padding-right"
                            for="password"> 用户密码 </label>
                        <div class="col-sm-7">
                            <input type="text" name="password" id="password"
                                value="<s:property value="password" />"
                                class="col-xs-10 col-sm-5 " />
                        </div>
                    </div>
                    
                    <div class="space-4"></div>

                    <div class="form-group">
                        <label class="col-sm-5 control-label no-padding-right"
                            for="password2"> 用户类型 </label>
                        <div class="col-sm-7">
                        <s:if test="oper==3">
                         <select name="type" id="type"   style="width:243px;height:26px;text-align:center" value="<s:property value="type"/>">
                         <s:if test="type==1">
                            <option value="1">学生用户</option>
                         </s:if>
                         <s:if test="type==2">
                            <option value="2">管理员</option>
                         </s:if>
                            </select>
                        </s:if>
                        <s:else>
                            <select name="type" id="type"   style="width:243px;height:26px;text-align:center" value="<s:property value="type"/>">
                            
                            <option value="">请选择用户类型</option>
                            <option value="1">学生用户</option>
                            <option value="2">管理员</option>
                            </select>
                            <s:if test="oper==2">
                            <script>
                            $("#type").val("<s:property value="type"/>");
                            </script>
                            </s:if>
                        </s:else>
                        
                            <!-- 
                            <input type="text" name="type" id="type"
                                value="<s:property value="type" />"
                                class="col-xs-10 col-sm-5" />
                             -->
                        </div>
                    </div>

                   

                    <div class="space-4"></div>

                    <div class="form-group">
                        <div class="col-md-offset-4 col-md-9" style="padding-left:80px">
                            <button class="btn btn-info" type="button"
                                onclick="history.go(-1);">
                                <i class="icon-arrow-left bigger-110"></i> 返回
                            </button>
                            &nbsp; &nbsp; &nbsp;
                            <button class="btn btn-info" type="submit">
                                <i class="icon-ok bigger-110"></i> 提交
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

</body>
</html>