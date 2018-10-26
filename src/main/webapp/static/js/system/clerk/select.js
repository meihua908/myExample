function initClerkSelector(url, params)
{
	if (null == params) {
		params = {};
	}
    params.orgId = $("#soid").val();
    $suname = $("#suname");
    $soid = $("#soid");
    $scontainSub = $("#scontainSub");
    $dgUnselectedClerk = $("#dgUnselectedClerk");
    $dgSelectedClerk = $("#dgSelectedClerk").datagrid(
    {
        url : url,
        method : "get",
        queryParams : params,
        onLoadSuccess : function(data)
        {
            var excepted = "";
            if (data.rows.length > 0)
            {
                $.each(data.rows, function(index, item)
                {
                    excepted += item.clerkId + ",";
                });
            }
            
            loadClerks();
        }
    });
}

function searchClerks()
{
    logBehavior("log.behavior.page.query1", ["clerk.select","clerk.list"]);
    loadClerks();
}

function loadClerks()
{
    var selectedRows = $dgSelectedClerk.datagrid("getRows");
    var excepted = "";

    $.each(selectedRows, function(index, item)
    {
        excepted += item.clerkId + ",";
    });
    
    $dgUnselectedClerk.datagrid("clearSelections");
    $dgUnselectedClerk.datagrid("load",{
        excepted : excepted,
        clerkNo : $suname.val(),
        orgId : $soid.val(),
        containSub : $scontainSub.is(":checked")
    });
}

function moveRightClerk()
{
    logBehavior("log.behavior.user.action2");

    var checkedRows = $dgUnselectedClerk.datagrid("getChecked");

    if (0 == checkedRows.length)
    {
        return;
    }

    $.each(checkedRows, function(index, item)
    {
        $dgSelectedClerk.datagrid("appendRow", item);
    });

    loadClerks();
}

function moveLeftClerk()
{
    logBehavior("log.behavior.user.action3");
    
    var checkedRows = $dgSelectedClerk.datagrid("getChecked");

    if (0 == checkedRows.length)
    {
        return;
    }

    var list = [];

    $.each(checkedRows, function(index, item)
    {
        list.push(item.clerkId);
    });

    var rowIndex;

    $.each(list, function(index, item)
    {
        rowIndex = $dgSelectedClerk.datagrid("getRowIndex", item);
        $dgSelectedClerk.datagrid("deleteRow", rowIndex);
    });

    loadClerks();
}