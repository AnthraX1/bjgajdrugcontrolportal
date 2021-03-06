
/**
  *打印数据对象
  */
function $d(obj,preBlank){
	var str="";
	if(!preBlank)preBlank = "";
	switch(typeof(obj)){
		case "number":
		case "string":
		case "boolean": return obj+"\n";break;
		case "object":
		              for(var na in obj){
		              	var naStr=na.toString();
		              	if(parseInt(naStr.substr(0,1))>=0) naStr="["+na+"]";
		              	var len=naStr.length;
		              	var pre="";
		              	for(var i=0;i<len;i++)
		              	   pre+=" ";
		                str+=preBlank+naStr+":"+$d(obj[na],preBlank+pre+" ");	   
		              	
		              }
		              return "\n"+str;
		              break;
		               
	default: {
	return "undefinded\n";
	break;	}
	}
}

function pp(obj){ 
	 var str = ''; 
	 for(var o in obj){
		str += o+" : "+obj[o]+'\n'; 
	 }
	 alert(str);
	 return; 
}
//获取QueryString的数组

function getQueryString()
{
    var result = location.search.match(new RegExp("[\?\&][^\?\&]+=[^\?\&]+", "g"));
    if (result == null)
    {
        return "";
    }
    for (var i = 0; i < result.length; i++)
    {
        result[i] = result[i].substring(1);
    }
    return result;
}
//根据QueryString参数名称获取值
function getQueryStringByName(name)
{
    var result = location.search.match(new RegExp("[\?\&]" + name + "=([^\&]+)", "i"));
    if (result == null || result.length < 1)
    {
        return "";
    }
    return result[1];
}
//根据QueryString参数索引获取值
function getQueryStringByIndex(index)
{
    if (index == null)
    {
        return "";
    }
    var queryStringList = getQueryString();
    if (index >= queryStringList.length)
    {
        return "";
    }
    var result = queryStringList[index];
    var startIndex = result.indexOf("=") + 1;
    result = result.substring(startIndex);
    return result;
}

(function ($)
{

    //全局事件
    $(".l-dialog-btn").live('mouseover', function ()
    {
        $(this).addClass("l-dialog-btn-over");
    }).live('mouseout', function ()
    {
        $(this).removeClass("l-dialog-btn-over");
    });
    $(".l-dialog-tc .l-dialog-close").live('mouseover', function ()
    {
        $(this).addClass("l-dialog-close-over");
    }).live('mouseout', function ()
    {
        $(this).removeClass("l-dialog-close-over");
    });
    //搜索框 收缩/展开
    $(".searchtitle .togglebtn").live('click',function(){ 
        if($(this).hasClass("togglebtn-down")) $(this).removeClass("togglebtn-down");
        else $(this).addClass("togglebtn-down");
        var searchbox = $(this).parent().nextAll("div.searchbox:first");
        searchbox.slideToggle('fast');
    }); 

})(jQuery);

