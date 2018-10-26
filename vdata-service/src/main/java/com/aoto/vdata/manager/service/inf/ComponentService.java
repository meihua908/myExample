package com.aoto.vdata.manager.service.inf;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.aoto.framework.commons.pagination.PagingCriteria;
import com.aoto.vdata.manager.model.ComponentModel;
import com.aoto.vdata.manager.model.KeywordQuery;

/**
 * @ClassName: ComponentService
 * @Description: 组件维护
 * @author liuy08
 * @date 2018-05-21 上午10:00:00
 * 
 */

public interface ComponentService {

	List<Map<String, Object>> getComponentByPage(PagingCriteria pagingCriteria, KeywordQuery model);
	
	ComponentModel upload(List<MultipartFile> files);
	
	Map<String, Object> addComponent(ComponentModel component);
	
	int removeComponent(List<String> list);

	String getComponentPath(String componentId);

}
