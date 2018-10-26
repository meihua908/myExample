function initClerkSearch()
{
    $orgId = $("#soid").val();
    $suname = $("#suname");
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
	
    var selectedRow = $dgSearchClerk.datagrid("getRows");
   
    var excepted = "";

    $.each(selectedRow, function(index, item)
    {
        excepted += item.clerkId+",";
    });
    //alert(excepted);
    $dgSearchClerk.datagrid("clearSelections");
    $dgSearchClerk.datagrid("load",{
        excepted : excepted,
        clerkName : $suname.val(),
        orgId : $soid.val(),
        containSub : $scontainSub.is(":checked")
    });
}

