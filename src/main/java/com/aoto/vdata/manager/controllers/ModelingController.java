package com.aoto.vdata.manager.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * @ClassName: ModelingController
 * @Description: 自动化建模
 * @author liuy08
 * @date 2018-06-04 上午10:00:00
 * 
 */

@Controller
public class ModelingController {
	
	private final static Logger logger = LoggerFactory.getLogger(ModelingController.class);
	
	@RequestMapping(value = "/manage/modeling/pages", method = RequestMethod.GET)
    public ModelAndView getModelingPages() {
    	ModelAndView view = new ModelAndView("manage/modeling/list");
        return view;
    }

}
