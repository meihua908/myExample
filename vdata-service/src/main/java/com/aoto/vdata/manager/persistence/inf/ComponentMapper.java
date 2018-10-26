package com.aoto.vdata.manager.persistence.inf;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.aoto.vdata.manager.model.ComponentModel;

/**
 * @ClassName: ComponentMapper
 * @Description: 组件维护
 * @author liuy08
 * @date 2018-05-21 上午10:00:00
 * 
 */

public interface ComponentMapper {
	
	List<Map<String, Object>> selectComponentByPage(Map<String, Object> map);
	
	String selectNoById(int componentId);
	
	String selectIdByNo(String componentNo);
	
	int insertComponent(Map<String, Object> map);

	int updateComponent(ComponentModel component);
	
	int updateComponentStatus(@Param ("componentId") String componentId, @Param ("lastUpdatedBy") int lastUpdatedBy, @Param ("lastUpdatedDate") String lastUpdatedDate);

	String selectComponentPath(@Param ("componentId") int componentId);
	
}
