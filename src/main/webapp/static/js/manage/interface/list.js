$(function() {
    
    $btnRemoveInterface = $("#btnRemoveInterface");
    $btnShowInterface = $("#btnShowInterface");
    $btnBindComponent = $("#btnBindComponent");
    $btnUnbindComponent = $("#btnUnbindComponent");
    
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
    	$btnRemoveInterface.linkbutton("enable");
    	$btnShowInterface.linkbutton("enable");
    	if(null != ($dgRole.datagrid("getSelections")[0].componentNo)) {
    		$btnBindComponent.linkbutton("disable");
    	}else {
    		$btnBindComponent.linkbutton("enable");
    	}
    }else {
        $btnRemoveInterface.linkbutton("disable");
        $btnShowInterface.linkbutton("disable");
        $btnBindComponent.linkbutton("disable");
    }
    
    if (length > 0) {
    	$btnRemoveInterface.linkbutton("enable");
    	if(null == ($dgRole.datagrid("getSelections")[0].componentNo)) {
    		$btnUnbindComponent.linkbutton("disable");
    	}else {
    		$btnUnbindComponent.linkbutton("enable");
    	}
    }else {
        $btnRemoveInterface.linkbutton("disable");
        $btnShowInterface.linkbutton("disable");
        $btnBindComponent.linkbutton("disable");
		$btnUnbindComponent.linkbutton("disable");
    }
}

function searchInterface() {
    logBehavior("log.behavior.page.query", ["interface.manage","interface.list"]);
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
