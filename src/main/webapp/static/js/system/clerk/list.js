$(function()
{
    $oid = $("#oid");
    $cno = $("#cno");
    $cname = $("#cname");
    $containSub = $("#containSub");

    $btnEditClerk = $("#btnEditClerk");
    $btnShowClerk = $("#btnShowClerk");
    $btnRemoveClerk = $("#btnRemoveClerk");
    $btnResetPassword = $("#btnResetPassword");
    $btnLockClerk = $("#btnLockClerk");
    $btnUnlockClerk = $("#btnUnlockClerk");
    $exportClerk = $("#btnExportClerk");
    $importClerk = $("#btnImportClerk");
    
    $btnEditClerk.attr("disabled","disabled");
    $btnShowClerk.attr("disabled","disabled");
    $btnRemoveClerk.attr("disabled","disabled");
    $btnResetPassword.attr("disabled","disabled");
    $btnLockClerk.attr("disabled","disabled");
    $btnUnlockClerk.attr("disabled","disabled");
    $exportClerk.attr("disabled","disabled");
    $dgClerk = $("#dgClerk").datagrid(
    {
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
});

// toolbar
function enableToolbar()
{
    var length = $dgClerk.datagrid("getSelections").length;

    if (1 == length)
    {
        $btnEditClerk.linkbutton("enable");
        $btnShowClerk.linkbutton("enable");
       
        $btnEditClerk.removeAttr("disabled");
        $btnShowClerk.removeAttr("disabled");
    }
    else
    {
        $btnEditClerk.linkbutton("disable");
        $btnShowClerk.linkbutton("disable");
        
        $btnEditClerk.attr("disabled","disabled");
        $btnShowClerk.attr("disabled","disabled");
    }

    if (length > 0)
    {
        $btnRemoveClerk.linkbutton("enable");
        $btnResetPassword.linkbutton("enable");
        $btnLockClerk.linkbutton("enable");
        $btnUnlockClerk.linkbutton("enable");
        $exportClerk.linkbutton("enable");
        
        $exportClerk.removeAttr("disabled");
        $btnRemoveClerk.removeAttr("disabled");
        $btnResetPassword.removeAttr("disabled");
        $btnLockClerk.removeAttr("disabled");
        $btnUnlockClerk.removeAttr("disabled");
    }
    else
    {
        $btnRemoveClerk.linkbutton("disable");
        $btnResetPassword.linkbutton("disable");
        $btnLockClerk.linkbutton("disable");
        $btnUnlockClerk.linkbutton("disable");
        $exportClerk.linkbutton("disable");
        
        $exportClerk.attr("disabled","disabled");
        $btnRemoveClerk.attr("disabled","disabled");
        $btnResetPassword.attr("disabled","disabled");
        $btnLockClerk.attr("disabled","disabled");
        $btnUnlockClerk.attr("disabled","disabled");
    }
}

function searchClerkByEnter(id){
	document.onkeydown = function(event){
		var e = event || window.event || arguments.callee.caller.arguments[0];
		if(e && e.keyCode == 13){//按下enter键
			searchClerks();
		}
	}
}

// search Clerks
function searchClerks()
{
    logBehavior("log.behavior.page.query", ["clerk.title", "clerk.list"]);
    loadClerks();
}

function loadClerks()
{
    $dgClerk.datagrid("clearSelections");

    var param = {};
    param.clerkNo = $cno.val();
    param.clerkName = $cname.val();
    param.orgId = $oid.val();
    param.containSub = $containSub.is(':checked');

    $dgClerk.datagrid("load", param);
}

//new Clerk
var $dlgNewClerk;

function newClerk()
{
    logBehavior("log.behavior.dialog.open", ["clerk.list", "new"]);

    if (!$dlgNewClerk)
    {
        $dlgNewClerk = $("<div style='padding: 15px 15px; overflow: hidden;' id='dlgNewClerk' />");
        $dlgNewClerk.dialog(
        {
            closed : true,
            modal : true,
            cache : true,
            title : "账号新增",
            width : 400,
            height : 480,
            href : contextPath + "/system/clerks/new",
            buttons : [
            {
                text : $.i18n.prop("submit"),
                iconCls : "icon-ok",
                handler : function()
                {
                    $frmNewClerk.form("enableValidation");

                    if (!$frmNewClerk.form("validate"))
                    {
                        logBehavior("log.behavior.dialog.invaild", ["职员新增"]);
                        return;
                    }

                    var url = contextPath + "/system/clerks";
                    $.post(url, $frmNewClerk.serialize(), function(result)
                    {
                        if ($.string(result.errorCode).blank())
                        {
                            $.messager.alert($.i18n.prop("messager.info"), $.i18n.prop("submit.success"), "info");
                            $dlgNewClerk.dialog("close");
                            loadClerks();
                        }
                        else
                        {
                            $.messager.alert($.i18n.prop("messager.info"), $.i18n.prop(result.errorCode), "info", function()
                            {
                                $("#username").focus();
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
                    logBehavior("log.behavior.dialog.close", ["user.new"]);
                    $dlgNewClerk.dialog("close");
                }
            }],
            onLoad : function()
            {
                initNewClerkForm();
            }
        });

        $(".panel-tool-close", $dlgNewClerk.dialog("header")).on("click", function()
        {
            logBehavior("log.behavior.dialog.x", ["user.new"]);
        });
    }

    $("input[name='clerkNo']").val("");
    $("input[name='clerkName']").val("");
    $("input[name='email']").val("");
    $("input[name='phoneNumber']").val("");
    $("input[name='address']").val("");
    $("input[name='remark']").val("");
    //$dgClerk.datagrid('clearSelections');
    $dlgNewClerk.dialog("open");
}

function initNewClerkForm()
{
    $frmNewClerk = $("form", $dlgNewClerk);
    
    var $clerkNo = $("input[name='clerkNo']", $frmNewClerk);
    var $orgName = $("input[name='orgName']", $frmNewClerk);
    var $orgId = $("input[name='orgId']", $frmNewClerk);

    var orgName = $orgName.val();
    var orgId = $orgId.val();

    $frmNewClerk.form("clear");
    $frmNewClerk.form("disableValidation");

    $clerkNo.focus();
    $orgName.val(orgName);
    $orgId.val(orgId);
    // 初始角色
	$("input[name='clerkType']").combobox({
		url : contextPath + "/terminal/devices/dicData?dicType=clerkTypes",
		method : "get",
		valueField : "dicKey",
		textField : 'dicValue',
		panelHeight:'auto',
		onLoadSuccess : function() {
			$(this).combobox('select', 1);
		}
	});
	// 初始性别
	$("input[name='sex']").combobox({
		url : contextPath + "/terminal/devices/dicData?dicType=sexType",
		method : "get",
		valueField : "dicKey",
		textField : 'dicValue',
		panelHeight:'auto',
		onLoadSuccess : function() {
			$(this).combobox('select', 0);
		}
	});
}

// edit clerk
var $dlgEditClerk;

function editClerk()
{
    logBehavior("log.behavior.dialog.open", ["clerk.list", "edit"]);
    
    if (!$dlgEditClerk)
    {
        $dlgEditClerk = $("<div style='padding: 15px 15px; overflow: hidden;' id='dlgEditClerk' />");
        $dlgEditClerk.dialog(
        {
            closed:true,
            modal:true,
            cache:true,
            title: "账号编辑",
            width: 400,
            height: 480,
            href: contextPath + "/system/clerks/edit",
            buttons : [
            {
                text : $.i18n.prop("submit"),
                iconCls : "icon-ok",
                handler : function()
                {
                    $frmEditClerk.form("enableValidation");

                    if (!$frmEditClerk.form("validate"))
                    {
                        logBehavior("log.behavior.dialog.invaild", ["职员编辑"]);
                        return;
                    }

                    var row = $dgClerk.datagrid("getSelections")[0];
                    var url = contextPath + "/system/clerks/" + row.clerkId + "?_method=put";
                    //alert(row.clerkId);
                    $.post(url, $frmEditClerk.serialize(), function(result)
                    {
                        if ($.string(result.errorCode).blank())
                        {
                            $.messager.alert($.i18n.prop("messager.info"), $.i18n.prop("submit.success"), "info");
                            $dlgEditClerk.dialog("close");
                            loadClerks();
                        }
                        else
                        {
                            $.messager.alert($.i18n.prop("messager.info"), $.i18n.prop(result.errorCode), "info", function()
                            {
                                $("#urlName").focus();
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
                    logBehavior("log.behavior.dialog.close", ["url.edit"]);
                    $dlgEditClerk.dialog("close");
                }
            }],
            onOpen : function()
            {
            	if (null != document.getElementById("dlgEditClerk"))
            	{
            		initClerkEdit();
            	}	
            },
            onLoad : function()
            {
            	initClerkEditForm();
            }
        });

        $(".panel-tool-close", $dlgEditClerk.dialog("header")).on("click", function()
        {
            logBehavior("log.behavior.dialog.x", ["职员编辑"]);
        });
    }

    $dlgEditClerk.dialog("open");
}

function initClerkEdit() {
	$frmEditClerk = $("form", $dlgEditClerk);
    $frmEditClerk.form("clear");
    $frmEditClerk.form("disableValidation");
    var row = $dgClerk.datagrid("getSelections")[0];
    //alert(JSON.stringify(row));
    $frmEditClerk.form("load", row);
    $("input[name='clerkName']", $frmEditClerk).focus();
}


function initClerkEditForm()
{
    $frmEditClerk = $("form", $dlgEditClerk);
    $frmEditClerk.form("clear");
    $frmEditClerk.form("disableValidation");
    
    // 初始化角色
	$("input[name='clerkType']").combobox({
		url : contextPath + "/terminal/devices/dicData?dicType=clerkTypes",
		method : "get",
		valueField : "dicKey",
		textField : 'dicValue',
		panelHeight:'auto'
	});
	// 初始化性别
	$("input[name='sex']").combobox({
		url : contextPath + "/terminal/devices/dicData?dicType=sexType",
		method : "get",
		valueField : "dicKey",
		textField : 'dicValue',
		panelHeight:'auto'
	});
	
	var row = $dgClerk.datagrid("getSelections")[0];
    //alert(JSON.stringify(row));
    $frmEditClerk.form("load", row);
    
    $("input[name='clerkName']", $frmEditClerk).focus();
}

// remove clerks
function removeClerks()
{
    logBehavior("log.behavior.dialog.open", ["clerk.list", "remove"]);

    var messager = $.messager.confirm("账号删除", $.i18n.prop("row.confirmDelete"), function(r)
    {
        if (r)
        {
            var rows = $dgClerk.datagrid("getSelections");
            var list = [];

            $.each(rows, function(index, item)
            {
                list.push(item.clerkId);
            });

            $.ajax(
            {
                url : contextPath + "/system/clerks?_method=delete",
                type : "post",
                dataType : "json",
                contentType : "application/json",
                data : $.toJSON(list),
                success : function()
                {
                    $.messager.alert($.i18n.prop("messager.info"), $.i18n.prop("submit.success"), "info");
                    loadClerks();
                }
            });
        }
        else
        {
            logBehavior("log.behavior.dialog.close", ["clerk.remove"]);
        }
    });

    $(".panel-tool-close", messager.window("header")).on("click", function()
    {
        logBehavior("log.behavior.dialog.x", ["user.remove"]);
    });
}

// show Clerk
var $dlgShowClerk;

function showClerk()
{
    logBehavior("log.behavior.dialog.open", ["clerk.list", "detail"]);
    
    if (!$dlgShowClerk)
    {
        $dlgShowClerk = $("<div style='padding: 15px 15px; overflow: hidden;' id='dlgShowClerk' />");
        $dlgShowClerk.dialog(
        {
            closed:true,
            modal:true,
            cache:true,
            title: "账号详情",
            width: 600,
            height: 510,
            href: contextPath + "/system/clerks/show",
            buttons: "#dlgShowClerkButtons",
            onOpen: function()
            {
                initClerkShowForm();
            },
            onLoad: function()
            {
                initClerkShowForm();
            }
        });
        
        $("#dlgShowClerkButtons").show();

        $(".panel-tool-close", $dlgShowClerk.dialog("header")).on("click", function()
        {
            logBehavior("log.behavior.dialog.x", ["clerk.detail"]);
        });
    }
    
    $dlgShowClerk.dialog("open");
}

function initClerkShowForm()
{
    var $frmShowClerk = $("form", $dlgShowClerk);
    $frmShowClerk.form("clear");

    var row = $dgClerk.datagrid("getSelections")[0];
    console.log(row);
    $frmShowClerk.form("load", row);
    
    var $lastLoginDate = $("input[name='lastLoginDate']", $frmShowClerk);
    var $createdDate = $("input[name='createdDate']", $frmShowClerk);
    var $lastUpdatedDate = $("input[name='lastUpdatedDate']", $frmShowClerk);
    
    var lastLoginDate = $lastLoginDate.val();
    var createdDate = $createdDate.val();
    var lastUpdatedDate = $lastUpdatedDate.val();
    
    $lastLoginDate.val(formatDate(lastLoginDate));
    $createdDate.val(formatDate(createdDate));
    $lastUpdatedDate.val(formatDate(lastUpdatedDate)); 
}

function editClerkFromDetail()
{
    logBehavior("log.behavior.user.action1");
    $dlgShowClerk.dialog("close");
    editClerk();
}

function closeClerkDetailDialog()
{
    logBehavior("log.behavior.dialog.close", ["user.detail"]);
    $dlgShowClerk.dialog("close");
}

// reset password
function resetPassword()
{
    logBehavior("log.behavior.dialog.open", ["clerk.list", "user.reset"]);
    
    var messager = $.messager.confirm($.i18n.prop("user.reset"), $.i18n.prop("user.confirmReset"), function(r)
    {
        if (r)
        {
            var list = [];
            var rows = $dgClerk.datagrid("getSelections");
            
            $.each(rows, function(index, item)
            {
                list.push(
                {
                    clerkId : item.clerkId,
                    clerkNo : item.clerkNo
                });
            });

            $.ajax(
            {
                url : contextPath + "/system/clerks/password?_method=put",
                type : "post",
                dataType : "json",
                contentType : "application/json",
                data : $.toJSON(list),
                success : function()
                {
                    $.messager.alert($.i18n.prop("messager.info"), $.i18n.prop("submit.success"), "info");
                    loadClerks();
                }
            });
        }
        else
        {
            logBehavior("log.behavior.dialog.close", ["user.reset"]);
        }
    });
    
    $(".panel-tool-close", messager.window("header")).on("click", function()
    {
        logBehavior("log.behavior.dialog.x", ["user.reset"]);
    });
}

// lock Clerks
function lockClerks()
{
    logBehavior("log.behavior.dialog.open", ["clerk.list", "user.lock"]);
    postClerkLocked("user.lock", true, $.i18n.prop("user.lock"), $.i18n.prop("user.confirmLock"));
}

function postClerkLocked(code, locked, msgTitle, confirmMessage)
{
    var messager = $.messager.confirm(msgTitle, confirmMessage, function(r)
    {
        if (r)
        {
            // logBehavior("log.behavior.dialog.ok", [code]);
            var list = [];
            var rows = $dgClerk.datagrid("getSelections");

            $.each(rows, function(i, u)
            {
                list.push(u.clerkId);
            });

            var model = {};
            model.list = list;
            model.locked = locked;

            $.ajax(
            {
                url : contextPath + "/system/clerks/locked?_method=put",
                type : "post",
                dataType : "json",
                contentType : "application/json; charset=utf-8",
                data : $.toJSON(model),
                success : function()
                {
                    $.messager.alert($.i18n.prop("messager.info"), $.i18n.prop("submit.success"), "info");
                    loadClerks();
                }
            });
        }
        else
        {
            logBehavior("log.behavior.dialog.close", [code]);
        }
    });

    $(".panel-tool-close", messager.window("header")).on("click", function()
    {
        logBehavior("log.behavior.dialog.x", [code]);
    });
}

// unlock Clerks
function unlockClerks()
{
    logBehavior("log.behavior.dialog.open", ["clerk.list", "user.unlock"]);
    postClerkLocked("user.unlock", false, $.i18n.prop("user.unlock"), $.i18n.prop("user.confirmUnlock"));
}

function postClerkUnlocked(code, locked, msgTitle, confirmMessage)
{
    var messager = $.messager.confirm(msgTitle, confirmMessage, function(r)
    {
        if (r)
        {
            var list = [];
            var rows = $dgClerk.datagrid("getSelections");

            $.each(rows, function(i, u)
            {
                list.push(u.clerkId);
            });

            var model = {};
            model.list = list;
            model.locked = locked;

            $.ajax(
            {
                url : contextPath + "/system/clerks/locked?_method=put",
                type : "post",
                dataType : "json",
                contentType : "application/json; charset=utf-8",
                data : $.toJSON(model),
                success : function()
                {
                    $.messager.alert($.i18n.prop("messager.info"), $.i18n.prop("submit.success"), "info");
                    loadClerks();
                }
            });
        }
        else
        {
            logBehavior("log.behavior.dialog.close", [code]);
        }
    });

    $(".panel-tool-close", messager.window("header")).on("click", function()
    {
        logBehavior("log.behavior.dialog.x", [code]);
    });
}
        
function formatLocked(val, row)
{
    var h = "";

    if (val)
    {
        h = "<span style='color:red'>" + $.i18n.prop("user.locked") + "</span>";
    }
    else
    {
        h = "<span style='color:green'>" + $.i18n.prop("user.unlocked") + "</span>";
    }

    return h;
}

function formatLoginStatus(val, row)
{
    var h = "";

    if (val)
    {
        h = "<span style='color:red'>已登入</span>";
    }
    else
    {
        h = "<span style='color:green'>未登入</span>";
    }

    return h;
}

//export clerk
function exportExcel()
{
    
	var clerkNo = $cno.val();
	var clerkName = $cname.val();
	var orgId = $oid.val();
	var containSub = $containSub.is(':checked');
	
    window.location.href = contextPath + "/system/clerks/export?clerkNo="+clerkNo+"&clerkName="+clerkName+"&orgId="+orgId+"&containSub="+containSub;
    
}
/*
 * 职员分批导出
 * */
function exportClerkInBatch()
{
    logBehavior("职员分批导出","");
    var rows = $dgClerk.datagrid("getSelections");
    var clerkIds = [];
    /*
     * 得到选中行数的clerkId
     * */
    $.each(rows,function(index,item){
    	clerkIds.push(item.clerkId);
    });
    $.ajax(
    {
    	url : contextPath + "/system/clerk/exportInBatch",
    	type : "post",
    	dataType : "json",
    	contentType : "application/json",
    	data : JSON.stringify(clerkIds),
    	success : function(data){
    	window.location.href = data.downloadUrl;
    	//console.log(data.downloadUrl);
    	}
    	/*error : function(){
    		alert("error");
    	}*/
    });
    
  /*  var form = $("<form>");
    form.attr('style', 'display:none');
    form.attr('target', '');
    form.attr('method', 'post');
    form.attr('action', contextPath + "/system/clerk/exportInBatch");
    form.attr('contentType',"application/json");
    var input1 = $('<input>');
    input1.attr('type', 'hidden');
    input1.attr('name', 'clerkIds');
    input1.attr('value', JSON.stringify(clerkIds));//将JSON对象转为JSON对象的字符串

    $('body').append(form);
    form.append(input1);
    
    form.submit();
    form.remove();*/
    
}

//import clerk
var $dlgImportClerk;

function importExcel()
{
    logBehavior("log.behavior.dialog.open", ["clerk.list", "import"]);
    
    if (!$dlgImportClerk)
    {
        $dlgImportClerk = $("<div style='padding: 15px 15px; overflow: hidden;' id='dlgImportClerk' />");
        $dlgImportClerk.dialog(
        {
            closed : true,
            modal : true,
            cache : true,
            title : "职员导入",
            width : 400,
            height : 250,
            href : contextPath + "/system/clerks/import",
            buttons : [
            {
                text : $.i18n.prop("submit"),
                iconCls : "icon-ok",
                handler : function()
                {
                    ajaxFileUpload();
                }
            },
            {
                text : $.i18n.prop("cancel"),
                iconCls : "icon-remove",
                handler : function()
                {
                    logBehavior("log.behavior.dialog.close", ["职员导入"]);
                    $dlgImportClerk.dialog("close");
                }
            }],
            onOpen : function()
            {
            	
            },
            onLoad: function()
            {
            	
            }
        });

        $(".panel-tool-close", $dlgImportClerk.dialog("header")).on("click", function()
        {
            logBehavior("log.behavior.dialog.close", ["职员导入"]);
        });
    }
    
    $dlgImportClerk.dialog("open");
}

var err = { "acceptFileTypes": "只能上传excel文档，支持文件类型(.xls或.xlsx)",
        "maxFileSize": "上传文件大小超出范围60M"
};


function hasError(file) {
    var acceptFileTypes = /(\.|\/)(xls|xlsx)$/i;

    if (!(acceptFileTypes.test(file))) {
        return "acceptFileTypes";
    }
    return "OK";
}

function ajaxFileUpload()
{
    var filepath=$("input[name='files']").val();
    if(filepath != "" && filepath != "undefined" && filepath != null){
        if(hasError(filepath) != "OK"){
            $.messager.alert("温馨提示",err[hasError(filepath)],"warning");
            return false;
        }       
    }
    
    var url = contextPath + '/system/clerks/import';
    $(".datagrid-mask").css({display:"block",width:"100%",height:$(window).height()});
    $(".datagrid-mask-msg").css({display:"block",left:($dlgImportClerk.outerWidth(true) - 190) / 2,top:($(window).height() - 280) / 2});
    $.ajaxFileUpload
    (
        {
            url:url,
            secureuri:false,
            fileElementId:'fileupload',
            dataType: 'json',
            success: function (data, status)
            {
                $(".datagrid-mask").hide();
                $(".datagrid-mask-msg").hide();
                if(data.msg == "success"){
                     $.messager.alert($.i18n.prop("messager.info"), "上传成功", "info");
                     $dlgImportClerk.dialog("close");
                     loadClerks();
                }else if(data.msg == "overSize"){
                    $.messager.alert("温馨提示",err["maxFileSize"],"warning");
                    return false;
                }else{
                    $.messager.alert("温馨提示",data.msg,"warning");
                    return false;
                }
            },
            error: function (data, status, e)
            {
                $(".datagrid-mask").hide();
                $(".datagrid-mask-msg").hide();         
                $.messager.alert("温馨提示","上传失败","warning");
                return false;
            }
        }
    );
}