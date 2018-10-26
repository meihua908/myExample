package com.aoto.vdata.manager.persistence.inf;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.aoto.vdata.manager.model.ParamItemModel;

/**
 * @ClassName: ParamItemMapper
 * @Description: 参数项维护
 * @author liuy08
 * @date 2018-05-30 上午10:00:00
 * 
 */

public interface ParamItemMapper {
	
	/*List<Map<String, Object>> selectInterfaceByPage(Map<String, Object> map);*/
	
	int insertParamItem(Map<String, Object> map);

	int updateParamItem(ParamItemModel ParamItem);
	
	int deleteParamItemByParam(@Param ("interfaceId") int interfaceId);
	
}
