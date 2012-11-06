<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String paths = request.getContextPath();
	String basePaths = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + paths + "/";

	session.setAttribute("userId", "10000");
%>
<link href="<%=basePaths%>css/newCss.css" type=text/css rel=stylesheet />

<!-- 弹出窗 -->
<script type="text/javascript" src="<%=basePaths%>highslide/highslide-with-html.js" />
<link rel="stylesheet" type="text/css" href="<%=basePaths%>highslide/highslide.css" />
<!-- 弹出窗 -->

<script type="text/javascript">
	hs.graphicsDir = '../highslide/graphics/';
	hs.outlineType = 'rounded-white';
	hs.wrapperClassName = 'draggable-header';
</script>

<script type="text/javascript" src="<%=basePaths%>js/lightBox.js"></script>

<script type="text/javascript">


	/*弹出内容*/
	function parahtml(url,width,height) {
		var htmls= '<iframe src="'+url+'" width='+width+' height='+height+' frameborder="0"></iframe>';
		return htmls;
	}

	/*底部样式*/
	function fontbutton(index,mag) {
		var footerhtml
		if(mag==1)//选择按钮样式
		{
		 footerhtml='<input type="image" alt="Cancel" src="<%=basePaths%>images/cancel_button.gif" class="btn" id="msg'+index+'cancel" />';	
		}else {
			footerhtml='<input type="image" alt="Cancel" src="<%=basePaths%>images/send_button.gif" class="btn" onclick=alert("Sumbited!"); />';
			footerhtml+='<input type="image" alt="Cancel" src="<%=basePaths%>images/cancel_button.gif" class="btn" id="msg'
								+ index + 'cancel" />';
		}
		return footerhtml;
	}

	$(document).ready(function() {
		$("#three-pass-one").click(function() {
			$("#three-pass-one").removeClass("three-pass");
			$("#three-pass-one").addClass("three-pass-hover");

			$("#three-pass-two").removeClass("three-pass-hover");
			$("#three-pass-two").addClass("three-pass");

			$("#three-pass-three").removeClass("three-pass-hover");
			$("#three-pass-three").addClass("three-pass");

			$(".pass-cont-one").show();
			$(".pass-cont-two").hide();
			$(".pass-cont-three").hide();
		});

		$("#three-pass-two").click(function() {

			$("#three-pass-two").removeClass("three-pass");
			$("#three-pass-two").addClass("three-pass-hover");

			$("#three-pass-one").removeClass("three-pass-hover");
			$("#three-pass-one").addClass("three-pass");

			$("#three-pass-three").removeClass("three-pass-hover");
			$("#three-pass-three").addClass("three-pass");

			$(".pass-cont-one").hide();
			$(".pass-cont-two").show();
			$(".pass-cont-three").hide();
		});

		$("#three-pass-three").click(function() {

			$("#three-pass-three").removeClass("three-pass");
			$("#three-pass-three").addClass("three-pass-hover");

			$("#three-pass-two").removeClass("three-pass-hover");
			$("#three-pass-two").addClass("three-pass");

			$("#three-pass-one").removeClass("three-pass-hover");
			$("#three-pass-one").addClass("three-pass");

			$(".pass-cont-one").hide();
			$(".pass-cont-two").hide();
			$(".pass-cont-three").show();
		});
	});
</script>

<script language="javascript">
	jQuery(function() {
		$("#changeCity").click(function(a) {
			$("#allCity").slideDown(300);
			a.stopPropagation();
			$(this).blur()
		});
		$("#allCity").click(function(a) {
			a.stopPropagation()
		});
		//$(document).click(function(a){a.button!=2&&$("#allCity").slideUp(300)});
		$("#foldin").click(function() {
			$("#allCity").slideUp(300)
		})
	});
	$(document).ready(function() {
		var nScrollHight = 0;
		var nScrollTop = 0;
		var nDivHight = $("#div1").height();
		$("#div1").scroll(function() {
			nScrollHight = $(this)[0].scrollHeight;
			nScrollTop = $(this)[0].scrollTop;
			if (nScrollTop + nDivHight >= nScrollHight) {
				;
			}
		});

	});

</script>


<% if(session.getAttribute("userId")!=null && session.getAttribute("userId")!="0"){ %>
	
<DIV class=selCity id=allCity style="display:none">
	<DIV class=area>
		<div class=bodydiv>
			<div class=headdiv>
				<div id="div1" class="headdivcenter">


					<div class="topdiv">
						<div class="imgdiv">
							<img class="imgdiv" src="<%=basePaths%>images/1.png  " />
						</div>
						<div class="font1" align="center">
							<a href="#"
								onclick='Box("msg1",900,600,parahtml("<%=basePaths%>desktop/index.jsp",900,600),fontbutton(1,1))'>我的桌面</a>
						</div>
					</div>

					<div class="topdiv">
						<div class="imgdiv">
							<img class="imgdiv" src="<%=basePaths%>images/9.png  " />
						</div>
						<div class="font1" align="center">
							<a href="<%=basePaths%>temp/news.jsp" onclick="return hs.htmlExpand(this, { objectType: 'iframe' } )">新闻管理</a>
						</div>
					</div>


					<div class="topdiv">
						<div class="imgdiv">
							<img class="imgdiv" src="<%=basePaths%>images/3.png  " />
						</div>
						<div class="font1" align="center">
							<a href="<%=basePaths%>temp/car.jsp" onclick="return hs.htmlExpand(this, { objectType: 'iframe' } )">车辆管理</a>
						</div>
					</div>

					<div class="topdiv">
						<div class="imgdiv">
							<img class="imgdiv" src="<%=basePaths%>images/8.png  " />
						</div>
						<div class="font1" align="center">
							<a href="<%=basePaths%>temp/email.jsp"
								onclick="return hs.htmlExpand(this, { objectType: 'iframe' } )">内部邮件</a>
						</div>
					</div>

					<div class="topdiv">
						<div class="imgdiv">
							<img class="imgdiv" src="<%=basePaths%>images/2.png  " />
						</div>
						<div class="font1" align="center">
							<a href="<%=basePaths%>temp/duty.jsp"
								onclick="return hs.htmlExpand(this, { objectType: 'iframe' } )">考勤情况</a>
						</div>
					</div>


					<div class="topdiv">
						<div class="imgdiv">
							<img class="imgdiv" src="<%=basePaths%>images/4.png  " />
						</div>
						<div class="font1" align="center">
							<a href="<%=basePaths%>temp/blog.jsp"
								onclick="return hs.htmlExpand(this, { objectType: 'iframe' } )">工作日志</a>
						</div>
					</div>
					<!-- 
					<div class="topdiv">
					<div class="imgdiv"  >
					<img  class="imgdiv"   src="<!%=basePaths%>images/5.png  "/></div >
					<div   class="font1"  align="center"><a href="#" onclick='Box("msg5",900,600,parahtml(900,600),fontbutton(5,1));'>工作计划</a></div>
					</div>
					 -->

					<div class="topdiv">
						<div class="imgdiv">
							<img class="imgdiv" src="<%=basePaths%>images/6.png  " />
						</div>
						<div class="font1" align="center">
							<a href="<%=basePaths%>temp/message.jsp"
								onclick="return hs.htmlExpand(this, { objectType: 'iframe' } )">内部消息</a>
						</div>
					</div>


					<!-- 
					<div class="topdiv">
						<div class="imgdiv">
							<img class="imgdiv" src="<%=basePaths%>images/7.png  " />
						</div>
						<div class="font1" align="center">
							<a href="<%=basePaths%>temp/nbyj.jsp"
								onclick="return hs.htmlExpand(this, { objectType: 'iframe' } )">手机短息</a>
						</div>
					</div>
					 -->


				</div>
			</div>
		</div>

		<div class=none>
			<a id=foldin href="javascript:;">收起</a>
		</div>
	</div>
</div>
<div class=header>
	<div class=area>
		<div class=r>
			<div class="topCtiy clear">
				<ul>
					<LI class=i2 id=changeCity>我的工作区</LI>
				</ul>
			</div>
		</div>
	</div>
</div>

<%
} 
%>
