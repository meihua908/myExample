package com.aoto.vdata.manager.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.aoto.framework.commons.beans.JsonResult;
import com.aoto.framework.commons.pagination.PagingCriteria;
import com.aoto.vdata.manager.model.ComponentModel;
import com.aoto.vdata.manager.model.KeywordQuery;
import com.aoto.vdata.manager.service.inf.ComponentService;

/**
 * @ClassName: ComponentController
 * @Description: 组件维护
 * @author liuy08
 * @date 2018-05-10 上午08:30:00
 * 
 */

@Controller
public class ComponentController {
	
	private final static Logger logger = LoggerFactory.getLogger(ComponentController.class);
	
	@Autowired  
	private ComponentService componentService;  
	
	@RequestMapping(value = "/manage/component/pages", method = RequestMethod.GET)
    public ModelAndView getComponentPages() {
    	ModelAndView view = new ModelAndView("manage/component/list");
        return view;
    }

	@RequestMapping(value = "/manage/nobindComponent/pages", method = RequestMethod.GET)
    public ModelAndView getNobindComponentPages() {
    	ModelAndView view = new ModelAndView("manage/interface/nobindComponent");
        return view;
    }
      
	@RequestMapping(value = "/manage/component/list", method = RequestMethod.GET,produces = {"application/json"})
    @ResponseBody
    public Map<String,Object> getComponentByPage(KeywordQuery model) {
    	logger.info("传入的参数信息:keyword=" + model.getKeyword());
    	PagingCriteria pagingCriteria = new PagingCriteria(model.getPage() - 1, model.getRows(), model.getSort(), model.getOrder());
        List<Map<String, Object>> list = componentService.getComponentByPage(pagingCriteria, model);
        return JsonResult.json(pagingCriteria.getTotal(),list);
    }

	@RequestMapping(value="/manage/component/uploadFolder", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> uploadFileFolder(HttpServletRequest request) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		try {
	        MultipartHttpServletRequest param = ((MultipartHttpServletRequest) request);
	        List<MultipartFile> files = param.getFiles("fileFolder");
	        ComponentModel component = componentService.upload(files);
	        returnMap = componentService.addComponent(component);
		}catch(Exception e) {
			returnMap.put("returnCode", "-1");
	   		logger.info("新增组件异常："+e.getMessage());
		}
        return returnMap;
    }
	
	@RequestMapping(value = "/manage/component/remove", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> removeComponent(@RequestBody List<String> list) {
    	Map<String,Object> returnMap = new HashMap<String,Object>();
   	 try {
   		int i = componentService.removeComponent(list);
   		if(0 < i) {
   			returnMap.put("returnCode", "200");
   		}else {
   			returnMap.put("returnCode", "-1");
   		}
   	 }catch(Exception e) {
   		 returnMap.put("returnCode", "-1");
   		 logger.info("删除组件异常："+e.getMessage());
   	 }
     return returnMap;
    }
	
	@RequestMapping(value = "/manage/component/componentPath", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getComponentPath(String componentId) {
		logger.info("传入的参数信息componentId：" + componentId);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		try {
			returnMap.put("componentPath", componentService.getComponentPath(componentId));
			returnMap.put("returnCode", "200");
		}catch (Exception e) {
			returnMap.put("returnCode", "-1");
			returnMap.put("componentPath", null);
			logger.info("获取缩略图路径异常：" + e.getMessage());
		}
		return returnMap;
	}

}
