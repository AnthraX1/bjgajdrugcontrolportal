﻿<%@page import="com.unis.app.news.service.NewsService"%>
<%@page import="com.unis.app.news.model.News"%>
<%@page import="com.unis.app.limit.service.ClxxSvc"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="org.apache.commons.lang.xwork.StringUtils"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String c_lm = (String)request.getParameter("news.c_lm");
if(c_lm == null){
	c_lm = "";
}

String c_bt = (String)request.getParameter("news.c_bt");
if(c_bt == null){
	c_bt = "";
}

 
 String n_xh = (String)request.getParameter("n_xh");
 if(n_xh == null){
	 n_xh = "0";
 }
 
 ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
 NewsService newsService= (NewsService) ctx.getBean("newsService");
 
 News news=new News();
 news.setN_xh(n_xh);


 news= (News)newsService.selectOne("NewsMapper.getIndexNews", news);
 
 
 

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>北京禁毒信息系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/newCss.css"/>
	<LINK rel=stylesheet type=text/css href="<%=basePath%>css/szxue.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/nav.css">
	<link rel="stylesheet" rev="stylesheet" href="css/comic.css" type="text/css" media="all" />
	<script type="text/javascript" src="<%=basePath%>js/date.js"></script>
	
	<script type="text/javascript" src="<%=basePath%>js/menu.js"></script>
	
	
	<script type="text/javascript" src="<%=basePath%>video/ckplayer/ckplayer.js" charset="utf-8"></script>
	
	

	
	
	<style type="text/css">
		body { padding:0px; margin:0px; }
		.demo { width:549px; height:auto; display:block; overflow:hidden; zoom:=1;
		}
		.STYLE1 {
			font-size: 24px;
			font-weight: bold;
		}
		.STYLE2 {color: #999999}
	</style>
	<script type="text/javascript">
	
		function search(){
			if(document.all["news.c_bt"].value != '请输入您想搜索的内容'){
				document.getElementById("searchForm").submit();
			}else{
				alert('请输入查询关键字');
				return false;
			}
		}
		
		function searchSubmit(pageNo){
			var searchForm=document.getElementById("searchForm");
			
			with(searchForm){
				action="<%=basePath%>newsCenterList?pageNo="+pageNo;
				submit();
			}
		}
		
		//alert('<%=news.getN_xh()  %>');
	</script>

  </head>
  
  <body>
<div id="container_news">
	<div id="banner_top" style="padding-left: 1px;">
			<div style="margin-left: 1px; padding-top: -10px; padding-left: 50px; width: 86px; float: left;">
		      <object type="application/x-shockwave-flash" data="<%=basePath%>flash/banner_t1.swf" width="96" height="96">
				<param name="movie" value="<%=basePath%>flash/banner_t1.swf" />
				<param name="wmode" value="transparent" />
			  </object>
		    </div>
			<div style="margin-left: 200px; padding-top:20px; padding-left: 1px; width: 418px; float: right;">
		      <object type="application/x-shockwave-flash" data="<%=basePath%>flash/banner_t.swf" width="418" height="53" wmode="transparent">
				<param name="movie" value="<%=basePath%>flash/banner_t.swf" />
				<param name="wmode" value="transparent" />
			  </object>
		    </div>
		  <div id="favor" style="margin-top:8px; height:20px; ">
		  	<img src="<%=basePath%>newimages/4.png" width="15" height="12" />
		  	<a href="#" onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('<%=basePath%>');" ><font color="white">设为首页</font></a>&nbsp;
		  	<img src="<%=basePath%>newimages/2.png" width="18" height="14" />&nbsp;
		  	<a href="#" onclick="window.external.AddFavorite('<%=basePath%>', '北京禁毒信息网');" ><font color="white">加入收藏</font></a>
		  </div>
		 
		</div>
	  		
    <div id="banner_bottom"  style="margin-left:2px;">
	  <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="978" height="152">
        <param name="movie" value="<%=basePath%>flash/Banner.swf" />
        <param name="quality" value="high" />
        <embed src="flash/Banner.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="978" height="152"></embed>
      </object>
   </div>
  <div class="menu">
	    <a href="<%=basePath%>">首页</a>
	    <a href="http://www.xxzx.bj">信息查询</a> 
	    <a href="http://www.anquan.zx.bj">信息安全</a> 
	    	    <a href="<%=basePath%>newsCenterList?news.c_lm=12390&pageNo=1">视频在线</a> 
	    <a href="ftp://ftp.jdc.bj">工作交流</a> 
	    <a href="<%=basePath%>newsCenterList?news.c_lm=1291&pageNo=1">光荣榜</a> 
	    <a href="<%=basePath%>newsCenterList?news.c_lm=1297&pageNo=1">学习专栏</a>
	    <a href="<%=basePath%>newsCenterList?news.c_lm=1214&pageNo=1" onMouseOver="mouseover(this, 1)" onmouseout="mouseout()">法律法规</a> 
	    <a href="<%=basePath%>newsCenterList?news.c_lm=1286&pageNo=1">纪检监察</a> 
	</div>
		
	<div class="menu-list" id="menu1" onmouseover="_mouseover()" onmouseout="_mouseout()">
	  <ul>
	      <li><a href="<%=basePath%>newsCenterList?news.c_lm=1305&pageNo=1"><span>法律汇编</span></a> </li>
	      <li><a href="<%=basePath%>newsCenterList?news.c_lm=1209&pageNo=1"><span>法规汇编</span></a> </li>
	      <li><a href="<%=basePath%>newsCenterList?news.c_lm=1307&pageNo=1"><span>规章汇编</span></a></li> 
	      <li><a href="<%=basePath%>newsCenterList?news.c_lm=1312&pageNo=1"><span>规范性文件</span></a></li>
	  </ul>
	</div>
		
	<div id="search_bar">
		<div style="float:left; padding-top:5px;margin-left:20px;">
			<img src="<%=basePath%>newimages/3.png" width="16" height="16" />&nbsp;<strong>&nbsp;今天是：</strong>
			<script type="text/javascript">
				WriteFullDate();
			</script>
		</div>
		<div style="float:left; padding-top:5px;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="<%=basePath%>newimages/12312.jpg"
				width="14" height="13" />&nbsp;&nbsp;<strong>车辆限行尾号：</strong>
					<%
					ClxxSvc clxxSvc= (ClxxSvc) ctx.getBean("clxxSvc");
					out.print(clxxSvc.getWh());
					%>
		</div>
		<div style="float:right; width:270px;">
			<div style="float:left;">
			<form id="searchForm"  method="post" >
				<input name="news.c_lm" type="hidden" value="<%=c_lm %>"/>
				<input onFocus="if (value =='请输入您想搜索的内容'){value =''}" onblur="if (value ==''){value='请输入您想搜索的内容'}"
					value="<%=c_bt %>" type="text" name="news.c_bt"
					style="background-image:url(<%=basePath%>newimages/ss.png); border:0px; padding-left:35px; background-repeat:no-repeat; padding-top:5px;BORDER: #A9cfe5 1px solid;  height:24px; width:162px; " />
				<input type="button" onclick="search();" style="border:0px; margin-left:10px; height:24px; width:52px;background-image:url(<%=basePath%>newimages/ssb.png); padding-top:4px; " />
			</form>
			</div>
		</div>
	</div>
	
		<div id="menu_list_left">
			
			<div class="menu_div">
				<div class="menu_title">
				</div>				
				<div class="menu_content_list">
					<ul>
						<li><a href='<%=basePath%>newsCenterList?news.c_lm=1101&pageNo=1'><img src="<%=basePath%>newimages/menu_1.png" /></a></li>
					</ul>
					<ul>
						<li><a href='<%=basePath%>newsCenterList?news.c_lm=1188&pageNo=1'><img src="<%=basePath%>newimages/menu_2.png" /></a></li>
					</ul>
					<ul>
						<li><a href='<%=basePath%>newsCenterList?news.c_lm=1102&pageNo=1'><img src="<%=basePath%>newimages/menu_3.png" /></a></li>
					</ul>
                    <ul>
						<li><a href='<%=basePath%>newsCenterList?news.c_lm=1103&pageNo=1'><img src="<%=basePath%>newimages/menu_4.png" /></a></li>
					</ul>
					<ul>
						<li><a href='<%=basePath%>newsCenterList?news.c_lm=1104&pageNo=1'><img src="<%=basePath%>newimages/menu_5.png" /></a></li>
					</ul>
                    <ul>
						<li><a href='<%=basePath%>newsCenterList?news.c_lm=1105&pageNo=1'><img src="<%=basePath%>newimages/menu_6.png" /></a></li>
					</ul>
					<ul>
						<li><a href='<%=basePath%>newsCenterList?news.c_lm=1267&pageNo=1'><img src="<%=basePath%>newimages/menu_7.png" /></a></li>
					</ul>
					<ul>
						<li><a href='<%=basePath%>newsCenterList?news.c_lm=1107&pageNo=1'><img src="<%=basePath%>newimages/menu_8.png" /></a></li>
					</ul>
					<ul>
						<li><a href='<%=basePath%>newsCenterList?news.c_lm=1106&pageNo=1'><img src="<%=basePath%>newimages/menu_9.png" /></a></li>
					</ul>
				</div>
			</div>
			<div id="ljcsc">
					<a href='<%=basePath%>newsCenterList?news.c_lm=1108&pageNo=1'><img src="<%=basePath%>newimages/menu_ljksc.png" /></a>
			</div>
			<div id="gzjdts">
					<a href='<%=basePath%>newsCenterList?news.c_lm=1100&pageNo=1'><img src="<%=basePath%>newimages/menu_gzjdts.png" /></a>
			</div>
			<!-- 
            <div class="tztb_div" style="height:140px;">
				<div class="tztb_title">
					<div class="tztb_title_content">
						<div class="tztb_title_img"><img src="<%=basePath%>newimages/content_title_img.png" /></div>
						<div class="tztb_title_font">通知通告</div>
					</div>
				</div>
                 <div class="tztb_content_list">
                    <ul>
						<li><img src="<%=basePath%>newimages/dote.gif" style="margin-top:6px;"/> 全市发展和改革工作</li>
					</ul>
					<ul>
						<li><img src="<%=basePath%>newimages/dote.gif" style="margin-top:6px;"/> 全市发展和改革工作</li>
					</ul>
                    <ul>
						<li><img src="<%=basePath%>newimages/dote.gif" style="margin-top:6px;"/> 全市发展和改革工作</li>
					</ul>
					<ul>
						<li><img src="<%=basePath%>newimages/dote.gif" style="margin-top:6px;"/> 全市发展和改革工作</li>
					</ul>
					<ul>
						<li><img src="<%=basePath%>newimages/dote.gif" style="margin-top:6px;"/> 全市发展和改革工作</li>
					</ul>
					<ul>
						<li><img src="<%=basePath%>newimages/dote.gif" style="margin-top:6px;"/> 全市发展和改革工作</li>
					</ul>
					<ul>
						<li><img src="<%=basePath%>newimages/dote.gif" style="margin-top:6px;"/> 全市发展和改革工作</li>
					</ul>
                 </div>
			</div>
			 -->
		</div>
		
		<div id="news_center">
			<div class="news_center_title">
				<div class="news_center_title_font">视频在线</div>
				<div class="news_center_title_more">
					<font color="#DF7024" size="2"><a href="<%=basePath%>video/dynamic_flash_video_gallery.swf">您现在所在的位置</a>： 首页&nbsp;&gt;&gt;&nbsp;视频在线</font>
				</div>
			</div>
			<div class="">
<div style="font-size: 24px; font-weight:800; color:#F00; margin-top: 20px;line-height: 50px;"><%=news.getC_bt() %></div>
<div id="" style="margin-top: 40px">
<div id="ckplayer_a1_div" ></div>

<script type="text/javascript">
	var flashvars={
			f:'<%=basePath+news.getC_spljdz() %>',
			c:'0'
			};
			var params={bgcolor:'#000000',allowFullScreen:true,allowScriptAccess:'always'};
			var attributes={id:'ckplayer_a1',name:'ckplayer_a1'};
			swfobject.embedSWF('<%=basePath%>video/ckplayer/ckplayer.swf', 'ckplayer_a1_div', '600', '400', '10.0.0','<%=basePath%>video/ckplayer/expressInstall.swf', flashvars, params, attributes);
		</script>
	
</div>



					</div>
			</div>
			<div id="bottom_blue_line"></div>
			<div id="bottom">
				<div id="bottom_left">
					北京市公安局禁毒总队办公室维护<br />
					推荐使用Internet Explorer 7.0 版本Web浏览器，1024*768分辨率 浏览本站<br />
					Copyright © 2002-2012 北京市公安局禁毒总队 版权所有<br />
				</div>
				<div id="bottom_right" style="text-align: left;">
					在线人数：2<br /> 信息总数：46033<br /> 总访问次数：10325
				</div>
			</div>
	</div>
</div>
</body>
</html>
