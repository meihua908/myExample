﻿function publishChart() {
	
	logBehavior("log.behavior.dialog.open", ["chart.list", "remove"]);
    
    var messager = $.messager.confirm($.i18n.prop("publishChart"), $.i18n.prop("row.confirmPublish"), function(r) {
        if(r) {
            var rows = $dgRole.datagrid("getSelections");
            var list = [];
           
            $.each(rows, function(index, item) {
                list.push(item.chartId);
            });
            
            $.ajax({
                url : contextPath + "/manage/chart/publish",
                type : "post",
                dataType : "json",
                contentType : "application/json",
                data : $.toJSON(list),
                success : function(result) {
                    if("200" == result.returnCode) {
                        $.messager.alert($.i18n.prop("messager.info"), $.i18n.prop("submit.success"), "info");
                        loadRoles();
                    }else {
                        $.messager.alert($.i18n.prop("messager.warning"), $.i18n.prop("submit.fail"), "warning");
                    }
                }
            });
        }else {
            logBehavior("log.behavior.dialog.close", ["publishChart"]);
        }
    });
    
    $(".panel-tool-close", messager.window("header")).on("click", function() {
        logBehavior("log.behavior.dialog.x", ["publishChart"]);
    });
    
}