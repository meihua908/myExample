$(function() {
	Json = [];
    $dlgNewInterface = $("#dlgNewInterface").dialog({
        buttons : [{
            text : $.i18n.prop("submit"),
            iconCls : "icon-ok",
            handler : function() {
                if(undefined == $("#uploadFileNew")[0].files[0]) {
                    logBehavior("log.behavior.dialog.invaild", ["newInterface"]);
                    return;
                }
                
                var url = contextPath + "/manage/interface/add";
                var param = {"data" : $.toJSON(Json)};
                $.post(url, param, function(result) {
                    if("200" == result.returnCode) {
                        $.messager.alert($.i18n.prop("messager.info"), $.i18n.prop("submit.success"), "info");
                        $dlgNewInterface.dialog("close");
                        loadRoles();
                    }else {
                        $.messager.alert($.i18n.prop("messager.warning"), $.i18n.prop("submit.fail"), "warning");
                    }
                }, "json");
            }
        },
        {
            text : $.i18n.prop("cancel"),
            iconCls : "icon-remove",
            handler : function() {
                logBehavior("log.behavior.dialog.close", ["newInterface"]);
                $dlgNewInterface.dialog("close");
            }
        }],
        onOpen : function() {
            $frmNewInterface = $("form", $dlgNewInterface);
            $frmNewInterface.form("clear");
            $frmNewInterface.form("disableValidation");
        }
    	
    });
    
    $(".panel-tool-close", $dlgNewInterface.dialog("header")).on("click", function() {
        logBehavior("log.behavior.dialog.x", ["newInterface"]);
    });

});

function newInterface() {
	logBehavior("log.behavior.dialog.open", ["interface.list", "newInterface"]);
	show1([]);
    $dlgNewInterface.dialog("open");

	$("#uploadFileNew").change(function() {
		if("json" == $("#uploadFileNew")[0].files[0].name.substring($("#uploadFileNew")[0].files[0].name.lastIndexOf(".") + 1)){
			show1(initAreaData(getObjectURL($("#uploadFileNew")[0].files[0])));
		}
	});

}

function getObjectURL(file) {
	var url = null;
	if(undefined != window.createObjectURL) {
		url = window.createObjectURL(file);//basic
	}else if(undefined != window.URL) {
		url = window.URL.createObjectURL(file);
	}else if(undefined != window.webkitURL) {
		url = window.webkitURL.createObjectURL(file);
	}
	return url;
}

function initAreaData(dataroot) {
	$.ajaxSettings.async = false;
	$.getJSON(dataroot, function(data) {
		Json = data.data;
	});
	return Json;
}

function show1(data){
	$('#ylNew').datagrid({
		title: '接口列表',
		width: 790,
		fitColumns: false,
		columns : [
			[{
				field : 'interfaceName',
				width : '230',
				title : '接口名称',
				align : 'center'
			},
			{
				field : 'interfaceWay',
				title : '请求方式',
				width : '100',
				align : 'center'
			},
			{
				field : 'interfaceUrl',
				title : 'URL',
				width : '428',
				align : 'center'
			}]
		],
		data : data,
		idField : 'id',
		loadMsg : 'Loading, please waiting',
		pagination : false,
	});
}
