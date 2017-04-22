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
	$("#recruitEditForm").validate({
	    rules:{
	        comname:{
	        	required:true,
	        	rangelength:[2,20],
	        },
            type:{
            	required:true,
            	rangelength:[2,20]
            },
            job:{
            	required:true,
            	rangelength:[2,40]
            },
            email:{
            	required:true,
            	email:true
            },
            salary:{
            	required:true,
            	number:true,
                range:[100,1000000],
            },
            linkman:{
            	required:true,
            	rangelength:[1,20],
            },
            title:{
            	required:true,
            	rangelength:[2,20]
            },
            detail:{
            	required:true,
            	rangelength:[1,200]
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
                <s:if test="oper==1">添加招聘信息</s:if>
                <s:elseif test="oper==2">修改招聘信息</s:elseif>
            </h1>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <form id="recruitEditForm" class="form-horizontal" action="recruitsave!saveedit.action" method="post">
                    <!-- 隐藏域 -->
                    <s:hidden name="oper" id="oper" />
                    <s:hidden name="recid" id="recid" />
                    <!-- 隐藏域 -->
              
              

                    <div class="space-4"></div>

                    <div class="form-group">
                        <label class="col-sm-5 control-label no-padding-right"
                            for="comname"> 公司名称 </label>
                        <div class="col-sm-7">
                            <input type="text" name="comname" id="comname"
                                value="<s:property value="comname" />"
                                class="col-xs-10 col-sm-5 " />
                        </div>
                    </div>
                    
                              <div class="space-4"></div>

                    <div class="form-group">
                        <label class="col-sm-5 control-label no-padding-right"
                            for="title">招聘标题</label>
                        <div class="col-sm-7">
                            <input type="text" name="title" id="title"
                                value="<s:property value="title" />"
                                class="col-xs-10 col-sm-5 " />
                        </div>
                    </div>
                        
                    
                     
                      <div class="space-4"></div>

                    <div class="form-group">
                        <label class="col-sm-5 control-label no-padding-right"
                            for="type">招聘类型 </label>
                        <div class="col-sm-7">
                            <input type="text" name="type" id="type"
                                value="<s:property value="type" />"
                                class="col-xs-10 col-sm-5 " />
                        </div>
                    </div>
                    <div class="space-4"></div>

                    <div class="form-group">
                        <label class="col-sm-5 control-label no-padding-right"
                            for="job">招聘岗位</label>
                        <div class="col-sm-7">
                            <input type="text" name="job" id="job"
                                value="<s:property value="job" />"
                                class="col-xs-10 col-sm-5 " />
                        </div>
                    </div>
                    <div class="space-4"></div>

                    <div class="form-group">
                        <label class="col-sm-5 control-label no-padding-right"
                            for="salary">薪资</label>
                        <div class="col-sm-7">
                            <input type="text" name="salary" id="salary"
                                value="<s:property value="salary" />"
                                class="col-xs-10 col-sm-5 " />
                        </div>
                    </div>
                    <div class="space-4"></div>

                    <div class="form-group">
                        <label class="col-sm-5 control-label no-padding-right"
                            for="email">邮箱地址</label>
                        <div class="col-sm-7">
                            <input type="text" name="email" id="email"
                                value="<s:property value="email" />"
                                class="col-xs-10 col-sm-5 " />
                        </div>
                    </div>
                    <div class="space-4"></div>

                    <div class="form-group">
                        <label class="col-sm-5 control-label no-padding-right"
                            for="linkman">联系人</label>
                        <div class="col-sm-7">
                            <input type="text" name="linkman" id="linkman"
                                value="<s:property value="linkman" />"
                                class="col-xs-10 col-sm-5 " />
                        </div>
                    </div>
                     <div class="space-4"></div>

                    <div class="form-group">
                        <label class="col-sm-5 control-label no-padding-right"
                            for="detail"> 招聘详情 </label>
                        <div class="col-sm-7">
                                <textarea rows="3" cols="20"  name="detail" id="detail" class="col-xs-10 col-sm-5 " >
                                <s:property value="detail" />
                                </textarea>
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