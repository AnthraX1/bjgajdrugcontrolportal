﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
    <title>栏目 明细</title>
    <link href="<%=basePath%>liger/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
     <%--<link href="<%=basePath%>liger/lib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />--%>
    <script src="<%=basePath%>liger/lib/jquery/jquery-1.5.2.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>liger/lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>  
    <link href="<%=basePath%>liger/lib/css/common.css" rel="stylesheet" type="text/css" />  
    <script src="<%=basePath%>liger/lib/js/common.js" type="text/javascript"></script>    
    <script src="<%=basePath%>liger/lib/js/LG.js" type="text/javascript"></script>
    <script src="<%=basePath%>liger/lib/jquery-validation/jquery.validate.min.js" type="text/javascript"></script> 
    <script src="<%=basePath%>liger/lib/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
    <script src="<%=basePath%>liger/lib/jquery-validation/messages_cn.js" type="text/javascript"></script>
    <script src="<%=basePath%>liger/lib/jquery.form.js" type="text/javascript"></script>
    <script src="<%=basePath%>liger/lib/json2.js" type="text/javascript"></script>
    <script src="<%=basePath%>liger/lib/js/validator.js" type="text/javascript"></script>
    <script src="<%=basePath%>liger/lib/js/ligerui.expand.js" type="text/javascript"></script> 
    <script src="<%=basePath%>liger/lib/ligerUI/js/plugins/ligerForm.js" type="text/javascript"></script>
    <script src="<%=basePath%>liger/lib/ligerUI/js/plugins/ligerTree.js" type="text/javascript"></script>
    <script src="<%=basePath%>js/formUtil.js" type="text/javascript"></script>
    
    <script type="text/javascript" src="<%=basePath%>ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="<%=basePath%>ckfinder/ckfinder.js"></script>
	
	<script type='text/javascript' src='<%=basePath%>dwr/engine.js'></script>
  	<script type='text/javascript' src='<%=basePath%>dwr/util.js'></script>
  	<script type='text/javascript' src='<%=basePath%>dwr/interface/ColumnAction.js'></script>

</head>
<body style="padding-bottom:31px;">
    <form id="mainform"  method="post"></form> 
    <script type="text/javascript"> 
    
    
        var config = {"Form":{ 
         fields : [
         {
	         display:"栏目名称",
	         name:"c_lmmc",
	         value:"<s:property value='column.c_lmmc'/>",
	         newline:true,
	         labelWidth:100,
	         width:700,
	         space:30,
	         type:"text",
	         group:"基本信息",
	         groupicon:"<%=basePath%>liger/lib/icons/32X32/communication.gif"
         },
         {display:"是否放到导航",
             name:"c_sfdh",
             newline:true,
             labelWidth:100,width:30,space:30,type:"checkbox",
             value:"<s:property value='column.n_xh'/>"
         },
         {display:"连接地址",name:"c_lj",newline:false,labelWidth:100,width:540,space:30,type:"text",value:"<s:property value='column.c_lj'/>"},
         { display:"是否上传图片",
            name:"c_sftp",
            newline:true,labelWidth:100,width:30,space:30,
            type:"checkbox",
            nodeWidth :30,
            value:"<s:property value='column.c_sftp'/>"
        },
        {display:"图片名称",name:"c_tpljdz",newline:false,labelWidth:100,width:250,space:30,type:"text",readonly:"readonly",value:"<s:property value='column.c_tpljdz'/>"},
        {
        	 //display:"上传视频",
        	 value:"选择图片",
	         name:"sctp",
	         newline:false,
	         labelWidth:100,
	         width:220,space:30, 
	         type:"button",
	         cssClass:"l-button",
	         disabled:"disabled",
	         onclick : "openDialog('#uploadImageDiv')"
         },
         {display:"是否内容",name:"c_sfnr",newline:true,labelWidth:100,width:250, space:30,type:"checkbox",value:"<s:property value='column.c_sfnr'/>"},
         {display:"内容",name:"c_nr",newline:true,labelWidth:100,width:700,heigth: 800,space:30,type:"textarea", readonly:"readonly",value:"<s:property value='column.c_nr' escape='false'/>"},
         {name:"n_xh", type:"hidden",value:"<s:property value='column.n_xh'/>"},
         {name:"c_lmdm", type:"hidden",value:"<s:property value='column.c_lmdm'/>"},
         {name:"c_sjlmdm", type:"hidden",value:"<s:property value='column.c_sjlmdm'/>"},
         {name:"n_xsxh", type:"hidden",value:"<s:property value='column.n_xsxh'/>"}
        ]
 }};

        var forbidFields = [];
        LG.adujestConfig(config,forbidFields);

        //覆盖本页面grid的loading效果
        LG.overrideGridLoading(); 

        //表单底部按钮 
        LG.setFormDefaultBtn(f_cancel);

        //创建表单结构
        var mainform = $("#mainform");  
        mainform.ligerForm({ 
         inputWidth: 280,
         fields : config.Form.fields//,
		 //toJSON:JSON2.stringify
        });

        $("#RoleID").val(roleids);


		function f_loaded()
        {
            if(!isView) return; 
            //查看状态，控制不能编辑
            $("input,select,textarea",mainform).attr("readonly", "readonly");
        }

        //<!-- 设置一些默认参数 -->
		var editor = null;

    	//$("c_tpljdz").setDisabled();
        
        
        function f_cancel()
        {
           //f_cancel();
           parent.dialog_hidden();
        }

    </script>

</body>

</html>

