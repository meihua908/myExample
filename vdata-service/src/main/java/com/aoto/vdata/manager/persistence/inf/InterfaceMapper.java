package com.aoto.vdata.manager.persistence.inf;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.aoto.vdata.manager.model.InterfaceModel;

/**
 * @ClassName: InterfaceMapper
 * @Description: 接口维护
 * @author liuy08
 * @date 2018-05-21 上午10:00:00
 * 
 */

public interface InterfaceMapper {
	
	List<Map<String, Object>> selectInterfaceByPage(Map<String, Object> map);
	
	String selectIdByNo(String interfaceNo);

	int insertInterface(Map<String, Object> map);
	
	int updateInterface(InterfaceModel interfaceModel);
	
	int updateInterfaceStatus(@Param ("interfaceId") int interfaceId, @Param ("createdBy") int createdBy);
	
	int insertInterfaceComp(@Param("interfaceId") int interfaceId, @Param("componentId") int componentId);
    
	int deleteInterfaceComp(@Param("interfaceId") int interfaceId);

	Map<String, Object> getInterfaceById(int interfaceId);
}
