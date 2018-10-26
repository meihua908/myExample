$(function() {
	Data = [];
	$dlgShowInterface = $("#dlgShowInterface").dialog({
        onOpen : function() {
            $frmEditInterface = $("form", $dlgShowInterface);
            $frmEditInterface.form("clear");
            var row = $dgRole.datagrid("getSelections")[0];
            $frmEditInterface.form("load", row);
            show2(row.interfaceId);
        }
    });

    $(".panel-tool-close", $dlgShowInterface.dialog("header")).on("click", function() {
        logBehavior("log.behavior.dialog.x", ["showInterface"]);
    });
        
});

function showInterface() {
    logBehavior("log.behavior.dialog.open", ["interface.list", "detail"]);
    $dlgShowInterface.dialog("open");
}

function show2(interfaceId){
    $.ajax({
    	url : contextPath + "/manage/interface/" + interfaceId + "/show",
        type : "post",
        dataType : "json",
        contentType : "application/json",
        async : false,
        data : {},
        success : function(result) {
        	Data = result.data;
        }
    });
	
	$('#ylShow').datagrid({
		title: '接口列表',
		width: 550,
		fitColumns: false,
		columns : [
			[{
				field : 'paramName', //每一列的名字
				width : '200',
				title : '参数名称',
				align : 'center'
			},
			{
				field : 'paramDefault',
				title : '参数类型',
				width : '320',
				align : 'center'
			}]
		],
		data : Data,
		idField : 'paramId',
		loadMsg : 'Loading, please waiting',
		pagination : false,
	});
}
