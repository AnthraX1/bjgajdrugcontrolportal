﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="<%=basePath%>liger/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>liger/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>liger/lib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />
    <script src="<%=basePath%>liger/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script> 
    <script src="<%=basePath%>liger/lib/ligerUI/js/core/base.js" type="text/javascript"></script> 
    <script src="<%=basePath%>liger/lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>
    <script src="<%=basePath%>liger/lib/ligerUI/js/plugins/ligerToolBar.js" type="text/javascript"></script>
        <script src="<%=basePath%>liger/lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
        <script src="<%=basePath%>liger/lib/ligerUI/js/plugins/ligerCheckBox.js" type="text/javascript"></script>
    <script type="text/javascript">
    
    var CustomersData = {
    		Rows : [ {
    			"CustomerID" : "上下班登记",
    			"CompanyName" : "2012-05-19 09:00",
    			"ContactName" : "上班",
    			"City" : "登记",
    		}, {
    			"CustomerID" : "上下班登记",
    			"CompanyName" : "2012-05-19 18:00",
    			"ContactName" : "下班",
    			"City" : "登记",
    		}, {
    			"CustomerID" : "外出登记",
    			"CompanyName" : "2012-05-22",
    			"ContactName" : "公事",
    			"City" : "登记",
    		}, {
    			"CustomerID" : "请假登记",
    			"CompanyName" : "2012-05-22",
    			"ContactName" : "病假",
    			"City" : "登记",
    		}, {
    			"CustomerID" : "出差登记 ",
    			"CompanyName" : "2012-05-30",
    			"ContactName" : "",
    			"City" : "登记",
    		}, {
    			"CustomerID" : "补休登记 ",
    			"CompanyName" : "2012-06-4",
    			"ContactName" : "",
    			"City" : "登记",
    		} ],
    		Total : 20
    	};
    
    
    </script>
    <script type="text/javascript">
        function itemclick(item)
        {
            alert(item.text);
        }
        $(function ()
        {
            window['g'] =
            $("#maingrid").ligerGrid({
                height:'100%',
                columns: [
                { display: '类别', name: 'CustomerID', align: 'left', width: 100, minWidth: 60 },
                { display: '时间', name: 'CompanyName', minWidth: 120 },
                { display: '内容', name: 'ContactName', minWidth: 140 },
                { display: '其他', name: 'City' }
                ], data:CustomersData,  pageSize:30 ,rownumbers:true,
                toolbar: { items: [
                { text: '填写', click: itemclick, icon: 'add' },
                { line: true }
                ]
                }
            });
             

            $("#pageloading").hide();
        });

        function deleteRow()
        {
            g.deleteSelectedRow();
        }

    </script>
</head>
<body style="overflow-x:hidden; padding:2px;">
<div class="l-loading" style="display:block" id="pageloading"></div>
 <a class="l-button" style="width:120px;float:left; margin-left:10px; display:none;" onclick="deleteRow()">删除选择的行</a>

 
 <div class="l-clear"></div>

    <div id="maingrid"></div>
   
  <div style="display:none;">
  
</div>
 
</body>
</html>