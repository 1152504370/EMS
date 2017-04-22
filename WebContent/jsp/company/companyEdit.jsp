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
	$("#companyEditForm").validate({
	    rules:{
	        comname:{
	        	required:true,
	        	rangelength:[2,20],
	        },
            comtype:{
            	required:true,
            	rangelength:[2,20]
            },
            address:{
            	required:true,
            	rangelength:[2,40]
            },
            telephone:{
            	required:true,
                rangelength:[4,12]
            },
            info:{
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
                <s:if test="oper==1">添加企业信息</s:if>
                <s:elseif test="oper==2">修改企业信息</s:elseif>
            </h1>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <form id="companyEditForm" class="form-horizontal" action="companysave!saveedit.action" method="post">
                    <!-- 隐藏域 -->
                    <s:hidden name="oper" id="oper" />
                    <s:hidden name="comid" id="comid" />
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
                            for="comtype">公司类型</label>
                        <div class="col-sm-7">
                            <input type="text" name="comtype" id="comtype"
                                value="<s:property value="comtype" />"
                                class="col-xs-10 col-sm-5 " />
                        </div>
                    </div>
                        
                    
                     
                      <div class="space-4"></div>

                    <div class="form-group">
                        <label class="col-sm-5 control-label no-padding-right"
                            for="address">公司地址 </label>
                        <div class="col-sm-7">
                            <input type="text" name="address" id="address"
                                value="<s:property value="address" />"
                                class="col-xs-10 col-sm-5 " />
                        </div>
                    </div>
                    <div class="space-4"></div>

                    <div class="form-group">
                        <label class="col-sm-5 control-label no-padding-right"
                            for="telephone">联系电话</label>
                        <div class="col-sm-7">
                            <input type="text" name="telephone" id="telephone"
                                value="<s:property value="telephone" />"
                                class="col-xs-10 col-sm-5 " />
                        </div>
                    </div>
                     <div class="space-4"></div>

                    <div class="form-group">
                        <label class="col-sm-5 control-label no-padding-right"
                            for="info"> 简介信息 </label>
                        <div class="col-sm-7">
                        <!-- 
                            <input type="text" name="info" id="info"
                                value="<s:property value="info" />"
                                class="col-xs-10 col-sm-5 " />
                         -->
                                <textarea rows="3" cols="20"  name="info" id="info" class="col-xs-10 col-sm-5 " >
                                <s:property value="info" />
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