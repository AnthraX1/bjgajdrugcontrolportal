﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String c_zt = request.getParameter("c_zt");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>内部邮件</title> 
    <link href="<%=basePath%>liger/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <%--<link href="<%=basePath%>liger/lib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />--%>
    <link href="<%=basePath%>liger/lib/css/common.css" rel="stylesheet" type="text/css" />  
    <script src="<%=basePath%>liger/lib/jquery/jquery-1.5.2.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>liger/lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>   
    <script src="<%=basePath%>liger/lib/js/common.js" type="text/javascript"></script>   
    <script src="<%=basePath%>liger/lib/js/LG.js" type="text/javascript"></script>
    <script src="<%=basePath%>liger/lib/js/ligerui.expand.js" type="text/javascript"></script> 
    <script src="<%=basePath%>liger/lib/json2.js" type="text/javascript"></script>

    <script src="<%=basePath%>liger/lib/jquery-validation/jquery.validate.min.js" type="text/javascript"></script> 
    <script src="<%=basePath%>liger/lib/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
    <script src="<%=basePath%>liger/lib/jquery-validation/emails_cn.js" type="text/javascript"></script> 
    
    <script src='<%=basePath%>dwr/engine.js' type='text/javascript' ></script>
  	<script src='<%=basePath%>dwr/util.js' type='text/javascript' ></script>
  	<script src='<%=basePath%>dwr/interface/EmailAction.js' type='text/javascript' ></script>
    <style type="text/css">
    .l-panel td.l-grid-row-cell-editing { padding-bottom: 2px;padding-top: 2px;}
    </style>
</head>
<body style="padding:10px;height:100%; text-align:center;">
   <input type="hidden" id="MenuNo" value="MemberManageRole" /> 
  <form id="mainform">
    <div id="maingrid"  style="margin:2px;"></div> 
    </form> 
  <script type="text/javascript">

      var dialog;
      //相对路径
      var rootPath = "../";
      //列表结构
      var tempdata = {};
      var grid = $("#maingrid").ligerGrid({
          columns: [
          { display: "序号", name: "n_xh", width: 70, type: "text", align: "left"},
          /**{ display: "发布人", name: "c_yhid", width: 120, type: "text", align: "left", editor: { type: 'text'} },**/
          { display: "标题", name: "c_bt", width: 400, type: "text", align: "left", editor: { type: 'text'} },
          { display: "添加时间", name: "d_dj", width: 160, type: "textarea", align: "left", editor: { type: 'text'} }
          ], dataAction: 'server', pageSize: 20, toolbar: {},
           sortName: 'n_xh', rownumbers:true,
          width: '98%', height: '100%',heightDiff:-10, checkbox: false,enabledEdit: true, clickToEdit: false
         // ,data: tempdata
      });

      //双击事件
      //LG.setGridDoubleClick(grid, 'modify');

      //验证
      var maingform = $("#mainform");
      $.metadata.setType("attr", "validate");
      LG.validate(maingform, { debug: true }); 

      //加载toolbar
      LG.loadToolbar(grid, toolbarBtnItemClick);

      var items ;

      if('<%=c_zt%>' == '2'){
    	  items=[
   	      {
	          click:toolbarBtnItemClick,
	          text:'新增',
	          img:'<%=basePath%>liger/lib/icons/silkicons/add.png',
	          id:'add'
	      },{
	          click: toolbarBtnItemClick,
	          text: '删除',
	          img:'<%=basePath%>liger/lib/icons/silkicons/delete.png',
	          id: 'delete'
	      },{line:true},{
	          click: toolbarBtnItemClick,
	          text: '查看',
	          img:'<%=basePath%>liger/lib/icons/silkicons/application_view_detail.png',
	          id: 'view'
	     }];
      } else { 
	      items=[
	     	{
	            click:toolbarBtnItemClick,
	            text:'新增',
	            img:'<%=basePath%>liger/lib/icons/silkicons/add.png',
	            id:'add'
	        },{
	            click: toolbarBtnItemClick,
	            text: '删除',
	            img:'<%=basePath%>liger/lib/icons/silkicons/delete.png',
	            id: 'delete'
	        },{line:true},{
	            click: toolbarBtnItemClick,
	            text: '查看',
	            img:'<%=basePath%>liger/lib/icons/silkicons/application_view_detail.png',
	            id: 'view'
	       },{line:true},{
	           click: toolbarBtnItemClick,
	           text: '查看签收情况',
	           img:'<%=basePath%>liger/lib/icons/silkicons/application_view_detail.png',
	           id: 'viewQsqk'
	      },{line:true}];
      }
	grid.toolbarManager.set('items', items);

      //工具条事件
      function toolbarBtnItemClick(item)
      {
          var editingrow = grid.getEditingRow();
          switch (item.id) {
              case "add":
                  if (editingrow == null)
                  {
                	  //top.f_addTab(null, '保存信息', '<%=basePath%>admin/app/email/emailDetail.jsp');
			  		   dialog = $.ligerDialog.open({ url: '<%=basePath%>admin/app/email/emailDetail.jsp', 
                           	height: 500,width: 900,showMax: true, showToggle: true,  showMin: true,
                           	title:'内部邮件'
					  });
                  } else {
                      LG.tip('请先提交或取消修改');
                  }
                  break;
              case "view":
                  var selected = grid.getSelected();
                  if (!selected) { LG.tip('请选择行!'); return }
                  //top.f_addTab(null, '查看信息', '<!%=basePath%>emailUpdate?email.n_xh=' + selected.n_xh);
                  if('<%=c_zt%>' == '2'){
                	  dialog = $.ligerDialog.open({ url: '<%=basePath%>emailUpdate?email.n_xh=' + selected.n_xh, 
                       	height: 500,width: 900,showMax: true, showToggle: true,  showMin: true,
                       	title:'内部邮件'
				 	 });
                  } else {
                	  dialog = $.ligerDialog.open({ url: '<%=basePath%>emailView?email.n_xh=' + selected.n_xh +'&type=fs', 
                       	height: 500,width: 900,showMax: true, showToggle: true,  showMin: true,
                       	title:'内部邮件'
				  	  });
                  }
                  
                  break;
              case "viewQsqk":
                  var selected = grid.getSelected();
                  if (!selected) { LG.tip('请选择行!'); return }
				  dialog = $.ligerDialog.open({ url: '<%=basePath%>admin/app/email/emailQsqk.jsp?n_xh=' + selected.n_xh, 
                         	height: 430,width: 365,showMax: true, showToggle: true,  showMin: true,
                         	title:'签收情况'
				  });
                  /**
                  if (editingrow == null)
                  {
                      beginEdit();
                  } else
                  {
                      LG.tip('请先提交或取消修改');
                  }
                  **/
                  break;
              case "delete":
            	  var selected = grid.getSelected();
                  if (!selected) { LG.tip('请选择行!'); return }
                  jQuery.ligerDialog.confirm('确定删除吗?', function (confirm) {
                      if (confirm)
                          f_delete();
                  });
                  break;
              case "save":
                  if (editingrow != null)
                  {
                      grid.endEdit(editingrow);
                  } else
                  {
                      LG.tip('现在不在编辑状态!');
                  }
                  break;
          }
      }
      function f_reload() {
          grid.loadData();
      }
      
      function dialog_hidden()
      {
    	  dialog.hidden();
      }
		
      function dialog_repay(value){
    	  dialog.hidden();
    	  dialog = $.ligerDialog.open({ url: '<%=basePath%>admin/app/email/emailDetail.jsp?'+value, 
    		  height: 500,width: 900,showMax: true, showToggle: true,  showMin: true,
              title:'回复邮件'
  	      });
      }
      
      function f_delete() {
          var selected = grid.getSelected();
          
          if (selected) {
        	  /**
              LG.ajax({
                  type: 'AjaxMemberManage',
                  method: 'RemoveRole',
                  loading: '正在删除中...',
                  data: { ID: selected.RoleID },
                  success: function () {
                      LG.showSuccess('删除成功');
                      f_reload();
                  },
                  error: function (email) {
                      LG.showError(email);
                  }
              });
              **/
        	  grid.deleteRow(selected);
        	  EmailAction.emailDelete(selected.n_xh, function (result){
             	   if(result == 'success'){
             		  LG.showSuccess('删除成功');
	           	   } else {
	           		  LG.showError('删除失败');
	           	   }
               });
          }
          else {
              LG.tip('请选择行!');
          }
      }


      grid.bind('beforeSubmitEdit', function (e)
      {
          if (!LG.validator.form())
          {
              LG.showInvalid();
              return false;
          }
          return true;
      });
      
      grid.bind('afterSubmitEdit', function (e) {
          var isAddNew = e.record['__status'] == "add";
          var data = $.extend(true, {}, e.newdata);
          if (!isAddNew)
              data.RoleID = e.record.RoleID;
          LG.ajax({
              loading: '正在保存数据中...',
              type: 'AjaxMemberManage',
              method: isAddNew ? "AddRole" : "UpdateRole",
              data: data,
              success: function ()
              { 
                  grid.loadData();
                  LG.tip('保存成功!');
              },
              error: function (email)
              {
                  LG.tip(email);
              }
          });
          return false;
      }); 

      function beginEdit()
      {
          var row = grid.getSelectedRow();
          if (!row) { LG.tip('请选择行'); return; }
          grid.beginEdit(row);
      }
      function addNewRow()
      {
          grid.addEditRow();
      } 
      
      loadGrid();
      
      function loadGrid(){
          var c_zt = '<%=c_zt %>';
	 	  EmailAction.emailList(c_zt,function (data){
	    	 grid.setOptions({data:data});
	      });
      }
  </script>
</body>
</html>
