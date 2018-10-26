package com.aoto.vdata.manager.service.inf;

import java.util.List;
import java.util.Map;

import com.aoto.framework.commons.pagination.PagingCriteria;
import com.aoto.vdata.manager.model.InterfaceModel;
import com.aoto.vdata.manager.model.KeywordQuery;
import com.aoto.vdata.manager.model.ParamItemModel;
import com.aoto.vdata.manager.model.ParamModel;

/**
 * @ClassName: InterfaceService
 * @Description: 接口维护
 * @author liuy08
 * @date 2018-05-21 上午10:00:00
 * 
 */

public interface InterfaceService {

	List<Map<String, Object>> getInterfaceByPage(PagingCriteria pagingCriteria, KeywordQuery model);

	List<Map<String, Object>> showInterface(int interfaceId);
	
	Map<String, Object> importInterface(String data);
	
	int addInterface(InterfaceModel interfacemodel);

	int addParam(ParamModel param);
	
	void addParamItem(ParamItemModel paramItem);
	
	int removeInterface(List<String> list);

	int bindComponent(int userId, List<Integer> list);
	
	int unbindComponent(List<Integer> list);

}
