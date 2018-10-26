
$(function(){
	var tempIndex = 1;
	var comObj = null;
	var eChartdiv;
	var dragFlag = 0;
	var myObjId;
	var compType;
	var compNo;
	var mapJsonUrl;
	var pieData = [{name:'南京奥拓',value:900},{name:'深圳奥拓',value:500},{name:'上海奥拓',value:300}];
	var barData = [120, 200, 150, 80, 70, 110, 130];
	var lineData = [820, 932, 901, 934, 1290, 1330, 1320];	
	var x1,x2,y1,y2;
	var scale;
	var changeScale = function(divobj){
		scale=$("#container").css("transform").split("(")[1].split(",")[0];
   	 	x1 = $("#container").offset().left+10;
		 y1 = $("#container").offset().top+10;
		 x2=x1+($("#container").width()-10)*scale-divobj.width()*scale;
		 y2=y1+($("#container").height()-10)*scale-divobj.height()*scale;
		 divobj.draggable("option", "containment", [x1,y1,x2,y2]);
	};
	$.ajax({
		url : contextPath + "/manage/chart/InitChartCompent",
		type : "post",
		async : false,
		dataType : "json",					
		success : function(result)
		{
		
			if(result.Error_code == "0"){
			  var myData = result.Data;
			  var myHtml = "";
		      for(var k=0;k<myData.length;k++){
		    	  if(myData[k].componentType=='map'||myData[k].componentType=='line'||myData[k].componentType=='bar'||myData[k].componentType=='pie'||myData[k].componentType=='population'||myData[k].componentType=='time'||myData[k].componentType=='date'){
			    		  myHtml = '<li>'+
	 		             '<div id="'+myData[k].componentId+'" compNo="'+myData[k].componentNo+'" type="'+myData[k].componentType+'" draggable="true" class="comp ui-widget-content ui-draggable ui-draggable-handle"><img src="'+myData[k].picPath+'" width="100%",height="100%"></div>'+
	 		             /*if(myData[k].componentType == "map"){
		    		            	 jsPath = myData[k].jSPath;
		    		            	 mapJsonUrl = jsPath.substring(0,jsPath.lastIndexOf("/")-3)+"/china.json";
		    		            	 
	 		             }*/
	 		             '<script type="text/javascript" src="'+myData[k].jSPath+'"></script>'+
	 		        '</li>' +myHtml;
		    	  }else{
		    		  myHtml += '<li>'+
 		             '<div id="'+myData[k].componentId+'" compNo="'+myData[k].componentNo+'" type="'+myData[k].componentType+'" draggable="true" class="comp ui-widget-content ui-draggable ui-draggable-handle"><img src="'+myData[k].picPath+'" width="100%",height="100%"></div>'+
 		             /*if(myData[k].componentType == "map"){
	    		            	 jsPath = myData[k].jSPath;
	    		            	 mapJsonUrl = jsPath.substring(0,jsPath.lastIndexOf("/")-3)+"/china.json";
	    		            	 
 		             }*/
 		             '<script type="text/javascript" src="'+myData[k].jSPath+'"></script>'+
 		        '</li>';
		    	  }
		    	  
		      }		 
			  $("#compentInfo").html("");
			  $("#compentInfo").html(myHtml);
			}else{
				$.messager.alert($.i18n.prop("messager.info"),"组件加载失败!", "info");
			}
		}
	 });
	
     $("#resolution").change(function(){
    	 var resValue = $(this).val();
    	 var width = resValue.split("*")[0]+"px";
    	 var height = resValue.split("*")[1]+"px";;
    	 $("#container").css({"width":width,"height":height,"background-size":width+" "+height});
    	 //设计面板的宽高如果过大就加个缩放
    	 switch(height){
    	 case '1080px':
    		 $("#container").css({"transform":"scale(0.63) translate(-563px,-317px)"});
    		 scale=$("#container").css("transform").split("(")[1].split(",")[0];
    		 $("#container-box").width($("#container").width()*scale);
    		 $("#container-box").height($("#container").height()*scale);
    		 break;
    	 case '960px':
    		 $("#container").css({"transform":"scale(0.8875) translate(-81px,-61px)"});
    		 scale=$("#container").css("transform").split("(")[1].split(",")[0];
    		 $("#container-box").width($("#container").width()*scale);
    		 $("#container-box").height($("#container").height()*scale);
    		 break;
    	 case '720px':
    		 $("#container").css({"transform":"scale(0.946) translate(-37px,-20px)"});
    		 scale=$("#container").css("transform").split("(")[1].split(",")[0];
    		 $("#container-box").width($("#container").width()*scale);
    		 $("#container-box").height($("#container").height()*scale);
    		 break;
    	 default:
    		 $("#container").css({"transform":"scale(1)"});
	    	 $("#container-box").width($("#container").width()*scale);
			 $("#container-box").height($("#container").height()*scale);
    	 };
    	 changeScale($( ".com_style" ));
     });
     
     
     $("#uploadBkPic").change(function(){
   	 var path = $("#uploadBkPic")[0].files[0];
     var objUrl = getObjectURL(path);
   	 var width = $("#resolution").val().split("*")[0]+"px";
   	 var height = $("#resolution").val().split("*")[1]+"px";
   	 $("#container").css({"width":width,"height":height,"background-color":"transparent","background-image":"url("+objUrl+")","background-repeat":"no-repeat","background-size":"100% 100%","-moz-background-size":"100% 100%"}); 
   	 $("#BkPicURL").val(path.name);
     });
     
     var bkColor;
     $("#uploadBkColor").spectrum({
	    color: "#fff",
	    change :function(color){
	    	bkColor = color.toHexString();
	    	$("#container").css({"background-image":"none","background-color":bkColor});
	    	$("#BkPicColor").val(bkColor);
	    }
     });
	
     
	//设置组件可复制移动
	$(".comp").draggable({
		helper:"clone",
		drag : function(event, ui){   //当鼠标开始拖拽时，触发此事件。
			dragFlag = 1;
			var obj = event.srcElement || event.target;                    
			compType = $(obj).attr("type");
			compNo = $(obj).attr("compNo");
			myObjId = (event.srcElement || event.target).id;			
	    },
		stop: function(event, ui){   //当移动结束鼠标松开时，触发此事件。
			dragFlag = 0;
		}
	});
	
	 //"放"的操作代码
	var checkChartId = null;
	$("#container").droppable({
		  //zIndex : 999,
		  create : function(event, ui) {//当创建droppable时触发
		       
		  },
		  activate: function(event, ui) {//当任何可拖拽元素开始拖拽动作时激活此事件。
		       
		  },
		  drop:function(event,ui){ //当移动结束鼠标松开时，触发此事件
			    if(dragFlag == 1){
			    	
			    	comObj = $("<div class='com_style' compId='"+myObjId+"' type='"+compType+"' compNo='"+compNo+"'></div>");
				  	comObj.css({position: "absolute", top: ui.offset.top + "px",left: ui.offset.left-256 + "px"});
				  	$(this).append(comObj);
				    eChartdiv = document.createElement('div');
				    eChartdiv.style.position = "absolute";
				    eChartdiv.style.zIndex=5;
				    if(compType == "map"){
				    	eChartdiv.style.width = "750px";
					    eChartdiv.style.height = "400px";
				    }else{
				    	eChartdiv.style.width = "325px";
					    eChartdiv.style.height = "300px";
				    }
				    eChartdiv.id ="eCharts"+tempIndex;
				    comObj.append(eChartdiv);
				    var eChartObj = document.getElementById(eChartdiv.id);	
				    //首字母转为大写
				    function titleCase(str) {
				    	  var array = str.toLowerCase().split(" ");
				    	  for (var i = 0; i < array.length; i++){
				    	    array[i] = array[i][0].toUpperCase() + array[i].substring(1, array[i].length);
				    	  }
				    	  var string = array.join(" ");
				    	  return string;
				    	}
				    //拼接函数名
				    var init = "Init"+titleCase(compType);
				    var data = compType+"data"
				    if(compType == "map"){
				    	$("#"+eChartdiv.id).parent().css({"width":"770px","height":"420px"});
				    	window[init](eChartObj,'main_class');	
				    }else if(compType == "population"||compType == "flow"){
						window[init](eChartObj,eChartdiv.id);	
				    }else if(compType == "time"||compType == "date"){
				    	$("#"+eChartdiv.id).parent().css({"background-image":"none","width":"180px","height":"70px"});
				    	$("#"+eChartdiv.id).css({"background-color":"rgba(25, 71, 167, 0.5)","width":"160px","height":"50px"});
				    	window[init](eChartObj,eChartdiv.id);	
				    }else{
				    	window[init](eChartObj,data,'main_class');	
				    }
				    $("#panelPro").css("display","none"); //面板属性
					$("#compPro").css("display","block"); //组件属性					
					$("#choseChartId").val(eChartdiv.id); //设置当前组件ID
					var compHtml = "";
					compHtml += '<div id = "compProperty'+tempIndex+'" style="display:block" >'+
									    '<div class="prop">'+
										 	'<div class="prop-label">接口:</div>'+
										 	'<div class="prop-detail"><select  class="typetext" id="interface'+tempIndex+'" name="interface'+tempIndex+'" style="height:18px;width:100%">'+
												'<option value="-1"></option>'+
											'</select></div>'+		 	
										'</div>'+
										'<div  class="prop">'+
										 	'<div class="prop-label">刷新时间:</div>'+
										 	'<div class="prop-detail"><input  type="text" id="refreshTime'+tempIndex+'" name="refreshTime'+tempIndex+'" value="15" class="typetext"><span>(单位：分钟)</span></div>'+	 	
										'</div>'+
										'<div id="paramInfo'+tempIndex+'">'+
										'</div>'+
										'<div>'+
											'<input type="button" id="compConfirm'+tempIndex+'" name="compConfirm'+tempIndex+'" value="确定" class="typebtn" style="margin-left: 30%;">'+
										'</div>'+
										'<div class="prop">'+
										    '<div class="prop-label">X坐标:</div>'+
											'<div class="prop-detail"><input class="typetext" type="text" id="xValue'+tempIndex+'" ><span>(单位：px)</span></div>'+
										'</div>'+	
										'<div class="prop">'+		
											'<div class="prop-label">Y坐标:</div>'+
											'<div class="prop-detail"><input class="typetext" type="text" id="yValue'+tempIndex+'"><span>(单位：px)</span></div>'+
										'</div>'+
										'<div class="prop">'+
											'<div class="prop-label">宽度:</div>'+
											'<div class="prop-detail"><input class="typetext" type="text" id="pWidth'+tempIndex+'"><span>(单位：px)</span></div>'+
										'</div>'+
										'<div class="prop">'+	
											'<div class="prop-label">高度:</div>'+
											'<div class="prop-detail"><input class="typetext" type="text" id="pHeight'+tempIndex+'"><span>(单位：px)</span></div>'+
										'</div>'+
										'<div class="prop">'+
										 	'<div class="prop-label">透明度:</div>'+
										 	'<div class="prop-detail"><input class="typetext" type="text" id="pOpacity'+tempIndex+'"></div>'+		 	
										'</div>'+
										'<div>'+
										'<input type="button" id="compDelete'+tempIndex+'" name="compDelete'+tempIndex+'" value="删除此组件" class="typebtn" style="margin-left: 30%;">'+
										'</div>'+
								  '</div>';
					if(tempIndex >1){
						for(var j=1;j<tempIndex;j++){
							$("#compProperty"+j).css("display","none")
						}
					}					
					$("#compPro").append(compHtml);					
					
				
					$("#xValue"+tempIndex).val(parseInt($("#"+eChartdiv.id).parent().css("left").substring(0,$("#"+eChartdiv.id).parent().css("left").length-2))  - 256);
					$("#yValue"+tempIndex).val($("#"+eChartdiv.id).parent().css("top").substring(0,$("#"+eChartdiv.id).parent().css("top").length-2));
				    $("#pWidth"+tempIndex).val($("#"+eChartdiv.id).parent().css("width").substring(0,$("#"+eChartdiv.id).parent().css("width").length-2));
				    $("#pHeight"+tempIndex).val($("#"+eChartdiv.id).parent().css("height").substring(0,$("#"+eChartdiv.id).parent().css("height").length-2));
				    var strColor=$("#"+eChartdiv.id).css("backgroundColor");
				    var color = Math.round( (1 - strColor.split(",")[3].split(")")[0])*100)/100;//透明度显示到文本框里
				    $("#pOpacity"+tempIndex).val(color);
				    var compId = $("#"+eChartdiv.id).parent().attr("compId");
				    $.ajax({
		        				url : contextPath + "/manage/chart/getInterfacesByCompId",
		        				type : "post",
		        				async : false,
		        				data : {"compId":compId},
		        				dataType : "json",					
		        				success : function(result)
		        				{
		        					if(result.Error_code == "0"){
		        						  var myOption = '<option value="-1"></option>';;
		        					      for(var k=0;k<result.Data.length;k++){
		        					    	  myOption += '<option value="'+result.Data[k].interfaceId+'">'+result.Data[k].interfaceName+'</option>';
		        					      }
		        					      $("#interface"+tempIndex).html("");
		        					      $("#interface"+tempIndex).html(myOption);
		        					}else{
		        						$.messager.alert($.i18n.prop("messager.info"),"加载接口失败", "info");
		        					}
		        				}
		        	});	
				    
				    var thisIndex = $("#choseChartId").val().substring(7,$("#choseChartId").val().length);
					//接口改变时
					$("#interface"+thisIndex).change(function(){
						var interfaceId = $(this).val();
						//$("#choseChartId").attr("interfaceId",interfaceId);
						if(interfaceId != '-1'){
							$.ajax({
						    	url : contextPath + "/manage/chart/getInterfaceParamInfo",
						        type : "post",
						        dataType : "json",
						        data : {"interfaceId":interfaceId},
						        success : function(result) {
						        	var paramHtml = "";
						        	var interfaceUrl = result.Data.interfaceInfo.interfaceUrl;
						        	var interfaceName = result.Data.interfaceInfo.interfaceName;
						        	var interfaceNo = result.Data.interfaceInfo.interfaceNo;
						        	var licenceCode = result.Data.licenceCode;
						        	paramHtml += '<input type="hidden" id="choseInterfaceUrl'+thisIndex+'" value="'+interfaceUrl+'">';
						        	paramHtml += '<input type="hidden" id="choseInterfaceName'+thisIndex+'" value="'+interfaceName+'">';
						        	paramHtml += '<input type="hidden" id="choseInterfaceNo'+thisIndex+'" value="'+interfaceNo+'">';
						        	paramHtml += '<input type="hidden" id="licenceCode'+thisIndex+'" value="'+licenceCode+'">';
						        	for(var k=0;k<result.Data.params.length;k++){
						        		if(result.Data.params[k].paramDefault == null){
						        			result.Data.params[k].paramDefault = "";
										}
						        		paramHtml += '<div class="prop">'+
						        					 '<div class="prop-label">'+result.Data.params[k].paramName+':</div>';
												 	 if(result.Data.params[k].paramType == 0){ //输入框
												 		 paramHtml += '<input  type="text" id="'+result.Data.params[k].paramId+'" name="'+result.Data.params[k].paramMark+'" value="'+result.Data.params[k].paramDefault+'" class="compSty prop-detail typetext">';
												 	 }else if(result.Data.params[k].paramType == 1){ //下拉框
												 		 paramHtml += '<select id="'+result.Data.params[k].paramId+'" name="'+result.Data.params[k].paramMark+'" class="compSty prop-detail typetext">'+
												 		              '<option value="-1">'+result.Data.params[k].paramDefault+'</option>';
													 	 for(var i=0;i<result.Data.params[k].Items.length;i++){
													 		paramHtml += '<option  value="'+result.Data.params[k].Items[i].paramItemValue+'">'+result.Data.params[k].Items[i].paramItemName+'</option>';
													 	 }
													 	 paramHtml +='</select>';
												 	 }else if(result.Data.params[k].paramType == 2){ //时间框
												 		 paramHtml += '<input id="'+result.Data.params[k].paramId+'" name="'+result.Data.params[k].paramMark+'" value="'+result.Data.params[k].paramDefault+'" type="text" class="compSty Wdate prop-detail typetext"  onfocus="WdatePicker({skin:\'whyGreen\',dateFmt:\'yyyy\',maxDate:\'%y\',minDate:\'2011\'})">';
												 	 }
												 	 paramHtml +='</div>'; 
						        	}
						        	$("#paramInfo"+thisIndex).html("");
						        	$("#paramInfo"+thisIndex).html(paramHtml);		        	
						        }
						    });
						}				
					});
				    
					//组件确认按钮事件
					$("#compConfirm"+thisIndex).click(function(){
						var refreshTime = $("#refreshTime"+thisIndex).val();
						var interfaceId = $("#interface"+thisIndex).val();
						var choseInterfaceUrl = $("#choseInterfaceUrl"+thisIndex).val();
						var choseInterfaceName = $("#choseInterfaceName"+thisIndex).val();
						var choseInterfaceNo = $("#choseInterfaceNo"+thisIndex).val();
						var licenceCode = $("#licenceCode"+thisIndex).val();
						var confirmChoseChartId = $("#choseChartId").val();
						var confirmCompType = $("#"+confirmChoseChartId).parent().attr("type");
						if(interfaceId == null || interfaceId == "-1"){
							$.messager.alert($.i18n.prop("messager.info"),"请选择接口!", "info");
							return false;
						}
						var reg = /^[-+]?\d+$/;
						if (!reg.test(refreshTime) || refreshTime < 0) {
							$.messager.alert($.i18n.prop("messager.info"),"请输入大于零的数字!", "info");
							$("#refreshTime").val("15");
					        return false;
					    }	
						var paramObj = {};
						var tempFlag = false;
						$($("#paramInfo"+thisIndex).html()).find(".compSty").each(function(){
							 if($("#"+$(this).attr('id')).val() == "" || $("#"+$(this).attr('id')).val() == null || $("#"+$(this).attr('id')).val() == "-1" ){
								 $.messager.alert($.i18n.prop("messager.info"),"请选择接口参数!", "info");
								 tempFlag = true;
								 return false;
							 }else{
								 paramKey = $(this).attr("name");
			        			 paramObj[paramKey] = $("#"+$(this).attr('id')).val();
							 }
		        		});
						var startDate = $("#paramInfo"+thisIndex).find("[name='startDate']").val();
						var endDate = $("#paramInfo"+thisIndex).find("[name='endDate']").val();
						if(endDate<startDate){
							$.messager.alert($.i18n.prop("messager.info"),"开始日期不能大于结束日期!", "info");
							 tempFlag = true;
							 return false;
						};
						$("#paramInfo"+thisIndex).find("input")
						if(!tempFlag){
							getInterfaceData(confirmCompType,choseInterfaceUrl,choseInterfaceName,paramObj,choseInterfaceNo,licenceCode);
						}
					});
					$("#compDelete"+thisIndex).click(function(){
						$.messager.confirm($.i18n.prop("messager.info"), "是否确认删除该组件?", function(r){
							if (r==true)
						    {
							 $("#eCharts"+thisIndex).parent().remove();
						    }
						})
					});
					
					var prevX;
					$("#xValue"+thisIndex).on('focus', function () {
						prevX = this.value;
				    }).change(function(){
						var reg = /^\d{1,4}$/;
						if(!reg.test($(this).val())){
							$.messager.alert($.i18n.prop("messager.info"),"请输入一到四位的数字!", "info");
							$(this).val(prevX);
							return;
						}else{
							//var theLeft = (parseInt($(this).val()) + 256) +"px";
							var theLeft = (parseInt($(this).val()) + 0) +"px";
							$("#"+$("#choseChartId").val()).parent().css({left: theLeft});
						}
					});
					
					var prevY;
					$("#yValue"+thisIndex).on('focus', function () {
						prevY = this.value;
				    }).change(function(){
						var reg = /^\d{1,4}$/;
						if(!reg.test($(this).val())){
							$.messager.alert($.i18n.prop("messager.info"),"请输入一到四位的数字!", "info");
							$(this).val(prevY);
							return;
						}else{
							var theTop = $(this).val() +"px";
							$("#"+$("#choseChartId").val()).parent().css({top: theTop});
						}
						
					});
					
					var prevWidth;
					$("#pWidth"+thisIndex).on('focus', function () {
						prevWidth = this.value;
				    }).change(function(){
						var reg = /^\d{1,4}$/;
						if(!reg.test($(this).val())){
							$.messager.alert($.i18n.prop("messager.info"),"请输入一到四位的数字!", "info");
							$(this).val(prevWidth);
							return;
						}else{
							var myChartId = $("#choseChartId").val();
							var choseEChartObj = document.getElementById(myChartId);
							choseEChartObj.style.width = ($(this).val() - 22) +"px";
							$("#"+myChartId).parent().css("width",($(this).val()+"px"));
							var choseChart = echarts.getInstanceByDom(document.getElementById(myChartId));
							choseChart.resize();
						}
					});
					
					var prevHeight;
				    $("#pHeight"+thisIndex).on('focus', function () {
				    	prevHeight = this.value;
				    }).change(function(){
						var reg = /^\d{1,4}$/;
						if(!reg.test($(this).val())){
							$.messager.alert($.i18n.prop("messager.info"),"请输入一到四位的数字!", "info");
							$(this).val(prevHeight);
							return;
						}else{
							var hChartId = $("#choseChartId").val();
							var choseEChartObj = document.getElementById(hChartId);
							choseEChartObj.style.height = ($(this).val() - 22) +"px";
							$("#"+hChartId).parent().css("height",($(this).val()+"px"));
							var choseChart = echarts.getInstanceByDom(document.getElementById(hChartId));
							choseChart.resize();
						}		
					});
				    
					var prevOpacity;
				    $("#pOpacity"+thisIndex).on('focus',function(){
				    	prevOpacity = this.value;
				    }).change(function() {        
				        var myPacity = $(this).val();
						var msg = 0;
						var regx = /^[0-1]$|^0\.[0-9]+$/; 
						var flag = regx.test(myPacity);
						if(flag){
							if(myPacity.split('.').length > 1 && myPacity.split('.')[1].length > 1){
								msg = 1;
							}
						}else{
							msg = 1;
						}
						if(msg == 1){
							$.messager.alert($.i18n.prop("messager.info"),"请输入0到1之间小数点后只有一位数字的小数!", "info");
							$(this).val(prevOpacity);
							return;
						}else{
							var  Pacity = 1-myPacity;
							$("#"+$("#choseChartId").val()+":first-child").css("background-color","rgba(25,71,167,"+Pacity+")");
							
							
						}
				    });
				    
					tempIndex ++;
			    }			  						
			},
		  deactivate:function(event, ui) { //当任何可拖拽元素停止拖拽动作时激活此事件
				$(".com_style").draggable({
					helper: 'original',
					create : function(event, ui){
						changeScale($(this))
					},
					start : function(event, ui){//当鼠标开始拖拽时，触发此事件。
						changeScale($(this))
						$("#panelPro").css("display","none"); //面板属性
						$(this).parent().children("div").css("border","none");
						$(this).parent().children("div").css("z-index",1);
						$(this).css("border","3px solid yellow");
						$(this).css("z-index",90);
						$("#compPro").css("display","block"); //组件属性
					},
					drag: function(event, ui){//当创建draggable时触发
						var obj = event.srcElement || event.target;
					//	$(obj.innerHTML).parent().css({position: "absolute", top: ui.offset.top + "px",left:  ui.offset.left + "px"});
						//根据缩放比例，调整拖拽的幅度，跟随鼠标
						var top = ui.position.top;
						var left = ui.position.left;
						switch($("#resolution").val().split("*")[1]){
				    	 case '1080':
				    		 ui.position.top=top/0.63;
							 ui.position.left=left/0.63;
				    		 break;
				    	 case '960':
				    		 ui.position.top=top/0.8875;
							 ui.position.left=left/0.8875;
				    		 break;
				    	 case '720':
				    		 ui.position.top=top/0.946;
							 ui.position.left=left/0.946;
				    		 break;
				    	 }
						if(tempIndex >1){
							for(var m=1;m<tempIndex;m++){
								$("#compProperty"+m).css("display","none")
							}
						}
						$("#choseChartId").val($(obj.innerHTML).attr("id"));
						var dragIndex = $("#choseChartId").val().substring(7,$("#choseChartId").val().length);
						$("#compProperty"+dragIndex).css("display","block");
				        $("#yValue"+dragIndex).val(Math.round(this.offsetTop));
						$("#xValue"+dragIndex).val(Math.round(this.offsetLeft));
											
				    }
				})	
				$(".com_style").resizable({
					start : function(event, ui){
						$("#panelPro").css("display","none"); //面板属性
						$("#compPro").css("display","block"); //组件属性
						var obj = event.srcElement || event.target;
						var idV = $(obj.innerHTML).attr("id");
						/*var chartType = $("#"+idV).parent().attr("type");
						if(chartType == "map"){
							return;
						}*/
						
					},
					stop : function(event, ui) {//当元素调整动作结束时触发。
						changeScale($(this));
						var obj = event.srcElement || event.target;
						var idV = $(obj.innerHTML).attr("id");
						var chartType = $("#"+idV).parent().attr("type");
						if(tempIndex >1){
							for(var m=1;m<tempIndex;m++){
								$("#compProperty"+m).css("display","none")
							}
						}
						var compareEChartObj = document.getElementById(idV);
						compareEChartObj.style.width = (ui.size.width - 22) +"px";
					    compareEChartObj.style.height = (ui.size.height - 22) +"px";
					    if(chartType!='population'&&chartType!='time'&&chartType!='date'&&chartType!='flow'){
					    var compareMyChart = echarts.init(document.getElementById(idV));
					    compareMyChart.resize();
						$("#choseChartId").val(idV);
						var resizeIndex = $("#choseChartId").val().substring(7,$("#choseChartId").val().length);
						$("#compProperty"+resizeIndex).css("display","block");
						$("#pWidth"+resizeIndex).val(ui.size.width - 22);
						$("#pHeight"+resizeIndex).val(ui.size.height - 22);
					    }
				    }
				});
				$(".com_style").click(function(event, ui){
					checkChartId = $($(this).html()).attr("id");
					if(tempIndex >1){
						for(var m=1;m<tempIndex;m++){
							$("#compProperty"+m).css("display","none");
							$("#eCharts"+m).parent().css("border","none")
							$("#eCharts"+m).parent().css("z-index",1);
						}
					}
					var curIndex = checkChartId.substring(7,checkChartId.length);
					$("#compProperty"+curIndex).css("display","block");
					$("#eCharts"+curIndex).parent().css("border","3px solid yellow");
					$("#eCharts"+curIndex).parent().css("z-index",90);
			        $("#yValue"+curIndex).val(Math.round(this.offsetTop));
					$("#xValue"+curIndex).val(Math.round(this.offsetLeft));
				});
			}
		});	
	
	var checkChart = null;
	$("#container").click(function(e){
		if(checkChartId != null){ //点击组件
			$("#panelPro").css("display","none"); //隐藏面板属性
			$("#compPro").css("display","block"); //显示组件属性		
			$("#choseChartId").val(checkChartId);
			checkChart = echarts.getInstanceByDom(document.getElementById(checkChartId));
			checkCompIndex = checkChartId.substring(7,checkChartId.length)
//			$("#xValue"+checkCompIndex).val(parseInt($("#"+checkChartId).parent().css("left").substring(0,$("#"+checkChartId).parent().css("left").length-2)) - 0);
//			$("#yValue"+checkCompIndex).val($("#"+checkChartId).parent().css("top").substring(0,$("#"+checkChartId).parent().css("top").length-2));
		    $("#pWidth"+checkCompIndex).val($("#"+checkChartId).parent().css("width").substring(0,$("#"+checkChartId).parent().css("width").length-2));
		    $("#pHeight"+checkCompIndex).val($("#"+checkChartId).parent().css("height").substring(0,$("#"+checkChartId).parent().css("height").length-2));
		    var strColor=$("#"+checkChartId).css("backgroundColor");
		    var color = Math.round( (1 - strColor.split(",")[3].split(")")[0])*100)/100;//透明度显示到文本框里
		    $("#pOpacity"+checkCompIndex).val(color);
		}else{
			for(var m=1;m<tempIndex;m++){
				$("#eCharts"+m).parent().css("border","none")
			}
			$("#panelPro").css("display","block");
			$("#compPro").css("display","none"); 
		}
		checkChartId = null;
	});
	
	$("input[name='preview']").click(function(){
		   var  iHeight= window.screen.availHeight;
		   var iWidth = window.screen.availWidth;
		   var url = contextPath + "/static/js/manage/design/preTool.html";	 
		   window.open(url,"_blank","width=" + iWidth + ", height=" + iHeight + ",toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no,alwaysRaised=yes,depended=yes");
	});
	
	$("input[name='save']").click(function(){
		var title = $("#title").val();
		var resolution = $("#resolution").val();
		if(title == null || title == ""){
			$.messager.alert($.i18n.prop("messager.info"), "请填写图表标题", "info");
			$("#panelPro").css("display","block");
			$("#compPro").css("display","none"); 
			return;
		}
		if(resolution == null || resolution == ""){
			$.messager.alert($.i18n.prop("messager.info"), "请填写图表分辨率", "info");
			return;
		}
		var chartHtml = $("#container").html();
		if(chartHtml == "" || chartHtml == null){
			$.messager.alert($.i18n.prop("messager.info"), "请编辑制作图表", "info");
			return;
		}
		var chartId;
		var compType;
		var top;
		var left;
		var width;
		var height;
		var myChart;
		var myOption;
		var myData;
		var temp = "";
		$.messager.confirm($.i18n.prop("messager.info"), "是否保存此图表？", function(r)
	    {
	        if(r)
	        {	
	        	var imgUrl;
	        	html2canvas(document.querySelector("#container")).then(canvas => {
					imgUrl = canvas.toDataURL("image/png").replace("image/png", "image/octet-stream"); 
				})
				setTimeout(function(){
					var tempArray = new Array();
		        	$(chartHtml).find(".main_class").each(function(){
		        		var compArr = new Array();
		        		chartId = $(this).attr("id");
		        		idx = chartId.substring(7,chartId.length);
		        		compType = $(this).parent().attr("type");
		        		if(compType != "population"&&compType != "date"&&compType != "time"&&compType != "flow"){
			        		myChart = echarts.getInstanceByDom(document.getElementById(chartId));
			        		myOption = myChart.getOption();
			        		myData = myOption.series[0].data;
		        		}
		        		compNo = $(this).parent().attr("compNo");
		        		top = $(this).parent().css("top");
		        		left = $(this).parent().css("left");
		        		width = $(this).css("width");
		        		height = $(this).css("height");
		        		opacity = $(this).css("backgroundColor");
		        		interfaceId = $("#interface"+idx).val();
		        		interfaceUrl = $("#choseInterfaceUrl"+idx).val();
		        		interfaceName = $("#choseInterfaceName"+idx).val();
		        		myInterfaceNo = $("#choseInterfaceNo"+idx).val();
		        		myRefreshTime = $("#refreshTime"+idx).val();
		        		$($("#paramInfo"+idx).html()).find(".compSty").each(function(){
		        			 compArr.push({"compId":chartId,"paramId":$(this).attr("id"),"paramName":$(this).attr("name"),"paramValue":$("#"+$(this).attr("id")).val()});
		        		});
		        		tempArray.push({"chartId":chartId,"chartType":compType,"compNo":compNo,"interfaceId":interfaceId,"interfaceUrl":interfaceUrl,"interfaceName":interfaceName,"interfaceNo":myInterfaceNo,"top":top,"left":left,"width":width,"height":height,"opacity":opacity,"refreshTime":myRefreshTime,"dataList":$.toJSON(myData),"compParamInfo":$.toJSON(compArr)});
		        		
		        	})
		        	var fileObj = document.getElementById("uploadBkPic").files[0]; //js获取文件对象
	                var formData = new FormData();
	            	formData.append("file", fileObj);
	            	formData.append("chartName", title);
	            	formData.append("resolution", resolution);
	            	formData.append("backColor", bkColor);
	            	formData.append("chartInfo", $.toJSON(tempArray));
	            	formData.append("imgUrl", imgUrl.split(",")[1]);
		        	$.ajax({
		        				url : contextPath + "/manage/chart/saveChart",
		        				type : "post",
		        				contentType : false,
		        				processData : false,
		        				data : formData,
		        				dataType : "json",					
		        				success : function(result)
		        				{
		        					if(result.Error_code == "0"){
		        						$.messager.alert($.i18n.prop("messager.info"),"图表保存成功", "info");
		        					}else{
		        						$.messager.alert($.i18n.prop("messager.info"),"图表保存失败", "info");
		        					}
		        				}
		        		});	        	
				},1000)
			}else{	  
				
			}
	    });	
	});	
	
	 //图片文件路径处理
    function getObjectURL(file){
   		var url = null;
   		if(window.createObjectURL != undefined){
   			url = window.createObjectURL(file);//basic
   		}else if(window.URL != undefined){
   			url = window.URL.createObjectURL(file);
   		}else if(window.webkitURL != undefined){
   			url = window.webkitURL.createObjectURL(file);
   		}
   		return url;
   	}
    
    function getInterfaceData(type,interfaceUrl,choseInterfaceName,paramObj,choseInterfaceNo,licenceCode){
    	var param = {
    			"licenceCode":licenceCode,
    			"interfaceNo":choseInterfaceNo,
    			"interfaceUrl":interfaceUrl,
    		};
    	paramObj.param = $.toJSON(param);
    	$.ajax({
	    	url : interfaceUrl,
		    //url : contextPath + "/services/chart/getInterfaceData",
	        type : "get",
	        dataType : "jsonp",
	        data : paramObj,
	        jsonp: "callbackparam",
	        jsonpCallback: "success_jsonpCallback",
	        success : function(result) {	
	        	if(result.error_code==1){
	        		return false;
	        	}
	        	if(type != "population"){
	        		var theChart = echarts.getInstanceByDom(document.getElementById($("#choseChartId").val())); 
	        		var theOption = theChart.getOption();
	        		var seriesArr = new Array();
	        		var xAxisArr = new Array();
	        		var legendArr = new Array();
	        		if(type == "pie"){
	        			theOption.series[0].data = "";
	        			theOption.legend[0].data = "";
	        			for(var k=0;k<result.data.length;k++){
	        				seriesArr.push(result.data[k]);
			        	}
	        			theOption.series[0].data = seriesArr;
	        			for(var m=0;m<result.legend.length;m++){
	        				legendArr.push(result.legend[m]);
	        			}
	        			theOption.legend[0].data = legendArr;
	        		}else if(type == "map"){
	        			theOption.series[0].data = "";
	        			theOption.series[0].data = result.data;
	        			var arr=new Array();
	        			var legArr = new Array();
	        			for(var k=0;k<result.data.length;k++){
	        				if(result.data[k].selected == true){
	        					var {name,value}=result.data[k];
	        					legArr.push({name,value});
	        				}
	        				arr.push(result.data[k].value)
	        			}
	        			theOption.visualMap[0].max =Math.max.apply(null,arr);
                        theOption.series[1].data = "";
                        theOption.series[1].data = legArr;
	        			theChart.on('mapselectchanged', function (params){
	        				var data = [];
	        				var name;
	        				var selected = params.batch[0].selected;
	        				var mapSeries = theOption.series[0];
	        				var selName=params.batch[0].name;
	        				for(var i=0;i<mapSeries.data.length;i++){
	        					if(mapSeries.data[i].name==selName){
	        						if(mapSeries.data[i].selected!=true){
	        							mapSeries.data[i].selected=true;
	        						}else{
	        							mapSeries.data[i].selected=false;
	        						}
	        					}
	        				}
	        				for (var p = 0, len = mapSeries.data.length; p < len; p++) {
	        					name = mapSeries.data[p].name;
	        					if(selected[name]) {					
	        						data.push({
	        							name: name,
	        							value: mapSeries.data[p].value
	        						});
	        					}			
	        				}
	        				theOption.series[1].data = data;
	        				theChart.setOption(theOption,true);
	        			}) 
	        		}else{
	        			theOption.xAxis = "";
	        			theOption.series = "";
	        			for(var i=0;i<result.data.xAxis.length;i++){
	        				xAxisArr.push(result.data.xAxis[i]);
			        	};
			        	theOption.yAxis[0].name = '('+'单位'+': '+result.data.yAxis.name+')';
	        			theOption.xAxis = xAxisArr
	        			for(var j=0;j<result.data.series.length;j++){
	        				seriesArr.push(result.data.series[j]);
			        	}
	        			theOption.series = seriesArr;
	        		};
	        	if(type == "line"){
	        		theChart.clear();
	        		myOption = {
	        				title: {
	        					text: '折线图组件',
	        					left: 'left',
	        					textStyle:{
	        						color:'#fff',					
	        					}
	        				},
	        				tooltip: {
	        					trigger: 'axis'
	        				},
	        				legend: {
	        					top : 30,
	        					data:[],
	        					textStyle:{color:'#4CABCE',}
	        				},
	        				grid: {
	        					left: '3%',
	        					right: '10%',
	        					bottom: '3%',
	        					containLabel: true
	        				},
	        				xAxis: {
	        					// nameGap :5,
	        					type: 'category',
	        					boundaryGap: false,
	        					data: ['周一','周二','周三','周四','周五','周六','周日'],
	        					axisLine:{  
	        						lineStyle:{  
	        							color:'#092F66',  
	        							
	        						}  
	        					}  ,
	        					axisLabel: {
	        						show: true,
	        						textStyle: {
	        							color: '#fff',
	        						},
	        						interval:0,
	        						rotate:30,
	        						fontWeight:'bold',
	        					},
	        					nameTextStyle:{
	        						color:'#fff',
	        					}
	        					
	        				},
	        				yAxis: [
	        					{
	        						type: 'value',
	        						axisLine:{  
	        							show:true,
	        						}  ,
	        						axisLabel: {
	        							show: true,
	        							textStyle: {
	        								color: '#fff'
	        							},
	        							fontWeight:'bold',
	        						},
	        						splitLine: {
	        							
	        							lineStyle: {
	        								color: ['#092F66']
	        							}     
	        						},
	        						nameTextStyle:{
	        							color:'#fff',
	        						} 
	        					},
	        				],
	        				series: [
	        					{
	        						name:'',
	        						type:'line',
	        						stack: '总量1',
	        						data:[120, 132, 101, 134, 90, 230, 210],	
	        						color:'rgba(255,255,255,0.5)',
	        						areaStyle: {
	        							normal: {
	        								color: {
	        									type: 'linear',
	        									x: 0,
	        									y: 0,
	        									x2: 0,
	        									y2: 1,
	        									colorStops: [{
	        										offset: 0, color: 'rgba(255,255,255,0.5)' // 0% 处的颜色
	        									}, {
	        										offset: 1, color: 'rgba(255,255,255,0)' // 100% 处的颜色
	        									}],
	        									globalCoord: false // 缺省为 false
	        								}
	        							},
	        							
	        						},		
	        					},
	        					{
	        						name:'',
	        						type:'line',
	        						stack: '总量2',
	        						data:[],
	        						color:'rgba(60,181,204)',
	        						areaStyle: {
	        							normal: {
	        								color: {
	        									type: 'linear',
	        									x: 0,
	        									y: 0,
	        									x2: 0,
	        									y2: 1,
	        									colorStops: [{
	        										offset: 0, color: 'rgba(60,181,204,0.5)' // 0% 处的颜色
	        									}, {
	        										offset: 1, color: 'rgba(60,181,204,0)' // 100% 处的颜色
	        									}],
	        									globalCoord: false // 缺省为 false
	        								}
	        							},
	        							
	        						},	
	        					},
	        					{
	        						name:'',
	        						type:'line',
	        						stack: '总量3',
	        						data:[],
	        						areaStyle: {normal: {}},
	        					},
	        					{
	        						name:'',
	        						type:'line',
	        						stack: '总量4',
	        						data:[],
	        						areaStyle: {normal: {}},
	        					},
	        					{
	        						name:'',
	        						type:'line',
	        						stack: '总量5',
	        						data:[],
	        						areaStyle: {normal: {}},
	        					}
	        				]
	        			};
	        			theOption.yAxis.splice(1,theOption.yAxis.length)
	        			theChart.setOption(myOption);
	        			theOption.yAxis[0].name = '('+'单位'+': '+result.data.yAxis.name+')';
	        			if(choseInterfaceName=='时点交易'){
	        				var yAxis = {};
	        				for(var i in theOption.yAxis[0]){
	        					yAxis[i] = theOption.yAxis[0][i];
	        				};
	        				theOption.yAxis.push(yAxis);
	                        theOption.series[1].yAxisIndex=1;
	                        theOption.yAxis[1].name = '(单位：人)';
	        			}
	        		}
		        	theOption.title[0].text = choseInterfaceName;
		        	theChart.setOption(theOption);
		        	
	        	}else{
	        		$("#heightNo"+$("#choseChartId").val()).html("");
	        		$("#heightNo"+$("#choseChartId").val()).html(result.data.high);
	        		$("#lowNo"+$("#choseChartId").val()).html("");
	        		$("#lowNo"+$("#choseChartId").val()).html(result.data.low);
                    var heightPercent=(result.data.high*100/(result.data.high+result.data.low)).toFixed(1);
                    var lowPercent=(result.data.low*100/(result.data.high+result.data.low)).toFixed(1);
	        		$("#heightPercent"+$("#choseChartId").val()).html('('+heightPercent+'%'+')');
	        		$("#lowPercent"+$("#choseChartId").val()).html('('+lowPercent+'%'+')');
	        	} 	      		
	        }
	    });
    }
})
	

