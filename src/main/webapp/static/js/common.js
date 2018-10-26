function formatOperation(val, row)
{
    switch (val)
    {
        case 1:
            return "开启会议";            
        case 2:
            return "结束会议";           
        case 3:
            return "音量调整";            
        case 4:
            return "日志查看";            
        case 5:
            return "日志下载 ";           
        case 6:
            return "终端升级";                                  
        default:
            break;
    }
}

function formatDeviceState(val, row)
{
	switch (val)
	{
	case 0:
		return "未下发";		
	case 1:
		return "下发中";
	case 2:
		return "下发成功";
	case 3:
	    return "下发失败";
	case 4:
		return "执行成功";
	case 5:
	    return "执行失败";
	case 6:
		return "类型错误";
	}
}

function formatIsOnline(val, row)
{
	if (val == 1)
	{
		return "在线";
		}
	else 
    {
    	return "离线";
    	}
}

function onlineColor(value,row,index){
    if (value == 1)
    {
    	return 'color:green;';
    	}
    else 
    {
    	return 'color:red;';
    	}
}

function formatDeviceOnline(val, row)
{
	//alert(val);
    if (val == 1)
    {
        return "在线";
    }
    else if (val == 2)
    {
        return "培训模式";
    }
    else
    {
    	return "离线";
    }
}

function deviceOnlineColor(value,row,index){
	//alert(value);
	   if (value == 1){
		   return 'color:green;';
	   }
	   else if (value == 2)
	   {
	       return 'color:blue;';
	   }
	   else
	   {
		   return 'color:red;';
	   }
}

//资源类型允许上传的最大资源数
var maxLimitFilesCounts = [0,15,1,5,20,5,1,1,5,1];


function formatProType(val){
	
	if(1 == val){
		return "X86";
	}
	if(3 == val){
		return "安卓";
	}
	if(2 == val){
		return "智能";
	}
}

//验证数字格式
function checkDigit(num)
{
	var reg = /^[0-9]*$/;
	if (reg.test(num))
	{
		return true;
	}
	else
	{
		return false;
	}
}

//弹出加载层
function load() {  
    $("<div style='z-index:99' class=\"datagrid-mask\"></div>").css({display: "block", width: "100%", height: $(window).height() }).appendTo("body");  
    $("<div style='z-index:99' class=\"datagrid-mask-msg\"></div>").html("正在执行中，请稍候。。。").appendTo("body").css({ display: "block", left: ($(document.body).outerWidth(true) - 190) / 2, top: ($(window).height() - 45) / 2 });  
}  

//取消加载层  
function disLoad() {  
    $(".datagrid-mask").remove();  
    $(".datagrid-mask-msg").remove();  
}

function getBrowserType() {

	var ua = navigator.userAgent.toLowerCase();

	   if(navigator.userAgent.indexOf("MSIE")>0) {  
	        return "MSIE";  
	   }  
	   if(isFirefox=navigator.userAgent.indexOf("Firefox")>0){  
	        return "Firefox";  
	   }  
	   if(isSafari=navigator.userAgent.indexOf("Safari")>0) {  
	        return "Safari";  
	   }   
	   if(isCamino=navigator.userAgent.indexOf("Camino")>0){  
	        return "Camino";  
	   }  
	   if(isMozilla=navigator.userAgent.indexOf("Gecko/")>0){  
	        return "Gecko";  
	   }  
	    
	
	return 0;
}

Date.prototype.pattern = function(fmt) {
    var o = {
        "M+": this.getMonth() + 1,
        //月份         
        "d+": this.getDate(),
        //日         
        "h+": this.getHours() % 12 == 0 ? 12 : this.getHours() % 12,
        //小时         
        "H+": this.getHours(),
        //小时         
        "m+": this.getMinutes(),
        //分         
        "s+": this.getSeconds(),
        //秒         
        "q+": Math.floor((this.getMonth() + 3) / 3),
        //季度         
        "S": this.getMilliseconds() //毫秒         
    };
    var week = {
        "0": "/u65e5",
        "1": "/u4e00",
        "2": "/u4e8c",
        "3": "/u4e09",
        "4": "/u56db",
        "5": "/u4e94",
        "6": "/u516d"
    };
    if (/(y+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    if (/(E+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, ((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? "/u661f/u671f": "/u5468") : "") + week[this.getDay() + ""]);
    }
    for (var k in o) {
        if (new RegExp("(" + k + ")").test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        }
    }
    return fmt;
};

//贵金属表格查询返回logo
function thrImLog(val){
	return "<img src='" + $("#httpBasePath").val() + "/thrDisplay/image/" + val + "/"+ val +".jpg' width='50px' height='54px'/>";
}