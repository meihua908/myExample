function initAttendeeSelector(url,params)
{
	if(params == null){
		params = {};
	}
	params.orgId = $("#soid").val();
	params.clerkName = $("#clerkNameQuery").val();
	//params.soid = $("#soid").val();
	params.scontainSub = $("#scontainSub").val();
	//params.excepted = attendeeIds;
    $clerkNameQuery = $("#clerkNameQuery");
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
                    console.log("initAttendeeSelector : excepted = " +excepted);
                });
            }
            
            loadClerks();
        }
    });
    
   
}

//动态更改dgUnselectedClerk的属性
function changeTable(){
	var value = $('#selectType').combobox('getValue');
	var ele = $("span[name='selectName']");
	var value1 = $("#clerkNameQuery").val();
	if(value1 != null){
		$("#clerkNameQuery").val('');
	}
	if(value == 1){//选择设备组
		
		ele.text('组名称');
		$('#dgUnselectedClerk').datagrid({
			columns:[[
			          {idField:'deviceGroupId'},
			          {field:'ck',checkbox:true},
			          {field:'groupName',title:'设备组名称',width:'200'},
			          {field:'orgName',title:'机构名称',width:'200'},
			          {field:'lastUpdatedByName',title:'最近更新人',width:'250'},
			          
			          ]],
			          url:contextPath + '/terminal/deviceGroup/list',
			          method:'get',
			          singleSelect:true
		});
		
		
		//console.log("ele.value =" + ele.val());
		//ele.value = "设备组名称";
		
	}else if(value == 0){
		
		ele.text('职员姓名');
		var selectRows = $("#dgSelectedClerk").datagrid("getRows");//获取右边的所有记录
		var excepted = "";
		if(selectRows){
			$.each(selectRows,function(index,item){
				excepted += item.clerkId + ",";
			});
		}
		var param = {};
		$('#dgUnselectedClerk').datagrid({
			columns:[[
						{idField:'clerkId'},
						{field:'ck',checkbox:true},
						//{field:'clerkNo',title:'编号',width:'90'},
						{field:'clerkName',title:'职员姓名',width:'200'},
						{field:'deviceName',title:'设备名称',width:'200'},
						{field:'orgName',title:'机构名称',width:'250'},
						]],
			url:contextPath + '/meeting/selectAttendees/excepted',
			method:'get'
		});
		
	}
	loadClerks();
}

function searchClerks()
{
    logBehavior("log.behavior.page.query1", ["clerk.select","clerk.list"]);
    loadClerks();
}

function loadClerks()
{
	var value = $('#selectType').combobox('getValue');
	if(value == 1){
		$dgUnselectedClerk .datagrid("clearSelections");
		$dgUnselectedClerk.datagrid("load",{
			groupName:$("#clerkNameQuery").val(),
			orgId : $soid.val(),
		    containSub : $scontainSub.is(":checked")
		});
		
	}else if(value == 0){//下拉框选择为设备
		var selectedRows = $dgSelectedClerk.datagrid("getRows");
	    var excepted = "";
	    $.each(selectedRows, function(index, item)
	    {
	        excepted += item.clerkId + ",";
	        $("#dgSelectedClerk").datagrid("selectRow", index);
	    });
	    $dgUnselectedClerk.datagrid("clearSelections");
	    console.log("loadClerks : clerkNameQuery = " + $("#clerkNameQuery").val());
	    $dgUnselectedClerk.datagrid("load",{
	        excepted : excepted,
	        clerkName : $("#clerkNameQuery").val(),
	        orgId : $soid.val(),
	        containSub : $scontainSub.is(":checked")
	    });
	}
   
}


function moveRightClerk()
{
	
	logBehavior("参会者右移");
    var checkedRows = $dgUnselectedClerk.datagrid("getChecked");
    if (0 == checkedRows.length)
    {
    	$.messager.alert($.i18n.prop("messager.info"), $.i18n.prop("请至少选中一行"), "info");
    	return;
    }
    var rowIndex;
    if($('#selectType').combobox('getValue') == 1){//选择设备组，需要查询该设备组将包含的设备移至右边
    		var deviceGroupId = checkedRows[0].deviceGroupId;
    		$.ajax({
        		url: contextPath + '/terminal/deviceGroup/groupDetail/' + deviceGroupId,//查询该设备组的设备信息
        		type : "post",
        		dataType : 'json',
        		contentType : "application/json",
        		data : deviceGroupId,
        		success : function(data){
        			var groupDetailRows = data.rows;//
        			if(groupDetailRows.length == 0 || groupDetailRows == null){
        				alert("该设备组未添加设备，请先往设备组中添加设备");
        			}else{
        				
        				var selectedClerkRows = $("#dgSelectedClerk").datagrid("getRows");
        				console.log("已选中的职员信息 : " + JSON.stringify(selectedClerkRows));
        				var selectedClerkIds = [];
        				$.each(selectedClerkRows,function(index,item){
        					selectedClerkIds.push(item.clerkId);
        				});
        				console.log("selectedClerkIds = " + selectedClerkIds);
        				
        				$.each(groupDetailRows,function(index,groupDetailItem){
        					//设备组中的某条设备记录不在右边已选中,-1代表groupDetailItem.clerkId不在selectedClerkIds数组中
        					if($.inArray(groupDetailItem.clerkId,selectedClerkIds) == -1){
        						$("#dgSelectedClerk").datagrid("appendRow", groupDetailItem);
            					//$("#dgSelectedClerk").datagrid("selectRow", index);//移到右边后选中该行
        					}
            					
            			});
        				
        				selectedClerkRows = $("#dgSelectedClerk").datagrid("getRows");
        				console.log("length = " + selectedClerkRows.length);
        				$.each(selectedClerkRows,function(index,item){
        					$("#dgSelectedClerk").datagrid("selectRow", index);//移到右边后选中该行
        				});
        				/*var rowIndex = $("#dgUnselectedClerk").datagrid("getRowIndex",checkedRows[0]);//删除设备组行的记录
        				$("#dgUnselectedClerk").datagrid("deleteRow",rowIndex);*/
        			}
        		}
        	});
    	
    	
    }else if($('#selectType').combobox('getValue') == 0){
    	 $.each(checkedRows,function(index,item){
    	    	$("#dgSelectedClerk").datagrid("appendRow", item);
    	    	$("#dgSelectedClerk").datagrid("selectRow", index);//移到右边后选中该行
    	    });
    }
    
    loadClerks();
}


function moveLeftClerk()
{
	
	logBehavior("log.behavior.user.action3");
    
    var checkedRows = $("#dgSelectedClerk").datagrid("getChecked");

    if (0 == checkedRows.length)
    {
    	alert("请先选中一行");
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
        rowIndex = $("#dgSelectedClerk").datagrid("getRowIndex", item);
        $("#dgSelectedClerk").datagrid("deleteRow", rowIndex);
    });

    loadClerks();
}



/*
 * 将选中的行数的id和name传到new.jsp页面
 */


/*
 * 获取参加者的id列表
 * */
function getAttendeeIds(){
	 var rows = $("#dgSelectedClerk").datagrid("getChecked");
	 alert("rows.length = " + rows.length);
	 var attendeeIds = [];
	    if (0 == rows.length)
	    {
	      return;
	    }
	    else 
	    {
	    	//postClerkIdToMeeting(clerkId, rows);
	    	$.each(rows, function(index, item)
	    	    	{
	    				attendeeIds.push(item.clerkId);
	    	    	});
	    	return attendeeIds;
	    }
}

