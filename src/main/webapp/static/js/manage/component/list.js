$(function() {
    
    $btnRemoveComponent = $("#btnRemoveComponent");
    $btnShowComponent = $("#btnShowComponent");
    
    $dgRole = $("#dgRole").datagrid({
        onSelect : function(rowIndex, rowData) {
            enableToolbar();
        },
        onUnselect : function(rowIndex, rowData) {
            enableToolbar();
        },
        onSelectAll : function(rows) {
            enableToolbar();
        },
        onUnselectAll : function(rows) {
            enableToolbar();
        }
    });
    
});

function enableToolbar() {
    var length = $dgRole.datagrid("getSelections").length;
    if (1 == length) {
    	$btnRemoveComponent.linkbutton("enable");
    	$btnShowComponent.linkbutton("enable");
    }else {
        $btnRemoveComponent.linkbutton("disable");
        $btnShowComponent.linkbutton("disable");
    }
    
    if (length > 0) {
    	$btnRemoveComponent.linkbutton("enable");
    }else {
        $btnRemoveComponent.linkbutton("disable");
        $btnShowComponent.linkbutton("disable");
    }
}

function searchComponent() {
    logBehavior("log.behavior.page.query", ["component.manage","component.list"]);
    if ($("#keywordD").form("validate")) {
    	loadRoles();
    }
}

function loadRoles() {
    $dgRole.datagrid("clearSelections");
    var param = {};
    param.keyword = $("#keyword").val();
    $dgRole.datagrid("load", param);
}
