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
	var myData1=[];
	var getMaxArr = [];
	$.get(url,function(data,status){
		//console.log("服务器返回的数据:" + JSON.stringify(data));
		showData = data;
		var length=showData.rows.length;
 	    var areaObject= showData.rows;
 	    console.log(length);
 	    for(var i=0;i<length;i++){	
			 myData1.push([areaObject[i].deviceName, areaObject[i].attendeeAmount]);
			 getMaxArr.push(areaObject[i].attendeeAmount);//得到所有设备的参会次数，并放到数组中
	    }
 	    console.log(myData1);
 	    var max = upNumber(getMax(getMaxArr,"max"));//获取参会次数的最大值已设置y轴的值
 	    $('#jqChart1').jqChart({
 	         title: { text: '网点参会次数图表' },
 	         animation: { duration: 1 },
 	         shadows: {
 	             enabled: true
 	         },
 	         series: [
 	                  {
 	                	  type: 'column',
 	                	  title: '参会次数',
 	                	  data: myData1
 	                	  //data : [['A',90],['A',90],['A',80],['A',106],['A',90],['A',91],['A',94],['A',95],['A',95],['A',94],['A',98],['A',84],['A',88],['b',87],['c',84],['D',92]]
 	                  }
 	                  ],
 	         axes: [
 	                {
 	                	location: 'bottom',
 	 	                //type : 'linear',
 	 	                extendRangeToOrigin : true,
 	 	                //minimum : 0,
 	 	                //maximum : max,
 	 	                zoomEnabled: true,
 	 	                //mouseWheelZoomStep:0.001
 	 	                //interval : 1
 	                }
 	                
 	               ]
 	     });
	});
});

//数组选出最大值或最小值
function getMax(arr,flag){
	if(flag == "max"){
		return Math.max.apply(Math,arr);
	}else if(flag == "min"){
		return Math.min.apply(Math.arr);
	}
}

/*： num = 10,return 10;
       num = 9,return 10;
       num = 25,return 30;
       num = 81 ,return 90;
       如果num不是10的整数倍，如num=81，返回90
*/
function upNumber(num){
	if(num % 10 == 0){
		return num;
	}else{
		return Math.ceil(num / 10) * 10;
	}
	
	
}

