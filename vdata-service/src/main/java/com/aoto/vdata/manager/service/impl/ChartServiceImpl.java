package com.aoto.vdata.manager.service.impl;

import java.awt.image.RenderedImage;
import java.io.BufferedWriter;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintStream;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;

import sun.misc.BASE64Decoder;  
import sun.misc.BASE64Encoder; 

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.aoto.vdata.util.FileUtil;
import com.aoto.vdata.util.JsonUtil;
import com.aoto.vdata.util.TimeUtil;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.aoto.framework.commons.userdetails.CurrentUserHolder;
import com.aoto.vdata.manager.model.ChartInfoModel;
import com.aoto.vdata.manager.model.ChartModel;
import com.aoto.vdata.manager.model.CompParamModel;
import com.aoto.framework.commons.constant.BeanProperty.Bean;
import com.aoto.framework.commons.pagination.PagingCriteria;
import com.aoto.vdata.manager.model.KeywordQuery;
import com.aoto.vdata.manager.persistence.inf.ChartMapper;
import com.aoto.vdata.manager.persistence.inf.InterfaceMapper;
import com.aoto.vdata.manager.persistence.inf.ParamMapper;
import com.aoto.vdata.manager.service.inf.ChartService;

/**
 * @ClassName: ChartServiceImpl
 * @Description: 图表维护
 * @author liuy08
 * @date 2018-05-21 上午10:00:00
 * 
 */

@SuppressWarnings("restriction")
@Service
public class ChartServiceImpl implements ChartService  {

	private final static Logger logger = LoggerFactory.getLogger(ChartServiceImpl.class);
	
	String now = TimeUtil.getThisTime();

	@Value("${localResourcePic}")
	private String localResourcePic;
	
	@Value("${resourcePic}")
	private String resourcePic;
	
	@Value("${licenceCode}")
	private String licenceCode;
	
	@Value("${system}")
	private String system;

	@Autowired
	private ChartMapper chartMapper;
	
	@Autowired
	private ParamMapper paramMapper;
	
	@Autowired
	private InterfaceMapper interfaceMapper;
	
	@Override
	public List<Map<String, Object>> getChartByPage(PagingCriteria pagingCriteria, KeywordQuery model) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(Bean.PAGING, pagingCriteria);
        map.put("keyword", model.getKeyword());
        List<Map<String, Object>> resultMapList = chartMapper.selectChartByPage(map);
        return resultMapList;
	}
	
	@Override
	public List<Map<String, Object>> getChartCompent() {
		 Map<String, Object> paramMap = new HashMap<String, Object>();      
		 paramMap.put("deleted",0);
		 List<Map<String, Object>> resultMapList = chartMapper.getChartCompent(paramMap);
		 for(Map<String, Object>  map : resultMapList){
			 map.put("picPath", resourcePic + String.valueOf(map.get("compPath")) + String.valueOf(map.get("componentType"))+".png");
			 map.put("jSPath", resourcePic + String.valueOf(map.get("compPath")) + "js/"+ String.valueOf(map.get("componentType"))+".js");
		 }
		 return resultMapList;
	}

	@Override
	public Map<String, Object> saveChartInfo(ChartModel model) {
		Map<String, Object> retMap = new HashMap<String,Object>();
		Map<String, Object> paramMap = new HashMap<String,Object>();
		paramMap.put("pk_chartId",0); //主键	
		paramMap.put("chartName",model.getChartName());
		paramMap.put("status", 0);
		paramMap.put("deleted", 0);
		paramMap.put("createdBy", CurrentUserHolder.getCurrentUser().getUserId());
		paramMap.put("createdDate", Timestamp.valueOf(TimeUtil.getThisFormatTime()));
		paramMap.put("remark", model.getRemark());
		paramMap.put("backColor", model.getBackColor());
		paramMap.put("resolution", model.getResolution());
		paramMap.put("lastUpdatedDate", Timestamp.valueOf(TimeUtil.getThisFormatTime()));
		
		String backPicName = "";
		if(model.getFile() == null){
			backPicName = "";
		}else{
			backPicName = model.getFile().getOriginalFilename();
		}
		String chartId = UUID.randomUUID().toString().replace("-", "");
		String myPath = "/chart/"+chartId+"/";
		paramMap.put("path", myPath);
		paramMap.put("backImg", backPicName == "" ? "" : myPath + backPicName);
		paramMap.put("backImgName",backPicName);
		
		chartMapper.insertChartInfo(paramMap);
		
		JsonObject object = new JsonObject(); //创建Json格式的数据
		object.addProperty("programName", model.getChartName());
		object.addProperty("templateName", model.getChartName());

		JsonArray productTypeArr = new JsonArray();
		JsonObject productTypeObj = new JsonObject();
		productTypeObj.addProperty("typeId", "105");
		productTypeArr.add(productTypeObj);
		object.add("productType", productTypeArr);	

		JsonObject resolutionObj = new JsonObject();
		String xPoints = model.getResolution().split("\\*")[0]+"px";
		String yPoints = model.getResolution().split("\\*")[1]+"px";
		resolutionObj.addProperty("xPoints", model.getResolution().split("\\*")[0]);
		resolutionObj.addProperty("yPoints", model.getResolution().split("\\*")[1]);
		object.add("resolution", resolutionObj);
		object.addProperty("thumbPath", "thumb.png");
		
		JsonArray pageConstructionArr = new JsonArray();
		JsonObject pageConstructionObj = new JsonObject();
		pageConstructionObj.addProperty("pageName", "首页");
		pageConstructionObj.addProperty("pageId", "0");
		
		JsonArray childrenArr = new JsonArray();
		pageConstructionObj.add("children", childrenArr);
		
		pageConstructionArr.add(pageConstructionObj);
		object.add("pageConstruction", pageConstructionArr);					
		logger.info(object.toString());		
		//用于存储html字符串  
		StringBuilder stringHtml = new StringBuilder(); 
		PrintStream printStream;
		String source= "";
		String dest = "";
		try {
			  String baseDir = null;
			  if("Linux".equals(system)){
				  baseDir = localResourcePic +"/chart/" +chartId;
			  }else{
				  baseDir = localResourcePic +"\\chart\\" +chartId;
			  }
			  File dirFile = new File(baseDir);	  
			  dirFile.mkdirs();
			  String saveDir = "";
			  String compPath = "";
			  if("Linux".equals(system)){
				  compPath = localResourcePic+"/"+"component"+"/";
				  saveDir = localResourcePic +"/chart/" +chartId +"/";
			  }else{
				  compPath = localResourcePic+"\\"+"component"+"\\";
				  saveDir = localResourcePic +"\\chart\\" +chartId +"\\";
			  }
			  saveMultiPartFileImage(model.getFile(),saveDir); //上传背景图片	
			  
			  File file = new File(saveDir+"info.json"); 
				
			  OutputStream out= new FileOutputStream(file);
		      BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(out,"UTF-8"));
		      bw.write(object.toString());//生成info.json文件
			  bw.flush();
			  bw.close();
			  //生成png图片
			  if(model.getImgUrl() != null && !"".equals(model.getImgUrl())){
				  String imgFilePath = saveDir+"thumb.png";  //新生成的图片 
				  generateImage(model.getImgUrl(),imgFilePath);
			  }
			  String chartInfo = model.getChartInfo();
			  
			  List<ChartInfoModel> chartInfoList = JsonUtil.json2list(chartInfo,ChartInfoModel.class);
			  String mainChartType = chartInfoList.get(0).getChartType();
			  String mainCompNo = chartInfoList.get(0).getCompNo();
			  
			  File chartFile = new File(saveDir+"0.html");
			  printStream = new PrintStream(new FileOutputStream(chartFile),true,"UTF-8");
			  
			  stringHtml.append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n");
			  stringHtml.append("<html><head>\n");  
			  stringHtml.append("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");  
			  stringHtml.append("<title>"+model.getChartName()+"</title>\n"); 
			  stringHtml.append("<script type=\"text/javascript\" src=\""+mainCompNo+"/"+ mainChartType+ "/js/jquery.js\" charset=\"utf-8\"></script>\n");
			  stringHtml.append("<script type=\"text/javascript\" src=\""+mainCompNo+"/"+ mainChartType+ "/js/jquery-ui.min.js\" charset=\"utf-8\"></script>\n");
			  boolean eChartsFlag = false;
			  StringBuilder popuHtml = new StringBuilder(); 
			  for(ChartInfoModel chart : chartInfoList){
				  source = compPath + chart.getCompNo();
				  dest = saveDir+chart.getCompNo();				  
				  FileUtil.copy(source, dest);
				  if(!chart.getChartType().equals("population") && eChartsFlag == false){
					  stringHtml.append("<script type=\"text/javascript\" src=\""+chart.getCompNo()+"/"+ chart.getChartType()+ "/js/echarts.js\" charset=\"utf-8\"></script>\n");	
					  eChartsFlag = true;
				  }
				  if(chart.getChartType().equals("population")){
					  popuHtml.append(".Population{width:100%;height:100%;}\n");
					  popuHtml.append(".title{width: 100%;margin: 5px 0 0 3px;height: 10%;}\n");
					  popuHtml.append(".peoples{height: 80%;}\n");
					  popuHtml.append(".peopleText{color:#FFF;font-family: 'fonttext';font-size: 19px;letter-spacing:-1px;}\n");
					  popuHtml.append("@font-face{font-family: 'fontnum';src: url('"+chart.getCompNo()+"/"+ chart.getChartType()+"/font/DS-DIGIB.TTF')}\n");
					  popuHtml.append("@font-face{font-family: 'fonttext';src: url('"+chart.getCompNo()+"/"+ chart.getChartType()+"/font/HYQiHei-105J.ttf')}\n");
					  popuHtml.append(".low-people{background:url('"+chart.getCompNo()+"/"+ chart.getChartType()+"/pic/low.gif') no-repeat center;width: 100%;height:90%;background-size: 80%;}\n");
					  popuHtml.append(".height-people{background:url('"+chart.getCompNo()+"/"+ chart.getChartType()+"/pic/height.gif') no-repeat center; width: 100%;height:90%;background-size: 80%;}\n");
					  popuHtml.append(".num{text-align:center;width:100%;height:10%;}\n");
					  popuHtml.append(".people{float:left;width:50%;height:100%;}\n");
					  popuHtml.append(".people span{font-size:20px;color:#FFF;font-family: 'fontnum';}\n");
				  }else if(chart.getChartType().equals("date") || chart.getChartType().equals("time")){
					  popuHtml.append("@font-face{font-family: 'fontnum';src: url('"+chart.getCompNo()+"/"+ chart.getChartType()+"/font/DS-DIGIB.TTF')}\n");
				  }
				  stringHtml.append("<script type=\"text/javascript\" src=\""+chart.getCompNo()+"/"+ chart.getChartType()+ "/js/"+chart.getChartType()+".js\" charset=\"utf-8\"></script>\n");
			  }
			  stringHtml.append("<style>\n");
			  stringHtml.append("*{font-size:12px; color:#000;}\n"); 
			  stringHtml.append("body{ margin: 0}\n"); 
			  stringHtml.append(".compent{height: 850px;overflow: aoto;}\n"); 
			  stringHtml.append(".main_class{width: 325px;height: 300px;padding: 10px;float: left;background-color: rgba(25,71,167,0);}\n"); 
			  stringHtml.append(".com_style{width: 340px;height: 320px;position:absolute;background-size: 100% 100%;padding:5px;background-image:url('"+mainCompNo+"/"+ mainChartType+"/pic/border80.png');}\n"); 
			  stringHtml.append(popuHtml.toString());
			  stringHtml.append("</style>\n");
			  
			  stringHtml.append("</head>\n"); 
			  stringHtml.append("<body>\n");  
			  stringHtml.append("<div id=\"container\" class=\"compent\" style=\"position:relative;width:"+xPoints+";height:"+yPoints+";background-color:"+model.getBackColor()+";background-image:url("+backPicName+");background-repeat:no-repeat;background-size:"+xPoints+" "+yPoints+"\">\n");
			  
			  stringHtml.append("</div>\n</body>\n"); 
			  
			  stringHtml.append("<script>\n");
			  stringHtml.append("$(function(){\n");
			  stringHtml.append("var comObj;\n");
			  stringHtml.append("function titleCase(str){  \n");
			  stringHtml.append("var array = str.toLowerCase().split(\" \");  \n");
			  stringHtml.append("for (var i = 0; i < array.length; i++){ \n");
			  stringHtml.append("array[i] = array[i][0].toUpperCase() + array[i].substring(1, array[i].length); \n");
			  stringHtml.append("} \n");
			  stringHtml.append("var string = array.join(\" \");  \n");
			  stringHtml.append("return string; \n");
			  stringHtml.append(" } \n");
			  
			  Map<String ,Object> compMap = new HashMap<String, Object>();
			  for(ChartInfoModel chart : chartInfoList){
				     
				    Double newHeight = Double.parseDouble(chart.getHeight().subSequence(0, chart.getHeight().lastIndexOf("px")).toString()) + 20;
				    Double newWidth = Double.parseDouble(chart.getWidth().subSequence(0, chart.getWidth().lastIndexOf("px")).toString()) + 20;
				    Double newLeft = Double.parseDouble(chart.getLeft().subSequence(0, chart.getLeft().lastIndexOf("px")).toString());
				    String ll = String.valueOf(newLeft)+"px";
				    String hh = String.valueOf(newHeight)+"px";
				    String ww = String.valueOf(newWidth)+"px";
				    
				    compMap.put("pk_chartCompId", 0);
				    compMap.put("chartId",paramMap.get("chartId")); //主键	
				    compMap.put("compId",chart.getChartId());
				    compMap.put("interfaceId", chart.getInterfaceId());
				    compMap.put("x", ll);
				    compMap.put("y", chart.getTop());
				    compMap.put("height",hh);
				    compMap.put("width",ww);
				    compMap.put("opacity",chart.getOpacity());
				    compMap.put("refreshTime",chart.getRefreshTime());
				    
				    chartMapper.saveChartComp(compMap);   //保存图表组件信息
				    List<CompParamModel> compParamList = JsonUtil.json2list(chart.getCompParamInfo(),CompParamModel.class);
				    mySaveCompParam(compParamList);  //保存组件参数信息
				    
				    stringHtml.append("comObj = $(\"<div class='com_style'></div>\")\n");
				    stringHtml.append("comObj.css({position: \"absolute\", top: \""+chart.getTop()+"\",left: \""+ll+"\",height:\""+hh+"\",width:\""+ww+"\"});\n");
				    stringHtml.append("$(\"#container\").append(comObj);\n");
				    
				    stringHtml.append("myId = \""+chart.getChartId()+"\";\n");
				    stringHtml.append("eChartdiv = document.createElement('div');\n");
				    stringHtml.append("eChartdiv.style.position = \"absolute\";\n");
				    
				    stringHtml.append("eChartdiv.style.height = \""+chart.getHeight()+"\"\n");
				    stringHtml.append("eChartdiv.style.width = \""+chart.getWidth()+"\"\n");
				    stringHtml.append("eChartdiv.style.backgroundColor = \""+chart.getOpacity()+"\"\n");
				    stringHtml.append("eChartdiv.id = myId;\n");
				    
				    stringHtml.append("comObj.append(eChartdiv);\n");
				    
				    stringHtml.append("var eChartObj = document.getElementById(eChartdiv.id);\n");
				    
				    String chartData = JsonUtil.obj2json(chart.getDataList());
				    
				    stringHtml.append("var eChartType"+chart.getChartId()+" = \""+chart.getChartType()+"\";\n");
				    
				    /*
				    if("pie".equals(chart.getChartType())){
				    	stringHtml.append("pieData = JSON.parse("+chartData+");\n");
				    }else if("bar".equals(chart.getChartType())){
				    	stringHtml.append("barData = JSON.parse("+chartData+");\n");
				    }else if("line".equals(chart.getChartType())){
				    	stringHtml.append("lineData = JSON.parse("+chartData+");\n");
				    }
				    stringHtml.append("if(eChartType"+chart.getChartId()+" == \"pie\"){\n");
				    
				    stringHtml.append("InitPie(eChartObj,pieData,'main_class');}\n");
				    
				    stringHtml.append("else if(eChartType"+chart.getChartId()+" == \"bar\")\n");
				    
				    stringHtml.append("{InitBar(eChartObj,barData,'main_class');}\n");
				    
				    stringHtml.append("else if(eChartType"+chart.getChartId()+" == \"line\")\n");
				    
				    stringHtml.append("{InitLine(eChartObj,lineData,'main_class');}\n");
				    
				    stringHtml.append("else if(eChartType"+chart.getChartId()+" == \"population\")\n");
				    
				    stringHtml.append("{InitPopulation(eChartObj,eChartdiv.id);}\n");
				    
				    stringHtml.append("else if(eChartType"+chart.getChartId()+" == \"map\"){\n");				    
				    
				    stringHtml.append("InitMap(eChartObj,'main_class');}\n");*/
				    
				    stringHtml.append("var init = \"Init\"+titleCase(eChartType"+chart.getChartId()+"); \n");
				    if(chart.getChartType() != null && chart.getChartType().equals("map")){
				    	stringHtml.append("window[init](eChartObj,'main_class');\n");
				    }else if(chart.getChartType().equals("population")){
				    	stringHtml.append("window[init](eChartObj,eChartdiv.id);\n");
				    }else if(chart.getChartType().equals("date") || chart.getChartType().equals("time")){
				    	stringHtml.append("$(\"#\"+eChartdiv.id).parent().css({\"background-image\":\"none\"});\n");
				    	stringHtml.append("window[init](eChartObj,eChartdiv.id);\n");
				    }else{
				    	stringHtml.append("window[init](eChartObj,JSON.parse("+chartData+"),'main_class');\n");
				    }
				    
				    if(chart.getInterfaceUrl() != null && !"".equals(chart.getInterfaceUrl())){
				    	stringHtml.append("paramObj = {};\n");
					    for(CompParamModel paramModel: compParamList){
					    	if(paramModel.getCompId().equals(chart.getChartId())){
					    		stringHtml.append("paramObj[\""+paramModel.getParamName()+"\"] = "+paramModel.getParamValue()+";\n");
					    	}
					    }
					    stringHtml.append("param = {\n");
					    stringHtml.append("\"licenceCode\":\""+licenceCode+"\",\n");
					    stringHtml.append("\"interfaceNo\":\""+chart.getInterfaceNo()+"\",\n");
					    stringHtml.append("\"interfaceUrl\":\""+chart.getInterfaceUrl()+"\"\n");
					    stringHtml.append("};\n");
					    stringHtml.append("paramObj.param = JSON.stringify(param);\n");
					    stringHtml.append("$.ajax({	\n");
					    stringHtml.append("url : \""+chart.getInterfaceUrl()+"\",\n");
					    stringHtml.append("type : \"get\",\n");
					    stringHtml.append("async : false,\n");
					    stringHtml.append("dataType : \"jsonp\",\n");
					    stringHtml.append("jsonp: \"callbackparam\",\n");
					    stringHtml.append("jsonpCallback: \"success_jsonpCallback"+chart.getChartId()+"\",\n");
					    stringHtml.append("data : paramObj,\n");
					    stringHtml.append("success : function(result) {\n");
					    stringHtml.append("if(eChartType"+chart.getChartId()+" != \"population\"){\n");
					    stringHtml.append("var theChart = echarts.getInstanceByDom(document.getElementById(\""+chart.getChartId()+"\"));\n");
					    stringHtml.append("var theOption = theChart.getOption();\n");
					    stringHtml.append("var seriesArr = new Array();\n");
					    stringHtml.append("var xAxisArr = new Array();\n");
					    stringHtml.append("var legendArr = new Array();\n");
					    stringHtml.append("if(eChartType"+chart.getChartId()+" == \"pie\"){\n");
					    stringHtml.append("theOption.series[0].data = \"\";\n");
					    stringHtml.append("theOption.legend[0].data = \"\";\n");
					    stringHtml.append("for(var k=0;k<result.data.length;k++){\n");
					    stringHtml.append("seriesArr.push(result.data[k]);\n");
					    stringHtml.append("}\n");
					    stringHtml.append("theOption.series[0].data = seriesArr;\n");
					    stringHtml.append("for(var m=0;m<result.legend.length;m++){\n");
					    stringHtml.append("legendArr.push(result.legend[m]);\n");
					    stringHtml.append("}\n");
					    stringHtml.append("theOption.legend[0].data = legendArr;\n");
					    stringHtml.append("}else if(eChartType"+chart.getChartId()+" == \"map\"){\n");
					    stringHtml.append("theOption.series[0].data = \"\";\n");
					    stringHtml.append("theOption.series[0].data = result.data;\n");
					    
					    stringHtml.append("var arr=new Array();\n");
					    stringHtml.append("var legArr = new Array()\n");
					    stringHtml.append("for(var k=0;k<result.data.length;k++){\n");
					    stringHtml.append("if(result.data[k].selected == true){\n");
					    stringHtml.append("var {name,value}=result.data[k];\n");
					    stringHtml.append("legArr.push({name,value});\n");
					    stringHtml.append("}\n");
					    stringHtml.append("arr.push(result.data[k].value)}\n");
					    stringHtml.append("theOption.visualMap[0].max = Math.max(...arr);\n");
					    stringHtml.append("theOption.series[1].data = \"\";\n");
					    stringHtml.append("theOption.series[1].data = legArr;\n");
					    
					    stringHtml.append("theChart.on('mapselectchanged', function (params){\n");
					    stringHtml.append("var data = [];\n");
					    stringHtml.append("var name;\n");
					    stringHtml.append("var selected = params.batch[0].selected;\n");
					    stringHtml.append("var mapSeries = theOption.series[0];\n");
					    stringHtml.append("var selName=params.batch[0].name;\n");
					    stringHtml.append("for(var i=0;i<mapSeries.data.length;i++){\n");
					    stringHtml.append("if(mapSeries.data[i].name==selName){\n");
					    stringHtml.append("if(mapSeries.data[i].selected!=true){\n");
					    stringHtml.append("mapSeries.data[i].selected=true;\n");
					    stringHtml.append("}else{\n");
					    stringHtml.append("mapSeries.data[i].selected=false;\n");
					    stringHtml.append("}\n}\n}\n");
					    stringHtml.append("for (var p = 0, len = mapSeries.data.length; p < len; p++) {\n");
					    stringHtml.append("name = mapSeries.data[p].name;\n");
					    stringHtml.append("if(selected[name]) {\n");
					    stringHtml.append("data.push({\n");
					    stringHtml.append("name: name,\n");
					    stringHtml.append("value: mapSeries.data[p].value\n");
					    stringHtml.append("});\n}\n}\n");
					    stringHtml.append("theOption.series[1].data = data;\n");
					    stringHtml.append("theChart.setOption(theOption,true);\n");
					    stringHtml.append("})\n");
					    stringHtml.append("}else{\n");
					    stringHtml.append("theOption.xAxis = \"\";\n");
					    stringHtml.append("theOption.series = \"\";\n");
					    stringHtml.append("for(var i=0;i<result.data.xAxis.length;i++){\n");
					    stringHtml.append("xAxisArr.push(result.data.xAxis[i]);\n");
					    stringHtml.append("}\n");
					    stringHtml.append("theOption.yAxis[0].name = \"(\"+\"单位\"+\": \"+result.data.yAxis.name+\")\";\n");
					    stringHtml.append("theOption.xAxis = xAxisArr;\n");
					    stringHtml.append("for(var j=0;j<result.data.series.length;j++){\n");
					    stringHtml.append("seriesArr.push(result.data.series[j]);\n");
					    stringHtml.append("}\n");
					    stringHtml.append("theOption.series = seriesArr;\n");
					    
					    if(chart.getInterfaceName() != null && chart.getInterfaceName().equals("时点交易")){
						    stringHtml.append("var yAxis = {}; \n");
						    stringHtml.append("for(var i in theOption.yAxis[0]){\n");
						    stringHtml.append("yAxis[i] = theOption.yAxis[0][i];\n");
						    stringHtml.append("};\n");
						    stringHtml.append("theOption.yAxis.push(yAxis);\n");
						    stringHtml.append("theOption.series[1].yAxisIndex=1; \n");
						    stringHtml.append("theOption.yAxis[1].name = '(单位：人)'; \n");
					    }
					    stringHtml.append("}\n");
					    stringHtml.append("theOption.title[0].text = \""+chart.getInterfaceName()+"\";\n");
					    stringHtml.append("theChart.setOption(theOption);\n");
					    
					    stringHtml.append("}else{\n");
					    stringHtml.append("$(\"#heightNo\"+\""+chart.getChartId()+"\").html(\"\");\n");
					    stringHtml.append("$(\"#heightNo\"+\""+chart.getChartId()+"\").html(result.data.high);\n");
					    stringHtml.append("$(\"#lowNo\"+\""+chart.getChartId()+"\").html(\"\");\n");
					    stringHtml.append("$(\"#lowNo\"+\""+chart.getChartId()+"\").html(result.data.low);\n");
					    stringHtml.append("var heightPercent=(result.data.high*100/(result.data.high+result.data.low)).toFixed(1);\n");
					    stringHtml.append("var lowPercent=(result.data.low*100/(result.data.high+result.data.low)).toFixed(1);\n");
					    stringHtml.append("$(\"#heightPercent\"+\""+chart.getChartId()+"\").html('('+heightPercent+'%'+')');\n");
					    stringHtml.append("$(\"#lowPercent\"+\""+chart.getChartId()+"\").html('('+lowPercent+'%'+')');\n");
					    stringHtml.append("}\n");
					    stringHtml.append("}\n");
					    stringHtml.append("});\n");
					    
					    stringHtml.append("setInterval(function(){	\n");
					    stringHtml.append("$.ajax({	\n");	
					    stringHtml.append("url : \""+chart.getInterfaceUrl()+"\",\n");
					    stringHtml.append("type : \"get\",\n");
					    stringHtml.append("dataType : \"jsonp\",\n");
					    stringHtml.append("jsonp: \"callbackparam\",\n");
					    stringHtml.append("jsonpCallback: \"success_jsonpCallback"+chart.getChartId()+"1\",\n");
					    stringHtml.append("data : paramObj,\n");
					    stringHtml.append("success : function(result) {\n");
					    stringHtml.append("if(eChartType"+chart.getChartId()+" != \"population\"){\n");
					    stringHtml.append("var theChart = echarts.getInstanceByDom(document.getElementById(\""+chart.getChartId()+"\"));\n");
					    stringHtml.append("var theOption = theChart.getOption();\n");
					    stringHtml.append("var seriesArr = new Array();\n");
					    stringHtml.append("var xAxisArr = new Array();\n");
					    stringHtml.append("var legendArr = new Array();\n");
					    stringHtml.append("if(eChartType"+chart.getChartId()+" == \"pie\"){\n");
					    stringHtml.append("theOption.series[0].data = \"\";\n");
					    stringHtml.append("theOption.legend[0].data = \"\";\n");
					    stringHtml.append("for(var k=0;k<result.data.length;k++){\n");
					    stringHtml.append("seriesArr.push(result.data[k]);\n");
					    stringHtml.append("}\n");
					    stringHtml.append("theOption.series[0].data = seriesArr;\n");
					    stringHtml.append("for(var m=0;m<result.legend.length;m++){\n");
					    stringHtml.append("legendArr.push(result.legend[m]);\n");
					    stringHtml.append("}\n");
					    stringHtml.append("theOption.legend[0].data = legendArr;\n");
					    stringHtml.append("}else if(eChartType"+chart.getChartId()+" == \"map\"){\n");
					    stringHtml.append("theOption.series[0].data = \"\";\n");
					    stringHtml.append("theOption.series[0].data = result.data;\n");
					    stringHtml.append("var arr=new Array();\n");
					    stringHtml.append("var legArr = new Array()\n");
					    stringHtml.append("for(var k=0;k<result.data.length;k++){\n");
					    stringHtml.append("if(result.data[k].selected == true){\n");
					    stringHtml.append("var {name,value}=result.data[k];\n");
					    stringHtml.append("legArr.push({name,value});\n");
					    stringHtml.append("}\n");
					    stringHtml.append("arr.push(result.data[k].value)}\n");
					    stringHtml.append("theOption.visualMap[0].max = Math.max(...arr);\n");
					    stringHtml.append("theOption.series[1].data = \"\";\n");
					    stringHtml.append("theOption.series[1].data = legArr;\n");
					    stringHtml.append("theChart.on('mapselectchanged', function (params){\n");
					    stringHtml.append("var data = [];\n");
					    stringHtml.append("var name;\n");
					    stringHtml.append("var selected = params.batch[0].selected;\n");
					    stringHtml.append("var mapSeries = theOption.series[0];\n");
					    stringHtml.append("var selName=params.batch[0].name;\n");
					    stringHtml.append("for(var i=0;i<mapSeries.data.length;i++){\n");
					    stringHtml.append("if(mapSeries.data[i].name==selName){\n");
					    stringHtml.append("if(mapSeries.data[i].selected!=true){\n");
					    stringHtml.append("mapSeries.data[i].selected=true;\n");
					    stringHtml.append("}else{\n");
					    stringHtml.append("mapSeries.data[i].selected=false;\n");
					    stringHtml.append("}\n}\n}\n");
					    stringHtml.append("for (var p = 0, len = mapSeries.data.length; p < len; p++) {\n");
					    stringHtml.append("name = mapSeries.data[p].name;\n");
					    stringHtml.append("if(selected[name]) {\n");
					    stringHtml.append("data.push({\n");
					    stringHtml.append("name: name,\n");
					    stringHtml.append("value: mapSeries.data[p].value\n");
					    stringHtml.append("});\n}\n}\n");
					    stringHtml.append("theOption.series[1].data = data;\n");
					    stringHtml.append("theChart.setOption(theOption,true);\n");
					    stringHtml.append("})\n");
					    
					    stringHtml.append("}else{\n");
					    stringHtml.append("theOption.xAxis = \"\";\n");
					    stringHtml.append("theOption.series = \"\";\n");
					    stringHtml.append("for(var i=0;i<result.data.xAxis.length;i++){\n");
					    stringHtml.append("xAxisArr.push(result.data.xAxis[i]);\n");
					    stringHtml.append("}\n");
					    stringHtml.append("theOption.yAxis[0].name = \"(\"+\"单位\"+\": \"+result.data.yAxis.name+\")\";\n");
					    
					    stringHtml.append("theOption.xAxis = xAxisArr;\n");
					    stringHtml.append("for(var j=0;j<result.data.series.length;j++){\n");
					    stringHtml.append("seriesArr.push(result.data.series[j]);\n");
					    stringHtml.append("}\n");
					    stringHtml.append("theOption.series = seriesArr;\n");
					    
					    if(chart.getInterfaceName() != null && chart.getInterfaceName().equals("时点交易")){
						    stringHtml.append("var yAxis = {}; \n");
						    stringHtml.append("for(var i in theOption.yAxis[0]){\n");
						    stringHtml.append("yAxis[i] = theOption.yAxis[0][i];\n");
						    stringHtml.append("};\n");
						    stringHtml.append("theOption.yAxis.push(yAxis);\n");
						    stringHtml.append("theOption.series[1].yAxisIndex=1; \n");
						    stringHtml.append("theOption.yAxis[1].name = '(单位：人)'; \n");
					    }
					    
					    stringHtml.append("}\n");
					    stringHtml.append("theOption.title[0].text = \""+chart.getInterfaceName()+"\";\n");
					    stringHtml.append("theChart.setOption(theOption);\n");
					    
					    stringHtml.append("}else{\n");
					    stringHtml.append("$(\"#heightNo\"+\""+chart.getChartId()+"\").html(\"\");\n");
					    stringHtml.append("$(\"#heightNo\"+\""+chart.getChartId()+"\").html(result.data.high);\n");
					    stringHtml.append("$(\"#lowNo\"+\""+chart.getChartId()+"\").html(\"\");\n");
					    stringHtml.append("$(\"#lowNo\"+\""+chart.getChartId()+"\").html(result.data.low);\n");
					    
					    stringHtml.append("var heightPercent=(result.data.high*100/(result.data.high+result.data.low)).toFixed(1);\n");
					    stringHtml.append("var lowPercent=(result.data.low*100/(result.data.high+result.data.low)).toFixed(1);\n");
					    stringHtml.append("$(\"#heightPercent\"+\""+chart.getChartId()+"\").html('('+heightPercent+'%'+')');\n");
					    stringHtml.append("$(\"#lowPercent\"+\""+chart.getChartId()+"\").html('('+lowPercent+'%'+')');\n");
					    
					    stringHtml.append("}\n");
					    stringHtml.append("}\n");
					    stringHtml.append("});\n");
					    stringHtml.append("},parseInt("+chart.getRefreshTime()+")*60*1000);\n");
				    }
			  }	
			  stringHtml.append("})\n");
			  stringHtml.append("</script>\n");
			  stringHtml.append("</html>\n"); 
			  
			  printStream.println(stringHtml.toString()); 
			  printStream.flush();
			  printStream.close();
			  retMap.put("Error_code", "0");
		} catch (Exception e) {
			retMap.put("Error_code", "1");
			e.printStackTrace();
		}
		return retMap;
	}
	
	
	private Map<String, Object> saveMultiPartFileImage(MultipartFile file,String saveDir) {
		Map<String, Object> picInfo = new HashMap<String, Object>();
		File newFile = null;
		try {
			if(file != null) {	
				String originalFilename = file.getOriginalFilename();
				String attachSuffix = originalFilename.substring(originalFilename.lastIndexOf("."));
				int attachType = getPicType(attachSuffix);
				if(attachType != 2){
					picInfo.put("picError", "图片类型错误!");
					return picInfo;
				}
				File beforeDeletePath = new File(saveDir);
				if (beforeDeletePath.exists()) {
					FileUtils.deleteDirectory(beforeDeletePath);
				}
				picInfo.put("picName", originalFilename);
				newFile = new File(saveDir + originalFilename);
				if (!newFile.getParentFile().exists()) {
					newFile.getParentFile().mkdirs();
				}
				
				String picPath = saveDir + newFile.getName();
				picInfo.put("picPath", picPath);
				
				file.transferTo(newFile);
			}
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return picInfo;
	}
	
	private int getPicType(String attachSuffix) {
		Map<String, Integer> types = new HashMap<String, Integer>();
		
		types.put(".jpg", 2);
		types.put(".png", 2);
		types.put(".bmp", 2);
		types.put(".jpeg", 2);

		if (types.containsKey(attachSuffix)) {
			return types.get(attachSuffix);
		} else {

		}
		return 0;
	}

	@Override
	public int removeChart(List<String> list) {
		int createdBy = CurrentUserHolder.getCurrentUser().getUserId();
		int i = 0;
		try {
			if(0 < list.size()) {
				for(String chartId : list) {
			        File beforeDeletePath = new File(getChartPath(chartId));
			        if (beforeDeletePath.exists()) {
			        	FileUtils.deleteDirectory(beforeDeletePath);
			        }
					int j = chartMapper.updateChartDele(chartId, createdBy);
					if(0 < j) {
						i++;
					}
				}
			}
		}catch(Exception e) {
			i = -1;
		}
		return i;
	}
	
	@Override
	public String getChartPath(String chartId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("chartId", chartId);
		return localResourcePic + "\\" +chartMapper.selectChartPath(Integer.parseInt(chartId));
	}
	
	@Override
	public int publishChart(List<String> list) {
		Map<String, Object> map = null;
		int lastUpdatedBy = CurrentUserHolder.getCurrentUser().getUserId();
		int i = 0;
		if(0 < list.size()) {
			for(String chartId : list) {
				map = new HashMap<String, Object>(); 
				map.put("lastUpdatedBy", lastUpdatedBy);
				map.put("lastUpdatedDate", Timestamp.valueOf(TimeUtil.getThisFormatTime()));
				map.put("chartId", chartId);
				int j = chartMapper.updateChartStatus(map);
				if(0 < j) {
					i++;
				}
			}
		}
		return i;
	}

	@Override
	public List<Map<String, Object>> getInterfacesByCompId(Map<String, Object> map) {
		
		return chartMapper.getInterfacesByCompId(map);
	}
	

	@Override
	public Map<String, Object> getChartInfoById(String chartId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("chartId", chartId);
		Map<String, Object> returnMap = chartMapper.getChartInfoById(map);
		String path = String.valueOf(returnMap.get("path"));
		String newPath = resourcePic + path + "0.html";
		returnMap.put("newPath", newPath);
		return returnMap;
	}
	
	

	@Override
	public Map<String, Object> getInterfaceParamInfo(String interfaceId) {
		Map<String ,Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> interfaceMap = interfaceMapper.getInterfaceById(Integer.parseInt(interfaceId));
		resultMap.put("interfaceInfo", interfaceMap);
		List<Map<String, Object>>  paramList = paramMapper.selectParamByInterfaceId(Integer.parseInt(interfaceId));
		Map<String, Object> paramItemMap = new HashMap<String, Object>();
		for(Map<String, Object> map:paramList){
			if(map.get("paramType").equals(1)){
				paramItemMap.put("paramId", map.get("paramId"));
				map.put("Items", chartMapper.getParamItemList(paramItemMap));
			}
		}
		resultMap.put("params",paramList);
		resultMap.put("licenceCode", licenceCode);
		return resultMap;
	}
	
	private void mySaveCompParam(List<CompParamModel> compParamList){
		try {
			
			Map<String, Object> paramMap = null;
			for(CompParamModel compParam:compParamList){
				paramMap = new HashMap<String, Object>();
				paramMap.put("pk_chartParamId", 0);
				paramMap.put("compId", compParam.getCompId());
				paramMap.put("paramId", compParam.getParamId());
				paramMap.put("paramValue", compParam.getParamValue());
				chartMapper.saveCompParam(paramMap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	//
	public void saveCompParam(String compParamInfo) {
		try {
			 List<CompParamModel> compParamList = JsonUtil.json2list(compParamInfo,CompParamModel.class);
			Map<String, Object> paramMap = null;
			for(CompParamModel compParam:compParamList){
				paramMap = new HashMap<String, Object>();
				paramMap.put("pk_chartParamId", 0);
				paramMap.put("compId", compParam.getCompId());
				paramMap.put("paramId", compParam.getParamId());
				paramMap.put("paramValue", compParam.getParamValue());
				chartMapper.saveCompParam(paramMap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Map<String, Object>> getSynChartList(String synchroTime) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("synchroTime", synchroTime);
		List<Map<String, Object>> resultMapList = chartMapper.getSynChartList(paramMap);
		/*for(Map<String, Object> map:resultMapList){
			map.replace("path", resourcePic + String.valueOf(map.get("path")));
		}*/
		return resultMapList;
	}
	
	/**
	 * @Description: 将base64编码字符串转换为图片
	 * @Author: 
	 * @CreateTime: 
	 * @param imgStr base64编码字符串
	 * @param path 图片路径-具体到文件
	 * @return
	*/
	public boolean generateImage(String imgStr,String path) {
		BASE64Decoder decoder = new BASE64Decoder();  
	    try{  
	            //Base64解码 
	            byte[] b = decoder.decodeBuffer(imgStr);  
	            for(int i=0;i<b.length;++i)  
	            {  
	                if(b[i]<0)  
	                {//调整异常数据  
	                    b[i]+=256;  
	                }  
	            }  
	            OutputStream out = new FileOutputStream(path);      
	            out.write(b);  
	            out.flush();  
	            out.close();  
	            return true;  
	        }catch (Exception e)   
	        {  
	            return false;  
	        }  
	}

}
