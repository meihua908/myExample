$(function()
{
 	var param = {};
 	param.orgId = $oid.val();
	param.containSub = $containSub.is(':checked');
	param.beginDate = $beginDate.datetimebox('getValue');
	param.endDate = $endDate.datetimebox('getValue');
	console.log(param);
	
	var date = new Date().getTime();
	var url = contextPath + "/form/flowCountData?r=" + date +"&orgId="+param.orgId+"&containSub="+param.containSub;
	url = url + "&beginDate="+param.beginDate + "&endDate=" + param.endDate;
	var showData;
	var myData=[];
	$.get(url,function(data,status){
		showData = data;
		var length=showData.rows.length;
 	    var areaObject= showData.rows;
 	    console.log(length);
 	    for(var i=0;i<length;i++){	
			 myData.push([areaObject[i].deviceName, areaObject[i].timeDiff]);
	    }
 	    console.log(myData);
 	    
 	    $('#jqChart').jqChart({
 	         title: { text: '网点会议时长图表' },
 	         animation: { duration: 1 },
 	         shadows: {
 	             enabled: true
 	         },
 	         series: [
 	             {
 	                 type: 'column',
 	                 title: '会议时长（分钟）',
 	                 data: myData,
 	                 //data : [['A',90],['A',90],['A',80],['A',106],['A',90],['A',91],['A',94],['A',95],['A',95],['A',94],['A',98],['A',84],['A',88],['b',87],['c',84],['D',92]]
 	             }
 	         ],
 	        axes: [
 	              {   
 	                  location: 'bottom',
 	                  zoomEnabled: true,
 	                 // mouseWheelScrollStep:100,
 	                  mouseWheelZoomStep:0.001
 	              }
 	          ]
 	        
 	     });
	});
});

