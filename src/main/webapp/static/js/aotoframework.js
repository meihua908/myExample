/*
var userAgent = navigator.userAgent.toLowerCase();
var ieVersion;

if (userAgent.indexOf("msie") > 0)
{
    alert(userAgent);
    var s = userAgent.match(/msie [\d.]+;/gi);
    ieVersion = parseInt((s + "").replace(/[^0-9.]/ig,""));
}
*/

$.i18n.properties(
{  
    name : "framework",
    path : contextPath + "/static/js/locale/",
    mode : 'map',
    cache : true,
    language : locale
});

$.ajaxSetup(
{
    cache : false,
    statusCode :
    {
        801 : function(xhr, status, e)
        {
            $.messager.alert($.i18n.prop("messager.warning"), $.i18n.prop(xhr.responseJSON), "warning");
        },
        901 : function(xhr, status, e)
        {
            window.top.location = contextPath;
        },
        500 : function(xhr, status, e)
        {
            $.messager.alert($.i18n.prop("messager.error"), $.i18n.prop(xhr.responseJSON), "error");
        }
    }
});

$.extend($.fn.validatebox.defaults.rules,
{
	keyword :
    {// 验证关键字，中文或者字母、数字、“_”、“-”、“@”、“*”、“&”、“￥”、”$”、“^”'
        validator : function(value)
        {
            return /^[\u4e00-\u9fa5a-zA-Z0-9]([\u4e00-\u9fa5_a-zA-Z0-9@*&￥\$\^-]+)?$/i.test(value);
        },
        message : '请输入正确的格式'
    },
    idCard :
    {// 验证身份证
        validator : function(value)
        {
            return /^\d{15}(\d{2}[A-Za-z0-9])?$/i.test(value);
        },
        message : '身份证号码格式不正确'
    },
    minLength :
    {
        validator : function(value, param)
        {
            return value >= param[0];
        },
        message : '请输入至少{0}个字符.'
    },
    length :
    {
        validator : function(value, param)
        {
            var len = getLength($.trim(value));
            return len >= param[0] && len <= param[1];
        },
        message : "输入内容长度必须介于{0}和{1}之间，中文占两个字节"
    },
    compareDate :
    {
        validator : function(value, param)
        {
            if(!value) return true;
            var startDateStr = $("#"+param[0]).datebox("getValue");
            var endDateStr = $("#"+param[1]).datebox("getValue");
            var startDate,endDate;
            if(startDateStr&&endDateStr){
            	startDate = new Date(Date.parse(startDateStr.replace("-", "/")));
            	endDate = new Date(Date.parse(endDateStr.replace("-", "/")));
            	if(startDate>endDate){
            		return false;
            	}
            	return true;
            }
            return true;
        },
        message : "开始日期必须小于等于结束日期"
    },
    phone :
    {// 验证电话号码
        validator : function(value)
        {
        	var res;
            return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value)||/^(13|14|15|17|18)\d{9}$/i.test(value);
            
        },
        message : '请输入手机号或固定电话'
    },
    mobile :
    {// 验证手机号码
        validator : function(value)
        {
            return /^(13|14|15|17|18)\d{9}$/i.test(value);
        },
        message : '手机号码格式不正确'
    },
    tel :
    {
    	// 验证电话号码
        validator : function(value)
        {
            return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value);
        },
        message : '格式不正确，请使用下面格式：025-89636585'
    },
    intOrFloat :
    {// 验证整数或小数
        validator : function(value)
        {
            return /^\d+(\.\d+)?$/i.test(value);
        },
        message : '请输入数字，并确保格式正确'
    },
    currency :
    {// 验证货币
        validator : function(value)
        {
            return /^\d+(\.\d+)?$/i.test(value);
        },
        message : '货币格式不正确'
    },
    qq :
    {// 验证QQ,从10000开始
        validator : function(value)
        {
            return /^[1-9]\d{4,9}$/i.test(value);
        },
        message : 'QQ号码格式不正确'
    },
    integer :
    {// 验证整数
        validator : function(value, param)
        {
            value = $.trim(value);
            len = param[0];
            
            if ("-" == value.substring(0, 1))
            {
                len++;
            }

            if (value.length <= len)
            {
                return /^\d+$/i.test(value);
            }
            
            return false;
        },
        message : '请输入整数，长度为{0}'
    },
    positiveInteger :
    {// 验证正整数
        validator : function(value, param)
        {
            value = $.trim(value);
            len = param[0];

            if (value.length <= len)
            {
                return /^[1-9]\d*$/i.test(value);
            }
            
            return false;
        },
        message : '请输入正整数，长度为{0}'
    },
    age :
    {// 验证年龄
        validator : function(value)
        {
            return /^(?:[1-9][0-9]?|1[01][0-9]|120)$/i.test(value);
        },
        message : '年龄必须是0到120之间的整数'
    },
    chinese :
    {// 验证中文
        validator : function(value)
        {
            return /^[\u4e00-\u9fa5]+$/i.test(value);
        },
        message : '请输入中文'
    },
    english :
    {// 验证英语
        validator : function(value)
        {
            return /^[A-Za-z]+$/i.test(value);
        },
        message : '请输入英文'
    },
    unnormal :
    {// 验证是否包含空格和非法字符
        validator : function(value)
        {
            return /.+/i.test(value);
        },
        message : '输入值不能为空和包含其他非法字符'
    },
    chrnum :
    {// 验证用户名
        validator : function(value)
        {
            return /^([a-zA-Z0-9]+)$/i.test(value);
        },
        message : '输入值允许字母数字'
    },    
    username :
    {// 验证用户名
        validator : function(value)
        {
            return /^[a-zA-Z0-9]{1,16}$/i.test(value);
        },
        message : '用户名不合法（允许字母数字，1-16字符）'
    },
    code :
    {// 编码
        validator : function(value)
        {
            return /^[a-zA-Z0-9]{1,16}$/i.test(value);
        },
        message : '编码不合法（允许字母数字，1-16字符）'
    },
    faxno :
    {// 验证传真
        validator : function(value)
        {
            // return /^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[
            // ]){1,12})+$/i.test(value);
            return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value);
        },
        message : '传真号码不正确'
    },
    zip :
    {// 验证邮政编码
        validator : function(value)
        {
            return /^[1-9]\d{5}$/i.test(value);
        },
        message : '邮政编码格式不正确'
    },
    ip :
    {// 验证IP地址
        validator : function(value)
        {
            return /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/i.test(value);
        },
        message : 'IP地址格式不正确'
    },
    name :
    {// 验证姓名，可以是中文或英文
        validator : function(value)
        {
            return /^[\u4e00-\u9fa5_a-zA-Z0-9]+$/i.test(value);
        },
        message : '请输入正确的格式，字母数字下划线或者中文'
    },
    date :
    {// 验证姓名，可以是中文或英文
        validator : function(value)
        {
            // 格式yyyy-MM-dd或yyyy-M-d
            return /^(?:(?!0000)[0-9]{4}([-]?)(?:(?:0?[1-9]|1[0-2])\1(?:0?[1-9]|1[0-9]|2[0-8])|(?:0?[13-9]|1[0-2])\1(?:29|30)|(?:0?[13578]|1[02])\1(?:31))|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)([-]?)0?2\2(?:29))$/i.test(value);
        },
        message : '请输入合适的日期格式'
    },
    msn :
    {
        validator : function(value)
        {
            return /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(value);
        },
        message : '请输入有效的msn账号(例：abc@hotmail(msn/live).com)'
    },
    same :
    {
        validator : function(value, param)
        {
            if ($("#" + param[0]).val() != "" && value != "")
            {
                return $("#" + param[0]).val() == value;
            }
            else
            {
                return true;
            }
        },
        message : '两次输入的密码不一致！'
    },
    password :
    {
        validator : function(value)
        {
            return /^\w{6,}$/.test(value);
        },
        message : '密码格式不正确，格式为字母、数字、下划线且至少6位'
    },
    text :
    {
        validator : function(value)
        {
            return /^([^\x00-\xff]|\w|\s)+$/i.test(value);
        },
        message : '请输入正确的格式，不能包含特殊字符'
    },
    remark :
    {//验证备注
        validator : function(value)
        {
            return /^[\u4e00-\u9fa5a-zA-Z0-9\u005f\u002d\u0040\u002a\u0026\uffe5\u0024\u005e\uff0c\u3002\uff1b\uff01\uff1f\uff1a\u201c\u201d\uff08\uff09\u0026\u006c\u0074\u003b\u0026\u0067\u0074\u003b\u2014\u2014\u2018\u2019\u005b\u005d\u2026\u2026\u0028\u0029\u002c\u002e\u003b\u0021\u003f\u003a\u0026\u0071\u0075\u006f\u0074\u003b\u300a\u300b\u3001\u3010\u3011\s\u003c\u003e\u0020\u0022\u0027]+$/i.test(value);
        },
        message : '请输入正确的格式'
    }
});
/*
function closeLoading()
{
    $("#loading").fadeOut("normal", function()
    {
        $(this).remove();
    });
}

var pc;

$.parser.onComplete = function()
{
    if (pc)
    {
        clearTimeout(pc);
    }

    pc = setTimeout(closeLoading, 100);
};
*/
function queryString(key)
{
    var search = window.location.search + '';

    if (search.charAt(0) != '?')
    {
        return null;
    }
    else
    {
        search = search.replace('?', '').split('&');

        for ( var i = 0; i < search.length; i++)
        {
            if (search[i].split('=')[0] == key)
            {
                return decodeURI(search[i].split('=')[1]);
            }
        }
        return null;
    }
}

function formatDate(val)
{
    if ($.isNumeric(val))
    {
    	return new Date(parseInt(val)).toString("yyyy-MM-dd HH:mm");
    }
    else
    {
        return "";
    }
}

function formatDol(val)
{
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

function formatDs(val)
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

function formatOpt(val)
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

/*
 * 将毫秒数转化成yyyy-MM-dd HH:mm:ss格式
 * */
var format = function(time, format){
    var t = new Date(time);
    var tf = function(i){return (i < 10 ? '0' : '') + i};
    return format.replace(/yyyy|MM|dd|HH|mm|ss/g, function(a){
        switch(a){
            case 'yyyy':
                return tf(t.getFullYear());
                break;
            case 'MM':
                return tf(t.getMonth() + 1);
                break;
            case 'mm':
                return tf(t.getMinutes());
                break;
            case 'dd':
                return tf(t.getDate());
                break;
            case 'HH':
                return tf(t.getHours());
                break;
            case 'ss':
                return tf(t.getSeconds());
                break;
        }
    })
}

function getLength(str)
{
    return str.replace(/[^\x00-\xff]/g, "rr").length;
}

function logBehavior(code, args)
{ 
    if (!logBehaviorEnabled)
    {
        return;
    }
    
    var param;
    if (null == args || 0 == args.length)
    {
        param = "code=" + code + "&args[]=";
    }
    else
    {
        param = $.param({code:code,args:args});
    }
    
    $.post(contextPath + "/system/logs/behavior", param);
}