function initClerksSearch()
{
    $orgId = $("#soid").val();
    $clerkNo = $("input[name='clerkNo']");
    $soid = $("#soid");
    $scontainSub = $("#scontainSub");
    $dgSearchClerk = $("#dgSearchClerk");
    loadClerk();
}

function searchClerk()
{
    logBehavior("log.behavior.page.query1", ["clerk.select","clerk.list"]);
    loadClerk();
}

function loadClerk()
{
   /* var selectedRow = $("#dgSearchClerk").datagrid("getRows");
   
    var excepted = "";

    $.each(selectedRow, function(index, item)
    {
        excepted += item.clerkId+",";
    });*/
	var cNo = $("input[name='clerkNo']").val();
	console.log("cNo = " + cNo);
    $("#dgSearchClerk").datagrid("clearSelections");
    $("#dgSearchClerk").datagrid("load",{
       // excepted : excepted,
        clerkName : $("input[name='clerkName']").val(),
        orgId : $("input[name='soid']").val(),
        containSub : $("input[name='scontainSub']").is(":checked")
    });
}

/*
 * 将主持人账号信息传到new.jsp页面
 * */
function submitHostAccount(hostAccountId)
{
    var rows = $("#dgSearchClerk").datagrid("getChecked");
    if (0 == rows.length)
    {
        $.messager.confirm($.i18n.prop("messager.confirm"), $.i18n.prop("user.confirmUnselected"), function(r)
        {
            if (r)
            {
            	
            	$("input[name='clerkId']").val(clerkId);
                $("input[name='hostAccount']").val(clerkName);
                $dlgSelectHostAccount.dialog("close");
            }
            else
            {
                logBehavior("log.behavior.role.action1");
            }
        });
    }
    else 
    {
    	//postClerkIdToMeeting(clerkId, rows);
    	$.each(rows, function(index, item)
    	    	{
    				hostAccountId = item.clerkId;
    	    	    clerkName = item.clerkName;
    	    	});
    	    	$("input[name='hostAccountId']").val(hostAccountId);
    	        $("input[name='hostAccount']").val(clerkName);
    	        
    	        $dlgSelectHostAccount.dialog("close");
    }
}


function getHostAccountId(){
	 var rows = $("#dgSearchClerk").datagrid("getChecked");
	 var hostAccountId ;
	    if (0 == rows.length)
	    {
	        $.messager.confirm($.i18n.prop("messager.confirm"), $.i18n.prop("user.confirmUnselected"), function(r)
	        {
	            if (r)
	            {
	            	
	            	$("input[name='clerkId']").val(clerkId);
	                $("input[name='hostAccount']").val(clerkName);
	                $dlgSelectHostAccount.dialog("close");
	            }
	            else
	            {
	                logBehavior("log.behavior.role.action1");
	            }
	        });
	    }
	    else 
	    {
	    	//postClerkIdToMeeting(clerkId, rows);
	    	$.each(rows, function(index, item)
	    	    	{
	    	    	    hostAccountId = item.clerkId;
	    	    	});
	    	return hostAccountId;
	    }
}
