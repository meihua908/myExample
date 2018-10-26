var row;
$(function() {
    $dlgShowComponent = $("#dlgShowComponent").dialog({
        onOpen : function() {
            $frmEditComponent = $("form", $dlgShowComponent);
            $frmEditComponent.form("clear");
            $frmEditComponent.form("disableValidation");
            row = $dgRole.datagrid("getSelections")[0];
            $frmEditComponent.form("load", row);        
            
            $("input[name='componentName']", $frmEditComponent).focus();
        }
    });

    $(".panel-tool-close", $dlgShowComponent.dialog("header")).on("click", function() {
        logBehavior("log.behavior.dialog.x", ["showComponent"]);
    });
        
});

function showComponent() {
    logBehavior("log.behavior.dialog.open", ["component.list", "detail"]);
    loadImage("Show")
    $dlgShowComponent.dialog("open");
}

function loadImage(cc) {
	var componentId = $dgRole.datagrid("getSelections")[0].componentId;
	var url = contextPath + "/manage/component/componentPath?componentId=" + componentId;
	$.get(url, function(data) {
		if ("200" == data.returnCode) {
			$('#componentThumb' + cc).attr('src', data.componentPath + row.componentType +".png");
			console.log("data:" + $('#componentThumb' + cc).attr('src'));
		}else {
			console.log("缩略图路径不正确");
			$('#componentThumb' + cc).attr('src', contextPath + "/static/lib2/images/default.png");
		}
	});
}
