package com.aoto.vdata.manager.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.aoto.framework.commons.beans.JsonResult;
import com.aoto.vdata.manager.model.ChartModel;
import com.aoto.vdata.manager.service.inf.ChartService;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.aoto.framework.commons.pagination.PagingCriteria;
import com.aoto.vdata.manager.model.KeywordQuery;

/**
 * @ClassName: ChartController
 * @Description: 图表维护
 * @author liuy08
 * @date 2018-05-10 上午08:30:00
 * 
 */

@Controller
public class ChartController {
	
	private final static Logger logger = LoggerFactory.getLogger(ChartController.class);
	
	
	
	@Autowired
	private ChartService chartService;
	
	@RequestMapping(value = "/manage/chart/pages", method = RequestMethod.GET)
    public ModelAndView getChartPages() {
    	ModelAndView view = new ModelAndView("manage/chart/list");
        return view;
    }
	
	//
	@RequestMapping(value = "/manage/chart/designMain", method = RequestMethod.GET)
    public ModelAndView designChartInit() {
    	ModelAndView view = new ModelAndView("manage/design/main");
        return view;
    }
	
	/**
	 * 初始化图表组件
	 * @return
	 */
	@RequestMapping(value = "/manage/chart/InitChartCompent", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult InitChartCompent(){
		Map<String ,Object> compMap = new HashMap<String, Object>();
		try{
			List<Map<String, Object>> compList = chartService.getChartCompent();
			compMap.put("Data", compList);
			compMap.put("Error_code","0");
			compMap.put("Error_msg", "success");
		}catch(Exception e){
			compMap.put("Error_code", "1");
			compMap.put("Error_msg", e.toString());
    		e.printStackTrace();
		}
		return JsonResult.json(compMap);
	}
	
	/**
	 * 图表保存
	 * @param title
	 * @param chartInfo
	 * @return
	 */
	@RequestMapping(value = "/manage/chart/saveChart", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult saveChart(@RequestParam(value = "file", required = false) MultipartFile file,String chartName,String resolution,String backColor,String chartInfo,String imgUrl){
		logger.info("图表名称:"+chartName);
		logger.info("分辨率:"+resolution);
		logger.info("file:"+file);
		logger.info("backColor:"+backColor);
		logger.info("chartInfo:"+chartInfo);
		logger.info("imgUrl:"+imgUrl);
		Map<String ,Object> chartMap = new HashMap<String, Object>();
		ChartModel model = new ChartModel();
		try{
			model.setChartName(chartName);
			model.setResolution(resolution);
			model.setChartInfo(chartInfo);
			model.setBackColor(backColor);
			model.setFile(file);
			model.setImgUrl(imgUrl);
			chartMap = chartService.saveChartInfo(model);
		}catch(Exception e){
			chartMap.put("Error_code", "1");
			chartMap.put("Error_msg", e.toString());
    		e.printStackTrace();
		}
		return JsonResult.json(chartMap);
	}
	
	/**
	 * 组件参数信息保存
	 * @return
	 */
	public JsonResult saveCompParam(String compParamInfo){
		Map<String ,Object> compMap = new HashMap<String, Object>();
		try{
			chartService.saveCompParam(compParamInfo);
			compMap.put("Error_code","0");
			compMap.put("Error_msg", "success");
		}catch(Exception e){
			compMap.put("Error_code", "1");
			compMap.put("Error_msg", e.toString());
    		e.printStackTrace();
		}
		return JsonResult.json(compMap);
	}
	
	/**
	 * 拖动图表ID查找图表对应的接口
	 * @param compId
	 * @return
	 */
	@RequestMapping(value = "/manage/chart/getInterfacesByCompId", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult getInterfacesByCompId(String compId){
		logger.info("组件ID:"+compId);
		Map<String ,Object> paramMap = new HashMap<String, Object>();
		Map<String ,Object> resultMap = new HashMap<String, Object>();
		try{
			paramMap.put("compId", compId);
			List<Map<String, Object>> resultList = chartService.getInterfacesByCompId(paramMap);
			resultMap.put("Data", resultList);
			resultMap.put("Error_code","0");
			resultMap.put("Error_msg", "success");
		}catch(Exception e){
			resultMap.put("Error_code", "1");
			resultMap.put("Error_msg", e.toString());
    		e.printStackTrace();
		}
		return JsonResult.json(resultMap);
	}
	
	
	/**
	 * 通过chartId查找chartInfo
	 * @param chartId
	 * @return
	 */
	@RequestMapping(value = "/manage/chart/getChartInfoById", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult getChartInfoById(String chartId){
		logger.info("charID:"+chartId);
		Map<String ,Object> resultMap = new HashMap<String, Object>();
		try{
			resultMap = chartService.getChartInfoById(chartId);
			resultMap.put("Error_code","0");
			resultMap.put("Error_msg", "success");
		}catch(Exception e){
			resultMap.put("Error_code", "1");
			resultMap.put("Error_msg", e.toString());
    		e.printStackTrace();
		}
		return JsonResult.json(resultMap);
	}
	
	
	/**
	 * 查找接口参数及参数项信息
	 * @param interfaceId
	 * @return
	 */
	@RequestMapping(value = "/manage/chart/getInterfaceParamInfo", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult getInterfaceParamInfo(String interfaceId){
		logger.info("接口ID:"+interfaceId);
		Map<String ,Object> resultMap = new HashMap<String, Object>();
		try{
			Map<String, Object> map = chartService.getInterfaceParamInfo(interfaceId);
			resultMap.put("Data", map);
			resultMap.put("Error_code","0");
			resultMap.put("Error_msg", "success");
		}catch(Exception e){
			resultMap.put("Error_code", "1");
			resultMap.put("Error_msg", e.toString());
    		e.printStackTrace();
		}
		return JsonResult.json(resultMap);
	}
	
	
	@RequestMapping(value = "/manage/chart/list", method = RequestMethod.GET,produces = {"application/json"})
    @ResponseBody
    public Map<String,Object> getChartByPage(KeywordQuery model) {
    	logger.info("传入的参数信息:keyword=" + model.getKeyword());
    	PagingCriteria pagingCriteria = new PagingCriteria(model.getPage() - 1, model.getRows(), model.getSort(), model.getOrder());
        List<Map<String, Object>> list = chartService.getChartByPage(pagingCriteria, model);
        return JsonResult.json(pagingCriteria.getTotal(),list);
    }
	
	@RequestMapping(value = "/manage/chart/remove", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> removeChart(@RequestBody List<String> list) {
    	Map<String,Object> returnMap = new HashMap<String,Object>();
   	 try {
   		int i = chartService.removeChart(list);
   		if(0 < i) {
   			returnMap.put("returnCode", "200");
   		}else {
   			returnMap.put("returnCode", "-1");
   		}
   	 }catch(Exception e) {
   		 returnMap.put("returnCode", "-1");
   		 logger.info("删除图表异常："+e.getMessage());
   	 }
     return returnMap;
    }
	
	@RequestMapping(value = "/manage/chart/publish", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> publishChart(@RequestBody List<String> list) {
    	Map<String,Object> returnMap = new HashMap<String,Object>();
   	 try {
   		int i = chartService.publishChart(list);
   		if(0 < i) {
   			returnMap.put("returnCode", "200");
   		}else {
   			returnMap.put("returnCode", "-1");
   		}
   	 }catch(Exception e) {
   		 returnMap.put("returnCode", "-1");
   		 logger.info("发布图表异常："+e.getMessage());
   	 }
     return returnMap;
    }
	
	
	/**
	 * 图表组件同步
	 * @param synchroTime
	 * @return
	 */
	@RequestMapping(value = "/services/manage/chart/synchro", method = RequestMethod.GET)
	@ResponseBody
	public JsonResult synchroChart(String synchroTime){
		logger.info("同步时间:" + synchroTime);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			List<Map<String, Object>> chartList = chartService.getSynChartList(synchroTime);
			result.put("error_code", "0");
			result.put("error_msg", "success");
			result.put("data", chartList);
		} catch (Exception e) {
			result.put("error_code", "-1");
			result.put("error_code", e.toString());
			e.printStackTrace();
		}
		return JsonResult.json(result);
	}
	
	@RequestMapping(value = "/services/chart/getInterfaceData", method = RequestMethod.GET)
    @ResponseBody
	public JSONPObject getInterfaceData(String callbackparam){
		Map<String ,Object> resultMap = new HashMap<String, Object>();
		try{
			//res.setContentType("text/plain");
			//String callbackFunName =req.getParameter("callbackparam");//得到js函数名称
			
			//res.getWriter().write(callbackFunName + "([ { name:\"John\"}])"); //返回jsonp数据     
			
			Map<String, Object> map = new HashMap<String, Object>();			
			/*Map<String, Object> xAxisMap = new HashMap<String, Object>();
			xAxisMap.put("type", "category");*/
			List<String> xAxisDataList = new ArrayList<String>();
			xAxisDataList.add("2012");
			xAxisDataList.add("2013");
			xAxisDataList.add("2014");
			xAxisDataList.add("2015");
			xAxisDataList.add("2016");
			xAxisDataList.add("2017");
			xAxisDataList.add("2018");
			map.put("xAxisData", xAxisDataList);
			
			List<Integer> dataList = new ArrayList<Integer>();
			dataList.add(220);
			dataList.add(332);
			dataList.add(301);
			dataList.add(334);
			dataList.add(490);
			dataList.add(590);
			dataList.add(690);
			map.put("seriesData", dataList);
			/*xAxisMap.put("name", "年份");
			List<String> xAxisDataList = new ArrayList<String>();
			xAxisDataList.add("2012");
			xAxisDataList.add("2013");
			xAxisDataList.add("2014");
			xAxisDataList.add("2015");
			xAxisMap.put("data",xAxisDataList);
			map.put("xAxis", xAxisMap);
			
			List<Map<String, Object>> seriesMapList = new ArrayList<Map<String, Object>>();
			
			Map<String, Object> dataMap1 = new HashMap<String, Object>();
			dataMap1.put("name","历年开户人数");
			List<Integer> dataList1 = new ArrayList<Integer>();
			dataList1.add(320);
			dataList1.add(332);
			dataList1.add(301);
			dataList1.add(334);
			dataList1.add(390);
			dataMap1.put("data", dataList1);			
			seriesMapList.add(dataMap1);
			
			Map<String, Object> dataMap2 = new HashMap<String, Object>();
			dataMap1.put("name","历年销户人数");
			List<Integer> dataList2 = new ArrayList<Integer>();
			dataList2.add(300);
			dataList2.add(200);
			dataList2.add(210);
			dataList2.add(220);
			dataList2.add(250);
			dataMap2.put("data",dataList2);			
			seriesMapList.add(dataMap2);
			
			Map<String, Object> dataMap3 = new HashMap<String, Object>();
			dataMap3.put("name","历年总客户量");
			List<Integer> dataList3 = new ArrayList<Integer>();
			dataList3.add(800);
			dataList3.add(700);
			dataList3.add(410);
			dataList3.add(220);
			dataList3.add(250);
			dataMap3.put("data",dataList3);			
			seriesMapList.add(dataMap3);
			
			map.put("series", map);*/
			resultMap.put("data", map);
			resultMap.put("error_code","0");
			resultMap.put("error_msg", "success");
		}catch(Exception e){
			resultMap.put("error_code", "1");
			resultMap.put("error_msg", e.toString());
    		e.printStackTrace();
		}
		
		System.out.println("sss:"+new JSONPObject(callbackparam, resultMap).toString());
		return new JSONPObject(callbackparam, resultMap);  
	}

}
