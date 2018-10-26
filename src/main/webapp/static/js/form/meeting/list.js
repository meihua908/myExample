$(function()
{
    //$meetingType = $("#meetingType");
    $meetingSubject = $("#meetingSubject");
    $oid = $("#oid");
    $containSub = $("#containSub");
    $beginDate = $("#beginDate");
    $endDate = $("#endDate");
    $btnExportMeetingForm = $("#btnExportMeetingForm");
    $dgMeetingFrom = $("#dgMeetingForm");
    //alert(111);
    // 初始化设备类型
	/*$("input[name='meetingType']").combobox({
		url : contextPath + "/terminal/devices/dicData?dicType=meetingTypes",
		method : "get",
		valueField : "dicKey",
		textField : 'dicValue',
		onLoadSuccess : function() {
			$(this).combobox('select', 0);
		}
	});*/
});


function searchMeetingFroms()
{
    logBehavior("log.behavior.page.query", ["会议报表","meetingFrom.list"]);
    loadMeetingFroms();
}

function loadMeetingFroms()
{
    $dgMeetingFrom.datagrid("clearSelections");
    var param = {};
    param.orgId = $oid.val();
    param.containSub = $containSub.val();
    param.beginDate = $beginDate.datetimebox('getValue');
    param.endDate = $endDate.datetimebox('getValue');
    if(param.beginDate > param.endDate){
   		$.messager.alert("警告", "开始时间不能大于结束时间！", "warning");
		return;
	 }
    console.log(param);
    //alert(param);
    $dgMeetingFrom.datagrid("load", param);
}

//export MeetingForm
function exportMeetingForm()
{
	var orgId = $oid.val();
	var containSub = $containSub.val();
	var beginTime = new Date($beginDate.datetimebox('getValue'));
	var beginDate = beginTime.getTime();
	var endTime = new Date($endDate.datetimebox('getValue'));
	var endDate = endTime.getTime();
	//alert(beginDate);
    window.location.href = contextPath + "/form/meetings/export?orgId="+orgId+"&containSub="+containSub+"&beginDate="+beginDate+"&endDate="+endDate;
	
}

//时长图表

function showDuration(){
    logBehavior("log.behavior.dialog.open", ["form.list", "form.setMembership"]);
    var $dlgDuration;
    if (!$dlgDuration)
    {
    	$dlgDuration = $("<div style='padding: 15px 15px;' id='dlgDuration' />");
    	$dlgDuration.dialog(
        {
            closed : true,
            modal : true,
            cache : true,
            title : "时长图表",
            width : 800,
            height : 460,
            href : contextPath + "/form/meeting/duration",
            buttons : [
            {
                text : $.i18n.prop("cancel"),
                iconCls : "icon-remove",
                handler : function()
                {
                    logBehavior("log.behavior.dialog.close", ["时长图表"]);
                   // $dlgDuration.dialog("destory");
                    $dlgDuration.dialog("close");
                }
            }],
            onClose : function(){
	        	  $(this).dialog("destroy");
	          }
           
        });
        
        $(".panel-tool-close", $dlgDuration.dialog("header")).on("click", function()
        {
            logBehavior("log.behavior.dialog.x", ["role.setMembership"]);
        });
    }
    
    $dlgDuration.dialog("open");
}

//次数图表

function showFrequency(){
    logBehavior("log.behavior.dialog.open", ["form.list", "form.setMembership"]);
    var $dlgFrequency;
    if (!$dlgFrequency)
    {
    	$dlgFrequency = $("<div style='padding: 15px 15px;overflow:hidden;' id='dlgFrequency' />");
    	$dlgFrequency.dialog(
        {
            closed : true,
            modal : true,
            cache : true,
            title : "次数图表",
            width : 800,
            height : 460,
            href : contextPath + "/form/meeting/frequency",
            buttons : [
            {
                text : $.i18n.prop("cancel"),
                iconCls : "icon-remove",
                handler : function()
                {
                    logBehavior("log.behavior.dialog.close", ["次数图表"]);
                    $dlgFrequency.dialog("close");
                }
            }],
            onClose:function(){
            	$(this).dialog("destory");
            }
           
        });
        
        $(".panel-tool-close", $dlgFrequency.dialog("header")).on("click", function()
        {
            logBehavior("log.behavior.dialog.x", ["role.setMembership"]);
        });
    }else{
    	alert("次数 else");
    	$("#jqChart").jqChart("update");
    }
    
    $dlgFrequency.dialog("open");
}

