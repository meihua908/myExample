function removeChart() {
	
	logBehavior("log.behavior.dialog.open", ["chart.list", "remove"]);
    
    var messager = $.messager.confirm($.i18n.prop("removeChart"), $.i18n.prop("row.confirmDelete"), function(r) {
        if(r) {
            var rows = $dgRole.datagrid("getSelections");
            var list = [];
           
            $.each(rows, function(index, item) {
                list.push(item.chartId);
            });
            
            $.ajax({
                url : contextPath + "/manage/chart/remove",
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
            logBehavior("log.behavior.dialog.close", ["removeChart"]);
        }
    });
    
    $(".panel-tool-close", messager.window("header")).on("click", function() {
        logBehavior("log.behavior.dialog.x", ["removeChart"]);
    });
    
}