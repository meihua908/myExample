$(function()
{
    $meetingSubject = $("#meetingSubject");
    $meetingNo = $("#meetingNo");
    
    $btnEditMeeting = $("#btnEditMeeting");
    $btnRemoveMeeting = $("#btnRemoveMeeting");
    $btnNewMeeting = $("#btnNewMeeting");
    $btnMeetingDetail = $("#btnMeetingDetail");
    
    //$btnNewMeeting.attr("disabled","disabled");
    $btnEditMeeting.attr("disabled","disabled");
    $btnRemoveMeeting.attr("disabled","disabled");
    $btnMeetingDetail.attr("disabled","disabled");
    $dgUnselectedClerk = $("#dgUnselectedClerk").datagrid("clearSelections");
    
    $dgMeeting = $("#dgMeeting").datagrid({
        onSelect : function(rowIndex, rowData)
        {
            enableToolbar();
        },
        onUnselect : function(rowIndex, rowData)
        {
            enableToolbar();
        },
        onSelectAll : function(rows)
        {
            enableToolbar();
        },
        onUnselectAll : function(rows)
        {
            enableToolbar();
        }
    });
    
    enableToolbar();
    
  //初始化查询会议状态下拉框
    $("input[name='selectMeetingStatus']").combobox({
    	url : contextPath + "/terminal/devices/dicData?dicType=selectMeetingStatus" ,//根据dicKey获取dicValue
    	method : 'get',
    	valueField : 'dicKey',
    	textField : 'dicValue',
    	panelHeight:'auto',
    	onLoadSuccess : function(){
    		$(this).combobox('setValue','4');//默认为全部
    	},
    	onChange : function(n,o){
    		searchMeeting();
    	}
    });
    
    
	  
});

function enableToolbar()
{
    var length = $dgMeeting.datagrid("getSelections").length;
    if (1 == length)
    {
        $btnEditMeeting.linkbutton("enable");
        $btnRemoveMeeting.linkbutton("enable");
        $btnNewMeeting.linkbutton("enable");
        $btnMeetingDetail.linkbutton("enable");
        
        $btnNewMeeting.removeAttr("disabled");
        $btnEditMeeting.removeAttr("disabled");
        $btnMeetingDetail.removeAttr("disabled");
        $btnRemoveMeeting.removeAttr("disabled");
    }
    else if(0 == length)
    {
    	$btnEditMeeting.linkbutton("disable");
    	$btnRemoveMeeting.linkbutton("disable");
    	$btnMeetingDetail.linkbutton("disable");
    	$btnMeetingDetail.attr("disabled","disabled");
    	$btnEditMeeting.attr("disabled","disabled");
    	$btnRemoveMeeting.attr("disabled","disabled");
    }
    
    else if (length > 1)
    {
        $btnRemoveMeeting.linkbutton("enable");
        $btnRemoveMeeting.removeAttr("disabled");
        $btnMeetingDetail.linkbutton("disable");
    	$btnMeetingDetail.removeAttr("disabled");
        $btnEditMeeting.linkbutton("disable");
        $btnEditMeeting.removeAttr("disabled");
    }
}

//按下enter键查询
function searchByEnter(id){
	document.onkeydown=function(event){
        var e = event || window.event || arguments.callee.caller.arguments[0];       
         if(e && e.keyCode==13){ // enter 键
        	 searchMeeting();
        }
    }; 
	//searchMeeting();
}

function searchMeeting()
{
    logBehavior("log.behavior.page.query", ["meeting.title","role.list"]);
    loadMeetings();
}

function loadMeetings()
{
    $dgMeeting.datagrid("clearSelections");
    console.log("loading meeting");
    var param = {};
    param.meetingSubject = encodeURIComponent($("input[name='meetingSubject']").val());
    param.meetingNo = $("input[name='meetingNo']").val();
    param.status = $("input[name='selectMeetingStatus']").val();
    param.beginDate = $("#beginDate").datebox("getValue");
    param.endDate = $("#endDate").datebox("getValue");
    $dgMeeting.datagrid("load", param);
}

// new meeting


function newMeeting()
{
    logBehavior("log.behavior.dialog.open", ["role.list", "new"]);
    var $dlgNewMeeting;
    if (!$dlgNewMeeting)
    {
    	$dlgNewMeeting = $("<div style='padding: 15px 15px; overflow: hidden;' id='dlgNewMeeting' />");
    	$dlgNewMeeting.dialog(
        {
            closed : true,
            modal : true,
            cache : true,
            title : $.i18n.prop("会议安排"),
            width : 410,
            height : 550,
            href : contextPath + "/meeting/new",
            buttons : [
            {
                text : $.i18n.prop("submit"),
                iconCls : "icon-ok",
                handler : function()
                {
                	$(".datagrid-mask").css({"z-index":200,display:"block",width:"100%",height:550});
                    //$(".datagrid-mask-msg").css({display:"block",left:($dlgNewMeeting.outerWidth(true) - 190) / 2,top:($(window).height() - 200) / 2});
                    $(".datagrid-mask-msg").css({display:"block",left:104,top:200});
                    $frmNewMeeting.form("enableValidation");
                    
                    if (!$frmNewMeeting.form("validate"))
                    {
                        logBehavior("log.behavior.dialog.invaild", ["role.new"]);
                        $(".datagrid-mask").hide();
        				$(".datagrid-mask-msg").hide();
                        return;
                    }
                    if(!compareDate()){//开始时间、结束时间校验
                    	$(".datagrid-mask").hide();
        				$(".datagrid-mask-msg").hide();
                    	return;
                    }
                    if($("input[name='hostAccountId']").val() == null || $("input[name='hostAccountId']").val() == ''){
                    	$(".datagrid-mask").hide();
        				$(".datagrid-mask-msg").hide();
                    	$.messager.alert($.i18n.prop("messager.info"),$.i18n.prop("请选择主持人"),"warning");
                    	return;
                    }
                    if($("input[name='attendeeIds']").val() == null || $("input[name='attendeeIds']").val() == ''){
                    	$(".datagrid-mask").hide();
        				$(".datagrid-mask-msg").hide();
                    	$.messager.alert($.i18n.prop("messager.info"),$.i18n.prop("请选择参会人员"),"warning");
                    	return;
                    }else{
                    	 var attendeeIds = $("input[name='attendeeIds']").val();
                         var arr = new Array();
                         arr = attendeeIds.split(",");
                         console.log("input[name='attendeeAmount'] = " + $("input[name='attendeeAmount']").val());
                         if($("input[name='attendeeAmount']").val() < arr.length){
                        	 $.messager.alert($.i18n.prop("messager.info"),$.i18n.prop("邀请的参会人员数量不得大于参会人数"),"info");
                        	 $(".datagrid-mask").hide();
             				 $(".datagrid-mask-msg").hide();
                        	 return;
                         }
                    }
                    
                    var url = contextPath + "/meeting/new/createMeeting";
                    console.log("new meeting --- =" + $frmNewMeeting.serialize());
                    $.post(url, $frmNewMeeting.serialize(), function(result)
                    {
                    	$(".datagrid-mask").hide();
        				$(".datagrid-mask-msg").hide();
                        if ($.string(result.errorCode).blank())
                        {
                            $.messager.alert($.i18n.prop("messager.info"), $.i18n.prop("submit.success"), "info");
                            $dlgNewMeeting.dialog("close");
                            loadMeetings();
                        }
                        else
                        {
                            $.messager.alert($.i18n.prop("messager.info"), result.errorCode, "info", function()
                            {
                                $meetingSubject.focus();
                                //loadMeetings();
                            });
                        }
                    }, "json");
                    
                }
            },
            {
                text : $.i18n.prop("cancel"),
                iconCls : "icon-remove",
                handler : function()
                {
                    logBehavior("log.behavior.dialog.close", ["role.new"]);
                    $dlgNewMeeting.dialog("close");
                    $dlgNewMeeting.remove();
                }
            }],
            onOpen : function()
            {
                initNewMeetingForm($dlgNewMeeting);
            },
            onLoad : function()
            {
                initNewMeetingForm($dlgNewMeeting);
                $("#startTime").datetimebox('setValue',formatterDate(addDate()));
                $("input[name='beforeHandTime']").combobox({
                	url : contextPath + "/terminal/devices/dicData?dicType=beforeHandTime",
                	method : 'get',
                	valueField : 'dicKey',
                	textField : 'dicValue',
                	panelHeight : 'auto',
                	width : 190,
                	onLoadSuccess : function(){
                		$(this).combobox('setValue',15);//默认为15分钟
                	}
                });
               // autoInitNewMeeting();
             
            },
            onClose : function(){
            	$(this).dialog("destroy");
            }
        });
        
        $(".panel-tool-close", $dlgNewMeeting.dialog("header")).on("click", function()
        {
            logBehavior("log.behavior.dialog.x", ["role.new"]);
        });
    }// end if
    $dlgNewMeeting.dialog("open");
}

//创建会议时自动填入信息
function autoInitNewMeeting(){
	var hour = new Date().getHours();
	var min = new Date().getMinutes();
	var subject = hour + "点" + min + "分";
	var pwd = "1";
	var amount = 3;
	var hostAccountId = 150;//avs账号id
	var hotsAccount = 'avs';
	var description = "1";
	$("input[name='meetingSubject']:eq(1)").val(subject);
	$("input[name='meetingPwd']").val(pwd);
	$("input[name='meetingPwdRe']").val(pwd);
	$("#endTime").datetimebox('setValue',formatterDate(addDate1()));
	$("input[name='attendeeAmount']").val(amount);
	$("input[name='hostAccountId']").val(hostAccountId);
	$("input[name='hostAccount']").val('avs');
	$("textarea[name='meetingDescription']").val(description);
}

//格式化时间
formatterDate = function (date) {
	var day = date.getDate() > 9 ? date.getDate() : "0" + date.getDate();
	var month = (date.getMonth() + 1) > 9 ? (date.getMonth() + 1) : "0"
	+ (date.getMonth() + 1);
	var hor = date.getHours();
	var min = date.getMinutes();
	var sec = date.getSeconds();
	return date.getFullYear() + '-' + month + '-' + day+" "+hor+":"+min+":"+sec;
};

//当前时间分钟数: 0-15 默认显示为15; 15-30 默认显示为30; 30-45 默认显示为45；45-60 默认显示为60，
function addDate(){
	var now = new Date();
	var m = now.getMinutes();
	if(0 <= m && m < 15){
		now.setMinutes(15,0);
	}else if(15 <= m && m < 30){
		now.setMinutes(30,0);
	}else if(30 <= m && m < 45){
		now.setMinutes(45,0);
	}else if(45 <= m && m< 60){
		now.setMinutes(60,0);
	}
	return now;
}

function addDate1(){
	var now = addDate();
	var m = now.getMinutes();
	if(0 <= m && m < 15){
		now.setMinutes(15,0);
	}else if(15 <= m && m < 30){
		now.setMinutes(30,0);
	}else if(30 <= m && m < 45){
		now.setMinutes(45,0);
	}else if(45 <= m && m< 60){
		now.setMinutes(60,0);
	}
	return now;
}

function compareDate(){
	var startTimestamp = new Date($("#startTime").datetimebox('getValue')).getTime();
	var endTimestamp = new Date($("#endTime").datetimebox('getValue')).getTime();
	var currentTimestamp = new Date().getTime();
	if(startTimestamp < currentTimestamp){
		
		$.messager.alert("温馨提示","开始时间不得早于当前时间","info");
		return false;
	}else if(endTimestamp < currentTimestamp){
		$.messager.alert("温馨提示","结束时间不得早于当前时间","info");
		return false;
	}else if(startTimestamp > endTimestamp){
		$.messager.alert("温馨提示","开始时间不得晚于结束时间","info");
		return false;
	}
	
	return true;
	
}

function showMeetingDetail(){
	logBehavior("log.behavior.dialog.showMeetingDetail",["会议详情","detail"]);
	var $dlgMeetingDetail;
	
	if(!$dlgMeetingDetail){
		$dlgMeetingDetail = $("<div style='padding: 15px 15px;overflow: hidden;' id='dlgMeetingDetail'>");
		$dlgMeetingDetail.dialog({
			closed : true,
			modal : true,
			title : $.i18n.prop("会议详情"),
			width : 400,
			height : 500,
			href : contextPath + "/meeting/detail",
			buttons : [/*{
				text : '确认',
				iconCls : 'icon-ok',
				handler : function(){
					$frmMeetingDetail.form("enableValidation");
					if(!frmMeetingDetail.form("validate")){
						$.messager.alert("温馨提示","填写信息有误","error");
						return;
					}
					$dlgMeetingDetail.dialog("close");
				}
			},*/
			{
                text : $.i18n.prop("cancel"),
                iconCls : "icon-remove",
                handler : function()
                {
                    logBehavior("log.behavior.dialog.close", ["detail"]);
                    $dlgMeetingDetail.dialog("close");
                }
            }
			],
		onOpen : function(){
		    initMeetingDetailForm($dlgMeetingDetail);
		    
		} ,
		onLoad : function(){
			initMeetingDetailForm($dlgMeetingDetail);
			var row = $dgMeeting.datagrid("getSelections")[0];
			 $("input[name='beforeHandTime']").combobox({
			    	url : contextPath + "/terminal/devices/dicData?dicType=beforeHandTime" ,
			    	method : 'get',
			    	valueField : 'dicKey',
			    	textField : 'dicValue',
			    	panelHeight : 'auto',
			    	width : 185,
			    	onLoadSuccess : function(){
			    		$(this).combobox('setValue',row.beforeHandTime);//默认为15分钟
			    	}
			    });
		},
		onClose : function(){
			$(this).dialog("destroy");
		}
		});
	}
	
	 $dlgMeetingDetail.dialog("open");
}
//会议详情初始化
function initMeetingDetailForm($dlgMeetingDetail)
{
	$frmMeetingDetail = $("form", $dlgMeetingDetail);
	$frmMeetingDetail.form("clear");
	$frmMeetingDetail.form("disableValidation");
	
	var row = $dgMeeting.datagrid("getSelections")[0];
    row.startTime = format(row.startTime,'yyyy-MM-dd HH:mm:ss');
    row.endTime = format(row.endTime,'yyyy-MM-dd HH:mm:ss');
    getAttendeesByMeetingId(row.meetingId);
    
   
    $frmMeetingDetail.form("load", row);
    
}

function initNewMeetingForm($dlgNewMeeting)
{
    $frmNewMeeting = $("form", $dlgNewMeeting);
    
   /* $meetingSubject = $("input[name='meetingSubject']", $frmNewMeeting);
    $meetingNo = $("input[name='meetingNo']",$frmNewMeeting);*/

    $frmNewMeeting.form("clear");
    $frmNewMeeting.form("disableValidation");

   
}

// edit meeting

function editMeeting()
{
    logBehavior("log.behavior.dialog.open", ["meeting.list", "edit"]);    
    var $dlgEditMeeting;
    if (!$dlgEditMeeting)
    {
        $dlgEditMeeting = $("<div style='padding: 15px 15px; overflow: hidden;' id='dlgEditMeeting' />");
        $dlgEditMeeting.dialog(
        {
            closed : true,
            modal : true,
            cache : true,
            title : $.i18n.prop("edit"),
            width : 400,
            height : 510,
            href : contextPath + "/meeting/edit",
            buttons : [
            {
                text : $.i18n.prop("submit"),
                iconCls : "icon-ok",
                handler : function()
                {
                    $frmEditMeeting.form("enableValidation");

                    if (!$frmEditMeeting.form("validate"))
                    {
                        logBehavior("log.behavior.dialog.invaild", ["edit"]);
                        return;
                    }
                    if(!compareDate()){//开始时间、结束时间校验
                    	return;
                    }
                    if($("input[name='hostAccountId']").val() == null || $("input[name='hostAccountId']").val() == ''){
                    	$.messager.alert($.i18n.prop("messager.info"),$.i18n.prop("请选择主持人"),"warning");
                    	return;
                    }
                    if($("input[name='attendeeIds']").val() == null || $("input[name='attendeeIds']").val() == ''){
                    	$.messager.alert($.i18n.prop("messager.info"),$.i18n.prop("请选择参会人员"),"warning");
                    	return;
                    }else{
                    	 var attendeeIds = $("input[name='attendeeIds']").val();
                         console.log("attendeeIds = " + attendeeIds);
                         var arr = new Array();
                         arr = attendeeIds.split(",");
                         console.log("arr.length = " + arr.length);
                         console.log("input[name='attendeeAmount'] = " + $("input[name='attendeeAmount']").val());
                         if($("input[name='attendeeAmount']").val() < arr.length){
                        	 $.messager.alert($.i18n.prop("messager.info"),$.i18n.prop("邀请的参会人员数量不得大于参会人数"),"info");
                        	 return;
                         }
                    }
                    var row = $dgMeeting.datagrid("getSelections")[0];
                    var url = contextPath + "/meeting/edit/" + row.meetingId;
                    console.log("编辑会议 startTime = " + row.startTime);
                    /*var url = contextPath + "/meeting/edit/" + row.meetingId +"/";*/
                    //序列化表单的值
                    var param = "meetingId=" + row.meetingId + "&" + $frmEditMeeting.serialize();
                    $.post(url, param, function(result)
                    {
                        if ($.string(result.errorCode).blank())
                        {
                            $.messager.alert($.i18n.prop("messager.info"), $.i18n.prop("submit.success"), "info");
                            $dlgEditMeeting.dialog("close");
                            loadMeetings();
                        }
                        else
                        {
                            $.messager.alert($.i18n.prop("messager.info"), $.i18n.prop(result.errorCode), "info", function()
                            {
                                $("#meetingSubject").focus();
                            });
                        }
                    }, "json");
                }
            },
            {
                text : $.i18n.prop("cancel"),
                iconCls : "icon-remove",
                handler : function()
                {
                    logBehavior("log.behavior.dialog.close", ["edit"]);
                    $dlgEditMeeting.dialog("close");
                }
            }],
            onOpen : function()
            {
                initEditMeetingForm($dlgEditMeeting);
            },
            onLoad : function()
            {
                initEditMeetingForm($dlgEditMeeting);
                var row = $dgMeeting.datagrid("getSelections")[0];
              //初始化下拉框
                $("input[name='beforeHandTime']").combobox({
                	width : 185,
                	url : contextPath + "/terminal/devices/dicData?dicType=beforeHandTime" ,//根据dicKey获取dicValue
                	method : 'get',
                	valueField : 'dicKey',
                	textField : 'dicValue',
                	panelHeight:'auto',
                	onLoadSuccess : function(){
                		$(this).combobox('setValue',row.beforeHandTime);
                	}
                });
            },
            onClose : function(){
            	$(this).dialog("destroy");
            }
        });
        
        $(".panel-tool-close", $dlgEditMeeting.dialog("header")).on("click", function()
        {
            logBehavior("log.behavior.dialog.x", ["edit"]);
        });
    }// end of if
    
    $dlgEditMeeting.dialog("open");
}

function initEditMeetingForm($dlgEditMeeting)
{
    $frmEditMeeting = $("form", $dlgEditMeeting);
    $frmEditMeeting.form("clear");
    $frmEditMeeting.form("disableValidation");
    
    var row = $dgMeeting.datagrid("getSelections")[0];
    row.startTime = format(row.startTime,'yyyy-MM-dd HH:mm:ss');
    row.endTime = format(row.endTime,'yyyy-MM-dd HH:mm:ss');
    getAttendeesByMeetingId(row.meetingId);//显示参会人员信息
    
    $frmEditMeeting.form("load", row);
}

//根据meetingId查询该会议的参会人员
function getAttendeesByMeetingId(meetingId){
	if(meetingId == null || meetingId == ''){
		return;
	}
	 $.ajax(
	         {
	             url : contextPath + "/system/selectAttendees/" + meetingId,
	             type : "get",
	             dataType : "json",
	             contentType : "application/json",
	             data : meetingId,
	             success : function(data)
	             {
	               var attendeeNames = [];
	                var attendeeIds = [];
	                //var dd = JSON.stringify(data.rows);//将data.rows转为JSON字符串
	                $.each(data.rows,function(index,item){//使用each遍历时不能遍历JSON字符串，需要遍历javascript对象
	                	//attendeeNames.push(item.clerkName);
	                	attendeeNames.push(item.deviceName);
	                	attendeeIds.push(item.clerkId);
	                });
	                console.log("222---attendeeNames = " + attendeeNames);
	                /*
	                 * 将参会人员信息回显
	                 * */
	                $("input[name='attendeeIds']").val(attendeeIds);
	        		$("input[name='attendeeNames']").val(attendeeNames);
	             }
	         });
}



// remove meetings
function removeMeetings()
{
    logBehavior("log.behavior.dialog.open", ["role.list", "remove"]);
    
    var messager = $.messager.confirm($.i18n.prop("role.remove"), $.i18n.prop("row.confirmDelete"), function(r)
    {
        if (r)
        {
            var rows = $dgMeeting.datagrid("getSelections");
            var list = [];

            $.each(rows, function(index, item)
            {
                list.push(item.meetingId);
            });

            $.ajax(
            {
                url : contextPath + "/meetings?_method=delete",
                type : "post",
                dataType : "json",
                contentType : "application/json",
                data : $.toJSON(list),
                success : function(data)
                {
                    if(data.errorCode == ""){//请求成功
                    	$.messager.alert($.i18n.prop("messager.info"), $.i18n.prop("submit.success"), "info");
                        loadMeetings();
                    }else{
                    	$.messager.alert($.i18n.prop("messager.error"),data.errorCode,"error");
                    }
                	
                }
            });
        }
        else
        {
            logBehavior("log.behavior.dialog.close", ["role.remove"]);
        }
    });
    
    $(".panel-tool-close", messager.window("header")).on("click", function()
    {
        logBehavior("log.behavior.dialog.x", ["role.remove"]);
    });
}


function checkAll(id, chked)
{
    var chks = $("[name='" + id + "']");

    if (0 == chks.length)
    {
        return;
    }

    chks.each(function()
    {
        this.checked = chked;
        checkAll(this.id, chked);
    });
}

function uncheckParent(id)
{
    var name = $("#" + id).attr("name");

    if (null == name)
    {
        return;
    }

    var chks = $("[name='" + name + "']");
    var c = true;

    chks.each(function()
    {
        if (!this.checked)
        {
            c = false;
            return;
        }
    });

    if (c)
    {
        $("#" + name)[0].checked = true;
    }
    else
    {
        $("#" + name)[0].checked = false;
    }

    uncheckParent(name);
}

var $dlgSelectHostAccount;
// 打开选择主持人界面
function selectHostAccount()
{
    logBehavior("log.behavior.dialog.open", ["meeting.list", "meeting.chooseHostAccount"]);
    
    if (!$dlgSelectHostAccount)
    {
    	$dlgSelectHostAccount = $("<div style='padding: 15px 15px;overflow:hidden;' id='dlgSelectHostAccount' />");
    	$dlgSelectHostAccount.dialog(
        {
            closed : true,
            modal : true,
            cache : true,
            title : "选择主持人",
            width : 540,
            height : 450,
            href : contextPath + "/meeting/selectHostAccount",
            buttons : [
            {
                text : $.i18n.prop("submit"),
                iconCls : "icon-ok",
                handler : function()
                {
                    var row = $("#dgSearchClerk").datagrid("getSelections")[0];
                    submitHostAccount(row.clerkId);
                }
            },
            {
                text : $.i18n.prop("cancel"),
                iconCls : "icon-remove",
                handler : function()
                {
                    logBehavior("log.behavior.dialog.close", ["meeting.selectHostAccount"]);
                    $dlgSelectHostAccount.dialog("close");
                }
            }],
            onOpen : function()
            {
                if (null == document.getElementById("dgUnselectedClerk"))
                {
                    return;
                }
              
                initClerksSearch();
           },
            onLoad : function()
            {
            	 if (null == document.getElementById("dgUnselectedClerk"))
                 {
                     return;
                 }
                /*var row = $("#dgUnselectedClerk").datagrid("getSelections")[0];
                initClerkSelector(contextPath + "/meeting/" + row.clerkId + "/clerks", null);*/
            	 initClerksSearch();
          }
        });
        
        $(".panel-tool-close", $dlgSelectHostAccount.dialog("header")).on("click", function()
        {
            logBehavior("log.behavior.dialog.x", ["meeting.selectHostAccount"]);
        });
    }
    
    $dlgSelectHostAccount.dialog("open");
}



//安排会议时打开邀请参加者界面
function selectAttendees(){
	logBehavior("log.behavior.dialog.open", ["meeting.list", "meeting.chooseHostAccount"]);
	var $dlgSelectAttendees;
	    if (!$dlgSelectAttendees)
	    {
	    	$dlgSelectAttendees = $("<div style='padding: 15px 15px;overflow:hidden;' id='dlgSelectAttendees' />");
	    	$dlgSelectAttendees.dialog(
	        {
	            closed : true,
	            modal : true,
	            cache : true,
	            title : "邀请参加者",
	            width : 1200,
	            height : 450,
	            href : contextPath + "/meeting/selectAttendees",
	            buttons : [
	            {
	                text : $.i18n.prop("submit"),
	                iconCls : "icon-ok",
	                handler : function()
	                {
	                	/*
	                	 * 将选中的参会者信息回显到前一 页面
	                	 * */
	                	var rows = $("#dgSelectedClerk").datagrid("getSelections");
	                    var attendeeIdList = [];//所有参加者的id列表
	                    var attendeeNames = [];
	                	if(rows.length == 0){
	                		$.messager.confirm($.i18n.prop("messager.confirm"), $.i18n.prop("请至少选中一行"), function(r){
	                			return;
	                		});
	                	}else{
	                		$.each(rows,function(index,item){
	                			attendeeIdList.push(item.clerkId);
	                			//attendeeNames.push(item.clerkName);
	                			attendeeNames.push(item.deviceName);
	                		});
	                		$("input[name='attendeeIds']").val(attendeeIdList);
	                		$("input[name='attendeeNames']").val(attendeeNames);
	                		$dlgSelectAttendees.dialog("close");
	                	}
	                }
	            },
	            {
	                text : $.i18n.prop("cancel"),
	                iconCls : "icon-remove",
	                handler : function()
	                {
	                    logBehavior("log.behavior.dialog.close", ["meeting.selectHostAccount"]);
	                    $dlgSelectAttendees.dialog("close");
	                }
	            }],
	            onOpen : function()
	            {
	               /* if (null == document.getElementById("dgUnselectedClerk"))
	                {
	                    return;
	                }
	                $("#dgUnselectedClerk").datagrid("clearSelections")
                	$("#dgSelectedClerk").datagrid("clearSelections");
	                var attendeeIds = "";
		             if($("input[name='attendeeIds']").val() != null){
		                //attendeeIds = $("input[name='attendeeIds']").val();
		            	 alert("onOpen");
		            	//attendeeIds.push($("input[name='attendeeIds']").val());
		            	 attendeeIds = $("input[name='attendeeIds']").val();
		             }
		             //console.log("attendeeIds = " + $("input[name='attendeeIds']").val());
		             var url = contextPath + "/meeting/selectAttendees/excepted";
		             initAttendeeSelector(url, attendeeIds);*/
	                
	           },
	            onLoad : function()
	            {
	            	 if (null == document.getElementById("dgUnselectedClerk"))
	                 {
	                     return;
	                 }
	            	 $("#dgUnselectedClerk").datagrid("clearSelections")
	                 $("#dgSelectedClerk").datagrid("clearSelections");
	            	
	            	 var attendeeIds ;
		             if($("input[name='attendeeIds']").val() != null){
		                 attendeeIds = $("input[name='attendeeIds']").val();
		             }
		             console.log("onLoad  attendeeIds = " + attendeeIds);
		             var url = contextPath + "/meeting/selectAttendees/excepted";
		             initAttendeeSelector(url, null);
		            
	          },
	          onClose : function(){
	        	  $(this).dialog("destroy");
	          }
	        });
	        
	        $(".panel-tool-close", $dlgSelectAttendees.dialog("header")).on("click", function()
	        {
	            logBehavior("log.behavior.dialog.x", ["meeting.selectAttendee"]);
	        });
	    }
	    
	    $dlgSelectAttendees.dialog("open");
}


//编辑会议时打开邀请参加者界面
function editSelectAttendees(){
	logBehavior("log.behavior.dialog.open", ["meeting.list", "编辑界面选择参会者"]);
	var $dlgEdit_SelectAttendees;
	if (!$dlgEdit_SelectAttendees)
	    {
	    	$dlgEdit_SelectAttendees = $("<div style='padding: 15px 15px;overflow:hidden;' id='dlgEdit_SelectAttendees' />");
	    	$dlgEdit_SelectAttendees.dialog(
	        {
	            closed : true,
	            modal : true,
	            cache : true,
	            title : "邀请参加者",
	            width : 1200,
	            height : 450,
	            href : contextPath + "/meeting/selectAttendees",
	            buttons : [
	            {
	                text : $.i18n.prop("submit"),
	                iconCls : "icon-ok",
	                handler : function()
	                {
	                    var rows = $("#dgSelectedClerk").datagrid("getChecked");
	                    var attendeeIdList = [];//所有参加者的id列表
	                    var attendeeNames = [];
	                	if(rows.length == 0){
	                		$.messager.confirm($.i18n.prop("messager.confirm"), $.i18n.prop("未选择行"), function(r){
	                			return;
	                		});
	                	}else{
	                		$.each(rows,function(index,item){
	                			attendeeIdList.push(item.clerkId);
	                			//attendeeNames.push(item.clerkName);
	                			attendeeNames.push(item.deviceName);
	                		});
	                		$("input[name='attendeeIds']").val(attendeeIdList);
	                		$("input[name='attendeeNames']").val(attendeeNames);
	                		$dlgEdit_SelectAttendees.dialog("close");
	                	}
	                }
	            },
	            {
	                text : $.i18n.prop("cancel"),
	                iconCls : "icon-remove",
	                handler : function()
	                {
	                    logBehavior("log.behavior.dialog.close", ["meeting.selectHostAccount"]);
	                    $dlgEdit_SelectAttendees.dialog("close");
	                }
	            }],
	            onOpen : function()
	            {
	                if (null == document.getElementById("dgUnselectedClerk"))
	                {
	                    return;
	                }
	                var meetingRow = $dgMeeting.datagrid("getSelections")[0];//获取待编辑的会议信息
	                var url = contextPath + "/meeting/selectAttendees/excepted/" + meetingRow.meetingId;
	                initAttendeeSelector(url, null);
	                
	           },
	            onLoad : function()
	            {
	            	 if (null == document.getElementById("dgUnselectedClerk"))
	                 {
	                     return;
	                 }
	            	 var meetingRow = $dgMeeting.datagrid("getSelections")[0];//获取待编辑的会议信息
	            	 var url = contextPath + "/meeting/selectAttendees/excepted/" + meetingRow.meetingId;
	            	 initAttendeeSelector(url, null);
	            	 
	          },
	          onClose : function(){
	        	  $(this).dialog("destroy");
	          }
	        });
	        
	        $(".panel-tool-close", $dlgEdit_SelectAttendees.dialog("header")).on("click", function()
	        {
	            logBehavior("log.behavior.dialog.x", ["meeting.selectHostAccount"]);
	        });
	    }
	    
	    $dlgEdit_SelectAttendees.dialog("open");
}

function postMeetingInfo(params)
{
    var list = [];

    if (null != rows)
    {
        $.each(rows, function(index, item)
        {
            list.push(item.clerkId);
        });
    }

    var postData = $.toJSON(list);
    alert("meeting.list = "+postData);

    $.ajax(
    {
        url : contextPath + "/meeting/" + clerkId + "/clerks",
        type : "post",
        dataType : "json",
        contentType : "application/json",
        data : postData,
        success : function()
        {
            $.messager.alert($.i18n.prop("messager.info"), $.i18n.prop("submit.success"), "info");
            $dlgSelectHostAccount.dialog("close");
            loadClerks();
        }
    });
}



