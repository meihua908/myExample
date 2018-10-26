package com.aoto.vdata.manager.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aoto.framework.commons.beans.JsonResult;
import com.aoto.framework.commons.pagination.PagingCriteria;
import com.aoto.vdata.manager.model.KeywordQuery;
import com.aoto.vdata.manager.service.inf.InterfaceService;

/**
 * @ClassName: InterfaceController
 * @Description: 图表维护
 * @author liuy08
 * @date 2018-05-10 上午08:30:00
 * 
 */

@Controller
public class InterfaceController {
	
	private final static Logger logger = LoggerFactory.getLogger(InterfaceController.class);

	@Autowired
	private InterfaceService interfaceService;
	
	@RequestMapping(value = "/manage/interface/pages", method = RequestMethod.GET)
    public ModelAndView getInterfacePages() {
    	ModelAndView view = new ModelAndView("manage/interface/list");
        return view;
    }
    
	@RequestMapping(value = "/manage/interface/list", method = RequestMethod.GET,produces = {"application/json"})
	@ResponseBody
	public Map<String,Object> getInterfaceByPage(KeywordQuery model) {
		logger.info("传入的参数信息:keyword=" + model.getKeyword());
		PagingCriteria pagingCriteria = new PagingCriteria(model.getPage() - 1, model.getRows(), model.getSort(), model.getOrder());
		List<Map<String, Object>> list = interfaceService.getInterfaceByPage(pagingCriteria, model);
		return JsonResult.json(pagingCriteria.getTotal(),list);
  }

	@RequestMapping(value="/manage/interface/add", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addInterface(HttpServletRequest request) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		try {
			String data = request.getParameter("data");
			returnMap = interfaceService.importInterface(data);
		}catch(Exception e) {
			returnMap.put("returnCode", "-1");
	   		logger.info("导入接口异常："+e.getMessage());
		}
        return returnMap;
    }

	@RequestMapping(value = "/manage/interface/remove", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> removeComponent(@RequestBody List<String> list) {
    	Map<String,Object> returnMap = new HashMap<String,Object>();
   	 	try {
	   		int i = interfaceService.removeInterface(list);
	   		if(0 < i) {
	   			returnMap.put("num", i);
	   			returnMap.put("returnCode", "200");
	   		}else {
	   			returnMap.put("returnCode", "-1");
	   		}
   	 	}catch(Exception e) {
   	 		returnMap.put("returnCode", "-1");
   	 		logger.info("删除接口异常："+e.getMessage());
   	 	}
   	 	return returnMap;
	}

	@RequestMapping(value = "/manage/interface/{interfaceId}/bindComponent", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> bindWatch(@PathVariable("interfaceId") int interfaceId, @RequestBody List<Integer> list) {
    	Map<String,Object> returnMap = new HashMap<String,Object>();
      	try {
      		int i = interfaceService.bindComponent(interfaceId, list);
      		if(0 < i){
      			returnMap.put("returnCode", "200");
      		}
   	 	}catch(Exception e) {
   	 		returnMap.put("returnCode", "-1");
   	 		logger.info("绑定组件异常："+e.getMessage());
   	 	}
   	 	return returnMap;
	}
	
	@RequestMapping(value = "/manage/interface/unbindComponent", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> unbindWatch(@RequestBody List<Integer> list) {
    	Map<String,Object> returnMap = new HashMap<String,Object>();
      	try {
      		int i = interfaceService.unbindComponent(list);
      		if(0 < i){
      			returnMap.put("returnCode", "200");
      		}
   	 	}catch(Exception e) {
   	 		returnMap.put("returnCode", "-1");
   	 		logger.info("解绑组件异常："+e.getMessage());
   	 	}
   	 	return returnMap;
	}
	
	@RequestMapping(value = "/manage/interface/{interfaceId}/show", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> showInterface(@PathVariable("interfaceId") int interfaceId) {
    	Map<String,Object> returnMap = new HashMap<String,Object>();
    	returnMap.put("data", interfaceService.showInterface(interfaceId));
    	return returnMap;
	}
	
}
