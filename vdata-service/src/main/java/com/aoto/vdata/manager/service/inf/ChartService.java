package com.aoto.vdata.manager.service.inf;

import com.aoto.vdata.manager.model.ChartModel;

import java.util.List;
import java.util.Map;

import com.aoto.framework.commons.pagination.PagingCriteria;
import com.aoto.vdata.manager.model.KeywordQuery;

/**
 * @ClassName: ChartService
 * @Description: 图表维护
 * @author liuy08
 * @date 2018-05-21 上午10:00:00
 * 
 */

public interface ChartService {
	
	List<Map<String, Object>> getChartByPage(PagingCriteria pagingCriteria, KeywordQuery model);
	
	public List<Map<String, Object>> getChartCompent();

	public Map<String, Object> saveChartInfo(ChartModel model);
	
	public void saveCompParam(String compParamInfo);
	
	public List<Map<String, Object>> getInterfacesByCompId(Map<String, Object> map);
	
	public Map<String, Object> getInterfaceParamInfo(String interfaceId);
	
	public Map<String, Object> getChartInfoById(String chartId);
	
	int removeChart(List<String> list);
	
	String getChartPath(String componentId);
	
	int publishChart(List<String> list);
	
	public List<Map<String, Object>> getSynChartList(String synchroTime);

}
