package com.aoto.vdata.manager.persistence.inf;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.aoto.vdata.manager.model.ParamModel;

/**
 * @ClassName: ParamMapper
 * @Description: 参数维护
 * @author liuy08
 * @date 2018-05-30 上午10:00:00
 * 
 */

public interface ParamMapper {
	
	int insertParam(Map<String, Object> map);
	
	int insertConnect(Map<String, Object> map);

	int deleteConnectByInterface(@Param ("interfaceId") int interfaceId);
	
	int deleteParamByInterface(@Param ("interfaceId") int interfaceId);
	
	List<Map<String, Object>> selectParamByInterfaceId(int interfaceId);

}
