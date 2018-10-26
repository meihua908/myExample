$(function() {
    
    $btnRemoveChart = $("#btnRemoveChart");
    $btnPublishChart = $("#btnPublishChart");
    $btnPreviewChart = $("#btnPreviewChart");
    
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
    	$btnRemoveChart.linkbutton("enable");
    	$btnPreviewChart.linkbutton("enable");
    	if("已发布" != ($dgRole.datagrid("getSelections")[0].status)) {
    		$btnPublishChart.linkbutton("enable");
    	}else {
    		$btnPublishChart.linkbutton("disable");
    	}
    }else {
        $btnRemoveChart.linkbutton("disable");
        $btnPreviewChart.linkbutton("disable");
        $btnPreviewChart.linkbutton("disable");
    }
    
    if (length > 0) {
    	$btnRemoveChart.linkbutton("enable");
    	if("已发布" != ($dgRole.datagrid("getSelections")[0].status)) {
    		$btnRemoveChart.linkbutton("enable");
    	}else {
    		$btnRemoveChart.linkbutton("disable");
    	}
    }else {
        $btnRemoveChart.linkbutton("disable");
        $btnPublishChart.linkbutton("disable");
        $btnPreviewChart.linkbutton("disable");
    }
}

function searchChart() {
    logBehavior("log.behavior.page.query", ["chart.manage","chart.list"]);
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

function previewChart(){
	var chartId = $dgRole.datagrid("getSelections")[0].chartId;
	$.ajax({
        url : contextPath + "/manage/chart/getChartInfoById",
        type : "post",
        dataType : "json",
        data : {"chartId":chartId},
        success : function(result) {
            if(result.Error_code == "0") {
               var  iHeight= window.screen.availHeight;
     		   var iWidth = window.screen.availWidth;
     		   var url = result.newPath;	 
     		   window.open(url,"_blank","width=" + iWidth + ", height=" + iHeight + ",toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no,alwaysRaised=yes,depended=yes");
            }else {
                $.messager.alert($.i18n.prop("messager.warning"), $.i18n.prop("submit.fail"), "warning");
            }
        }
    });
	
}
