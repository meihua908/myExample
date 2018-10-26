var $dlgSelectUrl;
function bindComponent() {
    logBehavior("log.behavior.dialog.open", ["bindComponent"]);

    if(!$dlgSelectUrl) {
        var timeC = 0;

	    $dlgSelectUrl = $("<div style='padding: 15px 15px;overflow:auto;' id='dlgSelectUrl' />");
	    $dlgSelectUrl.dialog({
	        closed : true,
	        modal : true,
	        cache : false,
	        title : $.i18n.prop("bindComponent"),
	        width : 970,
	        height : 450,
	        href : contextPath + "/manage/nobindComponent/pages",
	        
	        buttons : [{
	            text : $.i18n.prop("submit"),
	            iconCls : "icon-ok",
	            handler : function() {
	                var row = $dgRole.datagrid("getSelections")[0];
	                submitFunUrl(row.interfaceId);
	            }
	        },
	        {
	            text : $.i18n.prop("cancel"),
	            iconCls : "icon-remove",
	            handler : function()
	            {
	                logBehavior("log.behavior.dialog.close", ["bindComponent"]);
	                $dlgSelectUrl.dialog("close");
	            }
	        }],
	        onOpen : function() {
//	        	$dgRole.datagrid("reload");
	        	if (0 != timeC) {
	        		searchCom1();
	        	}
	        	timeC ++;
	        },
            onLoad : function() {
            	searchCom1();
            }
	    });
	    
	    $(".panel-tool-close", $dlgSelectUrl.dialog("header")).on("click", function() {
	        logBehavior("log.behavior.dialog.x", ["bindComponent"]);
	    });
    }
    
    $dlgSelectUrl.dialog("open");
}

function submitFunUrl(funId) {
    var rows = $dgUnselectedComp.datagrid("getSelections");
    if (0 == rows.length) {
        $.messager.confirm($.i18n.prop("messager.confirm"), $.i18n.prop("userWatch.confirmUnselected"), function(r) {
            if(r) {
                postFunUrl(funId, null);
            } else {
                logBehavior("log.behavior.fun.action1");
            }
        });
    }else if(1 < rows.length) {
        $.messager.confirm($.i18n.prop("messager.confirm"), $.i18n.prop("noOneMoreSelected"));
    }else {
        postFunUrl(funId, rows);
        $dgUnselectedComp.datagrid("clearSelections");
    }
}

function postFunUrl(funId, rows) {
    var list = [];

    if (null != rows) {
        $.each(rows, function(index, item) {
            list.push(item.componentId);
        });
    }

    var postData = $.toJSON(list);

    $.ajax({
    	url : contextPath + "/manage/interface/" + funId + "/bindComponent",
        type : "post",
        dataType : "json",
        contentType : "application/json",
        data : postData,
        success : function(result) {
            if("200" == result.returnCode) {
                $.messager.alert($.i18n.prop("messager.info"), $.i18n.prop("submit.success"), "info");
                $dlgSelectUrl.dialog("close");
                loadRoles();
            }else {
                $.messager.alert($.i18n.prop("messager.warning"), $.i18n.prop("submit.fail"), "warning");
            }
        }
    });
}
