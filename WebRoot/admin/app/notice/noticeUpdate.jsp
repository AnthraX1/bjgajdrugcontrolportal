﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
    <title>公告 明细</title>
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
	
	<script type='text/javascript' src='<%=basePath%>dwr/engine.js'></script>
  	<script type='text/javascript' src='<%=basePath%>dwr/util.js'></script>
  	<script type='text/javascript' src='<%=basePath%>dwr/interface/NoticeAction.js'></script>

</head>
<body style="padding-bottom:31px;">
    <form id="mainform"  method="post"></form> 
    <script type="text/javascript"> 
    
    
        var config = {"Form":{ 
         fields : [
         {
	         display:"栏目名称",
	         name:"c_bt",
	         value:"<s:property value='notice.c_bt'/>",
	         newline:true,
	         labelWidth:100,
	         width:700,
	         space:30,
	         type:"text",
	         group:"基本信息",
	         groupicon:"<%=basePath%>liger/lib/icons/32X32/communication.gif"
         },
        {display:"发送人",name:"c_yhid",newline:true,labelWidth:100,width:250,space:30,type:"text",readonly:"readonly",value:"<s:property value='notice.c_tpljdz'/>"},
        {
        	 //display:"上传视频",
        	 value:"选择用户",
	         name:"sctp",
	         newline:false,
	         labelWidth:100,
	         width:220,space:30, 
	         type:"button",
	         cssClass:"l-button",
	         disabled:"disabled",
	         onclick : "openDialog('#uploadImageDiv')"
         },
         {display:"内容",name:"c_nr",newline:true,labelWidth:100,width:700,heigth: 800,space:30,type:"textarea", readonly:"readonly",value:"<s:property value='notice.c_nr' escape='false'/>"},
         {name:"n_xh", type:"hidden",value:"<s:property value='notice.n_xh'/>"}
        ]
 }};

        var forbidFields = [];
        LG.adujestConfig(config,forbidFields);

        var roleids = '';
        //当前ID
        var currentID = '';
        //是否新增状态
        var isAddNew = currentID == "" || currentID == "0";
        //是否查看状态
        var isView = 0;
        //是否编辑状态
        var isEdit = !isAddNew && !isView;

        //覆盖本页面grid的loading效果
        LG.overrideGridLoading(); 

        //表单底部按钮 
        LG.setFormDefaultBtn(f_cancel,isView ? null : f_save);

        var deptTree = {
            url :'../handler/tree.ashx?view=CF_Department&idfield=DeptID&textfield=DeptName&pidfield=DeptParentID',
            checkbox:false,
            nodeWidth :220
        };

        //创建表单结构
        var mainform = $("#mainform");  
        mainform.ligerForm({ 
         inputWidth: 280,
         fields : config.Form.fields//,
		 //toJSON:JSON2.stringify
        });

        $("#RoleID").val(roleids);

        var actionRoot = "";
        if(isEdit){ 
            $("#LoginName").attr("readonly", "readonly").removeAttr("validate");
            mainform.attr("action", actionRoot + "newsUpdate"); 
        }
        if (isAddNew) {
            mainform.attr("action", actionRoot + "newsSave");
        }
        else { 
            LG.loadForm(mainform, { type: 'AjaxMemberManage', method: 'newsQuery', data: { ID: currentID} },f_loaded);
        }  

        
          
        if(!isView) 
        {
            //验证
            jQuery.metadata.setType("attr", "validate"); 
            LG.validate(mainform);
        } 

		function f_loaded()
        {
            if(!isView) return; 
            //查看状态，控制不能编辑
            $("input,select,textarea",mainform).attr("readonly", "readonly");
        }

        //<!-- 设置一些默认参数 -->
		var editor = CKEDITOR.replace( 'c_nr' );
        CKFinder.setupCKEditor( editor, '/ckfinder/' );

    	//$("c_tpljdz").setDisabled();
        
        function f_save() {

        	var formMap = DWRUtil.getValues("mainform"); 
     
	        formMap["c_nr"] = editor.document.getBody().getHtml();
			
        	NoticeAction.noticeSave(formMap,function (result){
        		var win = parent || window;
        		if(result == 'success'){
        			win.LG.showSuccess('保存成功', function () { 
                        win.LG.closeAndReloadParent(null, "NewsGridTable");
                    });
        		} else {
        		 	win.LG.showError('保存失败');
        		}
        	});

        }
        function f_cancel()
        {
            var win = parent || window;
            win.LG.closeCurrentTab(null);
        }

        function openDialog(divNode){

        	var dlgedit = $.ligerDialog.open({
				width : 350, //宽度
				height : null,
				title : "文件上传",
				target : $(divNode),
				buttons: [ 
                           { text: '关闭', onclick: function (i, d) { $("input").ligerHideTip(); d.hide(); }} 
                          ]
			});
        }



        
    </script>
 	<div id="uploadImageDiv" style="display: none;">
		 <iframe src="<%=basePath%>fileupload/uploadFile.jsp?fileNameId=c_tpljdz"></iframe> <!---->
	</div>
</body>

</html>
