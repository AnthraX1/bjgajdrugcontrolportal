﻿<%@page import="org.apache.commons.lang.xwork.StringUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title> 
    <link href="<%=basePath%>liger/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <%-- <link href="<%=basePath%>liger/lib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" /> --%>
    <script src="<%=basePath%>liger/lib/jquery/jquery-1.5.2.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>liger/lib/ligerUI/js/ligerui.all.js" type="text/javascript"></script>   
    <script src="<%=basePath%>liger/lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>
    <script src="<%=basePath%>liger/lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <link href="<%=basePath%>liger/lib/css/common.css" rel="stylesheet" type="text/css" />  
    <script src="<%=basePath%>liger/lib/js/common.js" type="text/javascript"></script>   
    <script src="<%=basePath%>liger/lib/js/LG.js" type="text/javascript"></script>
    <script src="<%=basePath%>liger/lib/js/ligerui.expand.js" type="text/javascript"></script>  
    <script src="<%=basePath%>liger/lib/json2.js" type="text/javascript"></script>
    <script src="<%=basePath%>liger/lib/ligerUI/js/plugins/ligerTextBox.js" type="text/javascript"></script> 
    <script src="<%=basePath%>liger/lib/js/ligerui.expand.js" type="text/javascript"></script>
    
    <script src="<%=basePath%>liger/lib/jquery-validation/jquery.validate.min.js" type="text/javascript"></script> 
    <script src="<%=basePath%>liger/lib/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
    <script src="<%=basePath%>liger/lib/jquery-validation/messages_cn.js" type="text/javascript"></script>
    <script src="<%=basePath%>liger/lib/jquery.form.js" type="text/javascript"></script>

    <script src="<%=basePath%>liger/lib/js/iconselector.js" type="text/javascript"></script> 
    
    <script src='<%=basePath%>dwr/engine.js' type='text/javascript' ></script>
  	<script src='<%=basePath%>dwr/util.js' type='text/javascript' ></script>
  	<script src='<%=basePath%>dwr/interface/NewsAction.js' type='text/javascript' ></script>
  	<script src='<%=basePath%>dwr/interface/ColumnAction.js' type='text/javascript' ></script>
  	
  	
    <style type="text/css">
    .l-panel td.l-grid-row-cell-editing { padding-bottom: 2px;padding-top: 2px;}
    </style>
</head>
<body style="padding:2px;height:100%; text-align:center;">
  <input type="hidden" name="MenuNo" value="NewsGridTable"/>
  <div id="layout">
     <!--
    <div position="left" title="主菜单模块" id="mainmenu" style="width:100%;height:95%;overflow: auto;">
        <ul id="maintree"></ul>
     </div>
     
    <div position="center" title="子菜单列表"> 
     -->
     
        <form id="mainform">
				<DIV class=l-panel-search style="border: none;">
					<DIV class=l-panel-search-item>文章栏目</DIV>
					<DIV class=l-panel-search-item id="selectLm">
					
					</DIV>
					<DIV class=l-panel-search-item>标题：</DIV>
					<DIV class=l-panel-search-item>
						<INPUT id="bt" name="bt" type="text" class="l-text" style="width: 200px;"  ltype="text">
					</DIV>
					<DIV class=l-panel-search-item>
						<DIV style="WIDTH: 100px" id=searchbtn class=l-btn  ligeruiid="searchbtn" onclick="search();">
							搜索
							<DIV class=l-btn-l></DIV>
							<DIV class=l-btn-r></DIV>
							<SPAN></SPAN>
						</DIV>
					</DIV>
				</DIV>
				<div id="maingrid"  style="margin:2px;"></div> 
        </form>
    </div>
  <%--</div>--%>
  <ul class="iconlist">
  </ul>

  <script type="text/javascript">

  	var str = "<select id=\"selectLanmu\" onchange=\"search()\" value=''><option value=''>全部栏目</option>";
	ColumnAction.columnSelectList(function(data){
		document.getElementById("selectLm").innerHTML = str + data + "</select>"
			
	});

      var dialog ;
      
  
      //验证
      var maingform = $("#mainform");
      $.metadata.setType("attr", "validate");
      LG.validate(maingform, { debug: true });
      //覆盖本页面grid的loading效果
      //LG.overrideGridLoading(); 

      function itemclick(item)
      {
          var editingrow = grid.getEditingRow();
          switch (item.text)
          {
              case "增加":
                  if (editingrow == null) {
                      
                      //top.f_addTab(null, '增加新闻信息', '<!%=basePath%>admin/app/news/newsDetail.jsp?newsType='+newsType);
                     dialog = $.ligerDialog.open({ url: '<%=basePath%>admin/app/news/newsDetail.jsp', 
                           height: 600,width: 900,showMax: true, showToggle: true,  showMin: true, title:'增加新闻信息'
					  });
                  } else
                  {
                      LG.tip('请先提交或取消修改');
                  }
                  break;
              case "修改":
             	  var selected = grid.getSelected();
                  if (!selected) { LG.tip('请选择行!'); return }
                  
               	  dialog = $.ligerDialog.open({ url: '<%=basePath%>newsUpdate?news.n_xh=' + selected.n_xh, 
                         height: 600,width: 900,showMax: true, showToggle: true,showMin:true,title:'修改新闻信息'
				  });

                  break;
              case "查看":
            	  var selected = grid.getSelected();
                  if (!selected) { LG.tip('请选择行!'); return }
                  dialog = $.ligerDialog.open({ url: '<%=basePath%>newsView?news.n_xh=' + selected.n_xh, 
                      height: 600,width: 900,showMax: true, showToggle: true,  showMin: true
				  });
                  break;
              case "删除": 
            	  var selected = grid.getSelected();
            	  if (!selected) { LG.tip('请选择行!'); return }
                  $.ligerDialog.confirm('确定删除吗?', function (confirm) {
                      if (confirm)
                          f_delete();
                  });
                  break;
              case "置顶": 
                  $.ligerDialog.confirm('确定置顶吗?', function (confirm) {
                      if (confirm)
                          f_operate('zd','1');
                  });
                  break;
              case "取消置顶": 
                  $.ligerDialog.confirm('确定取消置顶吗?', function (confirm) {
                      if (confirm)
                          f_operate('zd','0');
                  });
                  break;
              case "高亮": 
                  $.ligerDialog.confirm('确定高亮吗?', function (confirm) {
                      if (confirm)
                    	  f_operate('gl','1');
                  });
                  break;
              case "取消高亮": 
                  $.ligerDialog.confirm('确定取消高亮吗?', function (confirm) {
                      if (confirm)
                    	  f_operate('gl','0');
                  });
                  break;
              case "推荐": 
                  $.ligerDialog.confirm('确定推荐吗?', function (confirm) {
                      if (confirm)
                    	  f_operate('tj','1');
                  });
                  break;
              case "取消推荐": 
                  $.ligerDialog.confirm('确定取消推荐吗?', function (confirm) {
                      if (confirm)
                    	  f_operate('tj','0');
                  });
                  break;
          }
      }
      function search(){
    	  var newsType = document.getElementById("selectLanmu").value;
          var btValue = document.getElementById("bt").value;
          grid.changePage("first"); 
          grid.setOptions({parms:[{name:'news.c_lm',value:newsType},{name:'news.c_bt',value:btValue}]});
          grid.loadData();
  	  }
      
      function dialog_hidden()
      {
    	  dialog.hidden();
      }

      
      function f_reload()
      {
    	  search();
          //loadGrid(newsType);
      }
      function f_delete()
      { 
          var selected = grid.getSelected();
          if (selected)
          {
              if (!selected.MenuID)
              {
                  //grid.deleteRow(selected);
                  //return;
                  NewsAction.newsDelete(selected.n_xh, function (data){
      	   	    	 if(data == 'success'){
      	   	    		LG.showSuccess('删除成功');
      	                //f_reload();
      	                search();
      	    	     } else {
      	    	    	LG.showSuccess('删除失败');
      	 	    	 }
      	   	      });
              }
          }
          else
          {
              LG.tip('请选择行!');
          }
      }

      function f_operate(operateType,value){
          
    	  var selected = grid.getSelected();
    	  //alert(selected.c_sfzd); return;
          if (selected){
	    	  NewsAction.newsOperate(operateType , value, selected.n_xh, function (data){
	   	    	 if(data == 'success'){
	   	    		LG.showSuccess('操作成功');
	   	    		//loadGrid(newsType);
	   	    		search();
	    	     }
	   	      });
          }else{
        	  LG.tip('请选择行!');
          }
      }
      
      var toolbarOptions = { 
        items: [ 
            { text: '增加', click: itemclick , img:"<%=basePath%>liger/lib/icons/silkicons/add.png"}, 
            { line:true },
            { text: '修改', click: itemclick, img: "<%=basePath%>liger/lib/icons/miniicons/page_edit.gif" },
            { line: true },
			/****
            //{ text: '保存', click: itemclick, img: "<!%=basePath%>liger/lib/icons/silkicons/page_save.png" },
            //{ line: true },
            //{ text: '取消', click: itemclick, img: "<!%=basePath%>liger/lib/icons/silkicons/cancel.png" },
            //{ line: true },
            ****/
            { text: '查看', click: itemclick, img: "<%=basePath%>liger/lib/icons/silkicons/application_view_detail.png" },
            { line: true },
            { text: '删除', click: itemclick, img: "<%=basePath%>liger/lib/icons/miniicons/page_delete.gif" },
            { line: true },
            { text: '置顶', click: itemclick, img: "<%=basePath%>liger/lib/icons/silkicons/arrow_up.png" },
            { line: true },
            { text: '取消置顶', click: itemclick, img: "<%=basePath%>liger/lib/icons/silkicons/arrow_down.png" },
            { line: true },
            /****
            { text: '高亮', click: itemclick, img: "<!%=basePath%>liger/lib/icons/silkicons/star.png" },
            { line: true },
            { text: '取消高亮', click: itemclick, img: "<!%=basePath%>liger/lib/icons/silkicons/star_01.png" },
            { line: true },
            ****/
            { text: '推荐', click: itemclick, img: "<%=basePath%>liger/lib/icons/silkicons/flag_red.png" },
            { line: true },
            { text: '取消推荐', click: itemclick, img: "<%=basePath%>liger/lib/icons/silkicons/flag_yellow.png" }
        ]
    };

    var currentMenuParentNo;
    var treefilter = {
        op: 'or',
        rules: [
        { field: 'MenuParentNo', value: '', op: 'equal' },
        { field: 'MenuParentNo', op: 'isnull' }
        ]
    };
	
    <%--
    var tempdata={};
    
    var tree = $("#maintree").ligerTree({
        checkbox: false,
        onClick: function (node)
        {
            if (!node.data.value) return;
            var where = {
                op: 'and',
                rules: [{ field: 'MenuParentNo', value: node.data.value, op: 'equal'}]
            };
            newsType =  node.data.value;
            currentMenuParentNo = node.data.value;
            loadGrid(newsType);
            //grid.set('parms', { where: JSON2.stringify(where) });
            //grid.set('data', tempdata);
        }
    });

    NewsAction.getNewsLanmuCombox(function(data){
    	tree.setData(eval(data));
    });
    --%>
    <%----%>
    var layout = $("#layout").ligerLayout({ leftWidth: 140 });


    
    var newsdata = '';

    /**
    NewsAction.newsList(function (data){
       // alert($d(data));
    	newsdata = JSON2.stringify(data);
    	alert(JSON2.stringify(data));
    });
    **/
    
    $.ligerDefaults.Grid.formatters['statueType'] = function (num, column) {
	    //num 当前的值
		//column 列信息
    	if(num == '1'){
    		if(column.name == 'c_sftj'){
				return "<div style='width:100%;height:100%;'><img src='<%=basePath%>liger/lib/icons/silkicons/flag_red.png' /></div>";
    		} else if(column.name == 'c_sfzd'){
			 	return "<div style='width:100%;height:100%;'><img src='<%=basePath%>liger/lib/icons/silkicons/arrow_up.png' /></div>";
    		}
    	}
	};

	var grid = $("#maingrid") .ligerGrid( {
		//headerImg:" <%=basePath%>liger/lib/icons/silkicons/table.png",title:'表格表头',
        columns: [
                { display: '序号', name: 'n_xh', align: 'left', width: 70, minWidth: 70, 
                validate: { required: true }  ,
                editor: { type: 'hidden' }
                },
                { display: '新闻标题', name: 'c_bt', align: 'left', width: 350, minWidth: 100, 
                validate: { required: true }, 
                editor: { type: 'text' }
                },
                { display: '发布时间', name: 'd_fbsj', align: 'left', width: 100, minWidth: 60, 
                validate: { required: true },
                editor: { type: 'text' }
                },{
                	display: '置顶',
					name: 'c_sfzd',
					type:'statueType',
					align: 'center', width: 60
					//hide : '1'
                },{
                	display: '推荐',
                	//hide : '1',
					name: 'c_sftj',
					align: 'center', width: 60,
					type:'statueType' 
                }], 
                dataAction: 'server', pageSize: 20, toolbar: toolbarOptions, sortName: 'MenuID',
		        width: '98%', height: '100%', heightDiff: -5, checkbox: false, usePager: true, enabledEdit: true, 
		        clickToEdit: false, fixedCellHeight: true, rowHeight: 25,rownumbers:true,
		        url:'<%=basePath%>newsPageList',parms:[{name:'news.c_lm',value:''},{name:'news.c_bt',value:''}]
		        
    });

    grid.bind('beforeSubmitEdit', function (e) {
        if (!LG.validator.form()) {
            LG.showInvalid();
            return false;
        }
        return true;
    });
    
    grid.bind('afterSubmitEdit', function (e) {
        
        var isAddNew = e.record['__status'] == "add";
        var data = $.extend({ MenuParentNo: currentMenuParentNo }, e.newdata);
        if (!isAddNew)
            data.MenuID = e.record.MenuID;
        LG.ajax({
            loading: '正在保存数据中...',
            type: 'AjaxSystem',
            method: isAddNew ? "AddMenu" : "UpdateMenu",
            data: data,
            success: function ()
            {
                //loadGrid(newsType);
                search();
                LG.tip('保存成功!');
            },
            error: function (message)
            {
                LG.tip(message);
            }
        }); 
    }); 
    //loadData();
    //loadGrid(newsType);

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
	
    function loadGrid(newsType){
        //if(newsType == undefined || newsType == ''){
		//	newsType = '1';
        //}
        var newsType = document.getElementById("selectLanmu").value;
        var btValue = document.getElementById("bt").value;
    	NewsAction.newsList(newsType,btValue,'',function (data){
  	    	//newsdata = JSON2.stringify(data);
  	    	for(var i=0;i<data.Rows.length;i++){
  	    		var rowData = "<div style='width:100%;height:100%;'>";
				var sfzd = data.Rows[i].c_sfzd;
				var sfgl = data.Rows[i].c_sfgl;
				var sftj = data.Rows[i].c_sftj;
				if(sfzd == '1'){
					rowData += "<span style=width:33%><img src='<%=basePath%>liger/lib/icons/silkicons/arrow_up.png'/>置顶&nbsp;&nbsp;</span>";
			    }else {
					rowData += "<span style=width:33%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>";
				}
				/**
				if(sfgl == '1'){
					rowData += "<img src='<!%=basePath%>liger/lib/icons/silkicons/star.png'/>高亮&nbsp;&nbsp;";
				}else {
					rowData += "<span style=width:33%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>";
				}
				**/
				if(sftj == '1'){
					rowData += "<img src='<%=basePath%>liger/lib/icons/silkicons/flag_red.png'/>推荐&nbsp;&nbsp;";
				}else {
					rowData += "<span style=width:33%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>";
				}
				rowData += "</div>";
				data.Rows[i].operate = rowData;
  	  	  	}
  	    	grid.setOptions({data:data});
  	    });
    }

  </script>
</body>
</html> 
