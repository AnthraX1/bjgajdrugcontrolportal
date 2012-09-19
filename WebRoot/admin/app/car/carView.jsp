﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String isView = request.getParameter("isView");
if(isView == null){
	isView = "0";
} else {
	isView = "1";
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
    <title>车辆 明细</title>
    <link href="<%=basePath%>liger/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>liger/lib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />
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
	<script type="text/javascript" src="<%=basePath%>js/My97DatePicker/WdatePicker.js"></script>
	<script type='text/javascript' src='<%=basePath%>dwr/engine.js'></script>
  	<script type='text/javascript' src='<%=basePath%>dwr/util.js'></script>
  	<script type='text/javascript' src='<%=basePath%>dwr/interface/CarAction.js'></script>

</head>
<body style="padding-bottom:31px;">
    <form id="mainform"  method="post"></form> 
    <script type="text/javascript"> 
    
        var tempdata;

        CarAction.getCartypeCombox(function(data){
			//$("#n_lbxh").tempdata = data;
	        tempdata = data;
	        var config = {"Form":{ 
		         fields : [
		         {display:"车牌号",name:"n_cllbxh",newline:true,labelWidth:100,
		          width:220,space:30,type:"select",comboboxName:"n_cllbxhName",
		          options:{
		             valueField:"value",
		             textFiled:"text",
		         	 //url:"../handler/select.ashx?view=Categories&idfield=CategoryID&textfield=CategoryName",
		         	 data : tempdata,
		         	 value : '<s:property value="car.n_cllbxh"/>'
		          },
		          group:"基本信息",
		          groupicon:"<%=basePath%>liger/lib/icons/32X32/communication.gif"
		         },
		         {
			         display:"申请事由",
			         name:"c_sqsy",
			         newline:true,
			         labelWidth:100,
			         width:540,
			         space:30,
			         type:"textarea",
			         value : '<s:property value="car.c_sqsy"/>'
		         },
		         {display:"通过短信申请",name:"c_tgdxsq",newline:true,labelWidth:100,width:540,space:30,type:"checkbox"},
		         {display:"出车时间",name:"d_ccsj",newline:true,labelWidth:100,width:540,space:30,type:"text",
			      value : '<s:property value="car.d_ccsj"/>'},
		         {display:"归队时间",name:"d_gdsj",newline:true,labelWidth:100,width:540,space:30,type:"text",
				  value : '<s:property value="car.d_gdsj"/>'},
				  {name:"n_xh",newline:true,labelWidth:100,width:540,space:30,type:"hidden",value :'<s:property value="car.n_xh"/>'}
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
	

	
	        
	          

	        function f_cancel()
	        {
	            parent.dialog_hidden();
	        }
        });
        
    </script>
</body>

</html>
