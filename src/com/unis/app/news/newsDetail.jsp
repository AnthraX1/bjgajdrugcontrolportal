﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String newsType = request.getParameter("newsType");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
    <title>新闻 明细</title>
    <link href="<%=basePath%>liger/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <%-- <link href="<%=basePath%>liger/lib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" /> --%>
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
  	<script type='text/javascript' src='<%=basePath%>dwr/interface/NewsAction.js'></script>
 	<style type="text/css">
 	    .l-button-2{
		BORDER-BOTTOM: #bfcfe1 1px solid; 
		POSITION: relative; 
		BORDER-LEFT: #bfcfe1 1px solid; 
		LINE-HEIGHT: 25px; 
		HEIGHT: 25px; 
		COLOR: #2c69a2; 
		BORDER-TOP: medium none; CURSOR: pointer; 
		BORDER-RIGHT: #bfcfe1 1px solid;
		WIDTH: 80px;  
		BACKGROUND: url('<%=basePath%>liger/lib/images/ui/button1.gif') repeat-x; 

	}
 	</style>

</head>
<body style="padding-bottom:31px;">
    <form id="mainform2"  method="post"></form> 
    <script type="text/javascript"> 
	    var com;
        var config = {"Form":{ 
         fields : [
         {name:"c_lm",type:"hidden",value:'<%=newsType %>'},
         {
	         display:"标题",
	         name:"c_bt",
	         newline:true,
	         labelWidth:100,
	         width:696,
	         type:"text",
	         validate: { required: true},
	         group:"基本信息",
	         groupicon:"<%=basePath%>liger/lib/icons/32X32/communication.gif"
         },{display:"文章栏目",
        	 type:"text",
             name:"c_lmName",
             validate: { required: true},
             newline:true,
             labelWidth:100,
             width:606
         },{
   	         name:"wzlm",
   	         newline:false,
   	         width:110,
   	         height: 30,
   	         type:"button",
   	         cssClass:"l-button-2",
   	         value:"选择栏目",
   	         onclick : "selectLanmu()"
         },{display:"发布单位",name:"c_fbdw",validate: { required: true},newline:true,labelWidth:100,width:325,type:"basicText"},
         {display:"访问权限",name:"c_fwqx",newline:false,labelWidth:90,width:270,validate: { required: true},type:"basicText"},
         {display:"是否图片文章",
             name:"c_sftwwz",
             newline:true,
             labelWidth:100,width:30,type:"checkbox"
         },
         {display:"图片名称",name:"c_tpljdz",newline:false,labelWidth:100,width:445,space:30,type:"text",readonly:"readonly"},
         {
   	         name:"sctp",
   	         newline:false,
   	         width:120,
   	         type:"button",
   	         cssClass:"l-button-2",
   	         value:"选择图片",
   	      	 disabled:"disabled",
   	      	 onclick : "openDialog('#uploadImageDiv')"
         },
         {  display:"是否上传视频",
            name:"c_sfscsp",
            newline:true,labelWidth:100,width:30,
            type:"checkbox",
            nodeWidth :30
        },
        {display:"视频名称",name:"c_spljdz",newline:false,labelWidth:100,width:445,space:30,type:"text",readonly:"readonly"},
        {
        	 value:"选择视频",
	         name:"scsp",
	         newline:false,
	         labelWidth: 0,
	         width:120,
	         type:"button",
	         cssClass:"l-button-2",
	         disabled:"disabled",
	         onclick : "openDialog('#uploadFlashDiv')"
         },
         {display:"视频封面图片",name:"c_spfmljdz",newline:true,labelWidth:100,width:585,space:30,type:"text",readonly:"readonly"},
         {
         	 value:"选择封面图片",
 	         name:"scspfm",
 	         newline:false,
 	         labelWidth: 0,
 	         width:120,
 	         type:"button",
 	         cssClass:"l-button-2",
 	         disabled:"disabled",
 	         onclick : "openDialog('#uploadFlashFmDiv')"
          },
         {
         	display:"简介",
         	name:"c_jj",
         	newline:true,
         	labelWidth:100,
         	width:700,space:30,
         	type:"textarea"
         },
         {display:"链接",name:"c_lj",newline:true,labelWidth:100,width:315,space:30,type:"text"},
         {display:"发布时间",name:"d_fbsj",newline:false,labelWidth:100,width:250,validate: { required: true},
         space:30,type:"text",onclick:"WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"},
         {display:"内容",name:"c_nr",newline:true,labelWidth:100,width:700,heigth: 800,space:30,type:"textarea"}
         ,{
        	 type:"hidden",
             name:"c_lm",
         }
        ]
 }};

        var forbidFields = [];
        LG.adujestConfig(config,forbidFields);

        var roleids = '';
        var dig;
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

        //创建表单结构
        var mainform2 = $("#mainform2");  
        mainform2.ligerForm({ 
         labelWidth: 0,
         space: 10,
         fields : config.Form.fields//,
		 //toJSON:JSON2.stringify
        });

        $("#RoleID").val(roleids);

        var actionRoot = "";
        if(isEdit){ 
            $("#LoginName").attr("readonly", "readonly").removeAttr("validate");
            mainform2.attr("action", actionRoot + "newsUpdate"); 
        }
        if (isAddNew) {
            mainform2.attr("action", actionRoot + "newsSave");
        }
        else { 
            LG.loadForm(mainform2, { type: 'AjaxMemberManage', method: 'newsQuery', data: { ID: currentID} },f_loaded);
        }  

        if(!isView) 
        {
            //验证
            jQuery.metadata.setType("attr", "validate"); 
            LG.validate(mainform2);
        } 

		function f_loaded()
        {
            if(!isView) return; 
            //查看状态，控制不能编辑
            $("input,select,textarea",mainform2).attr("readonly", "readonly");
        }
		
		
		var tempdata = [{text:'总队内部可见',value:'1'},{text:'全市可见',value:'2'},{text:'全国可见',value:'3'}];
		com = $("#c_fbdw").ligerComboBox({
	    	 isMultiSelect: false,
             selectBoxWidth: 325,
             selectBoxHeight: 200, 
	         valueField:"value",
	         textFiled:"text",
	         url:"<%=basePath%>newsCombox"
		});
		
		com2 = $("#c_fwqx").ligerComboBox({
	    	 isMultiSelect: false,
             selectBoxWidth: 270,
             selectBoxHeight: 100, 
	         valueField:"value",
	         textFiled:"text",
	         data: tempdata,
	         value: '3'
		});

        //<!-- 设置一些默认参数 -->
        var editor = CKEDITOR.replace( 'c_nr' );
    	CKFinder.setupCKEditor( editor, '/ckfinder/' );

    	//$("c_tpljdz").setDisabled();
        
        function f_save() {
        	
        	//验证
        	if (!LG.validator.form()) {
                LG.showInvalid();
                return false;
            }

        	var formMap = DWRUtil.getValues("mainform2"); 

        	if(formMap["c_sftwwz"] == true){
        		formMap["c_sftwwz"] = '1';
        	} else {
        		formMap["c_sftwwz"] = '0';
        	}
        	
        	if(formMap["c_sfscsp"] == true){
        		formMap["c_sfscsp"] = '1';
        	} else {
        		formMap["c_sfscsp"] = '0';
        	}
        	
        	formMap["c_nr"] = editor.document.getBody().getHtml();
        	formMap["c_fbdw"] = com.getValue();
		formMap["c_fwqx"] = com2.getValue();
			
        	NewsAction.newsSave(formMap,function (result){
        		//var win = parent || window;
        		if(result == 'success'){
        			LG.showSuccess('保存成功', function () { 
                        f_cancel();
                        parent.loadGrid('<%=newsType%>');
                    });
        		} else {
        		    LG.showError('保存失败');
        		}
        	});
        	
        	/**
            LG.submitForm(mainform2, function (data) {
                var win = parent || window;
                //if (data.IsError) {  
                //    win.LG.showError('错误:' + data.Message);
               // } else { 
                    win.LG.showSuccess('保存成功', function () { 
                        win.LG.closeAndReloadParent(null, "MemberManageUser");
                    });
                //}
            });
            **/
        }
        
		function selectLanmu(){
			
			dig = $.ligerDialog.open({
        		url: '<%=basePath%>admin/app/news/selectLanmu.jsp', height: 400,width: 700,title:'栏目选择'
        	});
		}
		
		
        function f_cancel() {
            parent.dialog_hidden();
        }

        function submit_lanmu(text,value){
    		$("#c_lm").val(value);
    		$("#c_lmName").val(text);
    		dig.hidden();
    	}
    	
    	function close_lanmu(){
    		dig.hidden();
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

        $(function(){
       	 if ($.browser.msie) {
       	  	$('input:checkbox').click(function () { 
       	   	    this.blur();   
       	   		this.focus(); 
       		});   
       	 };
       	 
       	 $("#c_sftwwz").change(function() {
       		 var value = $("#c_sftwwz").attr("checked");
       		 if(value == true){
				$("#sctp").attr("disabled",false);	
             }else{
            	 $("#sctp").attr("disabled","disabled");	
             }
       	 
       		});
       	}); 


        $(function(){
       	 if ($.browser.msie) {
       	  	$('input:checkbox').click(function () { 
       	   	    this.blur();   
       	   		this.focus(); 
       		});   
       	 };
       	 $("#c_sfscsp").change(function() {
       		 var value = $("#c_sfscsp").attr("checked");
       		 if(value == true){
    			$("#scsp").attr("disabled",false);	
    			$("#scspfm").attr("disabled",false);
             }else{
	           	$("#scsp").attr("disabled","disabled");
	           	$("#scspfm").attr("disabled","disabled");
             }
       	 
       		//  upload('c_spljdz','fileDownload','cSmjhzm');
       		});
       	}); 
        
    </script>
 	<div id="uploadImageDiv" style="display: none;">
		 <iframe src="<%=basePath%>fileupload/uploadFile.jsp?fileNameId=c_tpljdz"></iframe> <!---->
	</div>
	<div id="uploadFlashDiv" style="display: none;">
		 <iframe src="<%=basePath%>fileupload/uploadFile.jsp?fileNameId=c_spljdz"></iframe> <!---->
	</div> 
	<div id="uploadFlashFmDiv" style="display: none;">
		 <iframe src="<%=basePath%>fileupload/uploadFile.jsp?fileNameId=c_spfmljdz"></iframe> <!---->
	</div>  
</body>

</html>
