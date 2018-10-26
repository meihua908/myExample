package com.aoto.vdata.manager.persistence.inf;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: ChartMapper
 * @Description: 图表维护
 * @author liuy08
 * @date 2018-05-21 上午10:00:00
 * 
 */

public interface ChartMapper {
	
	public int insertChartInfo(Map<String, Object> map);

	List<Map<String, Object>> selectChartByPage(Map<String, Object> map);
	
	List<Map<String, Object>> getChartCompent(Map<String, Object> map);
	
	public List<Map<String, Object>> getInterfacesByCompId(Map<String, Object> map);
	
	public Map<String, Object> getChartInfoById(Map<String, Object> map);

	int updateChartDele(@Param ("chartId") String chartId, @Param ("createdBy") int createdBy);
	
	int updateChartStatus(Map<String, Object> map);
	
	String selectChartPath(@Param ("chartId") int componentId);
	
	public int saveChartComp(Map<String, Object> map);
	
	public List<Map<String, Object>> getParamItemList(Map<String, Object> map);
	
	public int saveCompParam(Map<String, Object> map);
	
	public List<Map<String, Object>> getSynChartList(Map<String, Object> map);

}
