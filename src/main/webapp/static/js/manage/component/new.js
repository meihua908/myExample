$(function() {
    $dlgNewComponent = $("#dlgNewComponent").dialog({
        buttons : [{
            text : $.i18n.prop("submit"),
            iconCls : "icon-ok",
            handler : function() {
                if (undefined == $('#uploadFileNew').val() || "" == $('#uploadFileNew').val()) {
                    logBehavior("log.behavior.dialog.invaild", ["newComponent"]);
                    $.messager.alert($.i18n.prop("messager.warning"), $.i18n.prop("component.validation.message1"), "error");
                    return;
                }
            	$('#fileUploadForm').form('submit', {
            	    url : contextPath + "/manage/component/uploadFolder",
            	    onSubmit : function() {},
            	    success : function(data) {
            	    	var result = eval('(' + data + ')');
                        if("200" == result.returnCode) {
                            $.messager.alert($.i18n.prop("messager.info"), $.i18n.prop("submit.success"), "info");
                            $dlgNewComponent.dialog("close");
                            loadRoles();
                        }else {
	                        $.messager.alert($.i18n.prop("messager.warning"), $.i18n.prop("submit.fail"), "error");
                        }
            	    }
            	});
            }
        },
        {
            text : $.i18n.prop("cancel"),
            iconCls : "icon-remove",
            handler : function() {
                logBehavior("log.behavior.dialog.close", ["newComponent"]);
                $dlgNewComponent.dialog("close");
            }
        }],
        onOpen : function() {
            $frmNewComponent = $("form", $dlgNewComponent);
            $frmNewComponent.form("clear");
            $frmNewComponent.form("disableValidation");
        }
    	
    });
    
    $(".panel-tool-close", $dlgNewComponent.dialog("header")).on("click", function() {
        logBehavior("log.behavior.dialog.x", ["newComponent"]);
    });

});


function newComponent() {
	logBehavior("log.behavior.dialog.open", ["component.list", "newComponent"]);
	$('#componentThumbNew').attr('src', contextPath + "/static/lib2/images/default.png");
    $dlgNewComponent.dialog("open");

    document.getElementById("uploadFileNew").addEventListener("change", function(event) {
    	let files = event.target.files;
    	for(let i=0; i<files.length; i++) {
    		if("json" == files[i].name.substring(files[i].name.lastIndexOf(".") + 1) && "china.json" != files[i].name){
    			initAreaData(getObjectURL(files[i]));
    		}
    		if("border80.png" != files[i].name){
    			if(("png" == files[i].name.substring(files[i].name.lastIndexOf(".") + 1) || "jpg" == files[i].name.substring(files[i].name.lastIndexOf(".") + 1) && "border80.png" != files[i].name)) {
        			$("#componentThumbNew").attr("src", getObjectURL(files[i]));
        		}
    		}
    	}
	}, false);

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
	$.ajax({
		url:dataroot,
		type:'get',
		cache:true,
		async:false,
		success:function(data) {
	    	$('input[name="componentName"]').val(data.componentName);
	    	$('input[name="componentNo"]').val(data.componentNo);
	    	$('input[name="componentType"]').val(data.componentType);
	    	$('textarea[name="remark"]').val(data.remark);
	    }
	})
}
