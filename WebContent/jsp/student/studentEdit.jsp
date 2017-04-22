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
	$("#studentEditForm").validate({
	    rules:{
	        stunum:{
	        	required:true,
	        	rangelength:[10,12],
	        	number:true
	        },
            realname:{
                required:true,
                rangelength:[2,12]
            },
            age:{
            	required:true,
                number:true,
                range:[10,40]
            },
            grade:{
            	required:true,
            	number:true,
                range:[1990,2017]
            },
            major:{
            	required:true,
                rangelength:[2,10]
            },
            email:{
            	required:true,
                email:true
            },
            address:{
            	required:true,
            	rangelength:[2,20]
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
                <s:if test="oper==1">添加学生</s:if>
                <s:elseif test="oper==2">修改学生信息</s:elseif>
                <s:elseif test="oper==3">修改个人详细信息</s:elseif>
            </h1>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <form id="studentEditForm" class="form-horizontal" action="studentsave!saveedit.action" method="post">
                    <!-- 隐藏域 -->
                    <s:hidden name="oper" id="oper" />
                    <!-- 隐藏域 -->
              

                    <div class="form-group">
                        <label class="col-sm-5 control-label no-padding-right"
                            for="username">学号</label>
                        <div class="col-sm-7">
                            <input type="text" name="stunum" <s:if test="oper!=1">readOnly</s:if> id="stunum"
                                value="<s:property value="stunum" />" class="col-xs-10 col-sm-5 " />
                        </div>
                    </div>

                    <div class="space-4"></div>

                    <div class="form-group">
                        <label class="col-sm-5 control-label no-padding-right"
                            for="password"> 姓名 </label>
                        <div class="col-sm-7">
                            <input type="text" name="realname" id="realname"
                                value="<s:property value="realname" />"
                                class="col-xs-10 col-sm-5 " />
                        </div>
                    </div>
                    
                    <div class="space-4"></div>

                    <div class="form-group">
                        <label class="col-sm-5 control-label no-padding-right"
                            for="password2"> 性别 </label>
                            <select name="type" id="type"   style="width:405px;height:26px;text-align:center;margin-left:10px" value="<s:property value="type"/>">
                            <option value="1">男</option>
                            <option value="2">女</option>
                            </select>
                            <s:if test="oper!=1">
                            <script>
                            $("#type").val("<s:property value="sex"/>");
                            </script>
                            </s:if>
                            </div>
                              <div class="space-4"></div>

                    <div class="form-group">
                        <label class="col-sm-5 control-label no-padding-right"
                            for="age">年龄</label>
                        <div class="col-sm-7">
                            <input type="text" name="age" id="age"
                                value="<s:property value="age" />"
                                class="col-xs-10 col-sm-5 " />
                        </div>
                    </div>
                        
                    
                     
                      <div class="space-4"></div>

                    <div class="form-group">
                        <label class="col-sm-5 control-label no-padding-right"
                            for="grade"> 年级 </label>
                        <div class="col-sm-7">
                            <input type="text" name="grade" id="grade"
                                value="<s:property value="grade" />"
                                class="col-xs-10 col-sm-5 " />
                        </div>
                    </div>
                    <div class="space-4"></div>

                    <div class="form-group">
                        <label class="col-sm-5 control-label no-padding-right"
                            for="password"> 专业 </label>
                        <div class="col-sm-7">
                            <input type="text" name="major" id="major"
                                value="<s:property value="major" />"
                                class="col-xs-10 col-sm-5 " />
                        </div>
                    </div>
                     <div class="space-4"></div>

                    <div class="form-group">
                        <label class="col-sm-5 control-label no-padding-right"
                            for="email"> 邮箱 </label>
                        <div class="col-sm-7">
                            <input type="text" name="email" id="email"
                                value="<s:property value="email" />"
                                class="col-xs-10 col-sm-5 " />
                        </div>
                    </div>
                     <div class="space-4"></div>

                    <div class="form-group">
                        <label class="col-sm-5 control-label no-padding-right"
                            for="address"> 地址 </label>
                        <div class="col-sm-7">
                            <input type="text" name="address" id="address"
                                value="<s:property value="address" />"
                                class="col-xs-10 col-sm-5 " />
                        </div>
                    </div>
                     
</div>
                    <div class="space-4"></div>

                    <div class="form-group">
                        <div class="col-md-offset-4 col-md-9" style="padding-left:200px">
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