package com.aoto.vdata.manager.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * @ClassName: ChartModel
 * @Description: 图表
 * @author liuy08
 * @date 2018-05-21 上午10:00:00
 * 
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class ChartInfoModel{
	
	private String chartId;//
	
	private String chartType;//
	
	private String compNo;
	
	private String interfaceId;
	
	private String interfaceUrl;
	
	private String interfaceName;
	
	private String interfaceNo;
	
	private String top;//
	
	private String left;//
	
	private String width;//
	
	private String height;//
	
	private String opacity;
	
	private String refreshTime;
	
	private String dataList;
	
	private String compParamInfo;
	
	
	public String getInterfaceNo() {
		return interfaceNo;
	}

	public void setInterfaceNo(String interfaceNo) {
		this.interfaceNo = interfaceNo;
	}

	public String getInterfaceName() {
		return interfaceName;
	}

	public void setInterfaceName(String interfaceName) {
		this.interfaceName = interfaceName;
	}

	public String getInterfaceUrl() {
		return interfaceUrl;
	}

	public void setInterfaceUrl(String interfaceUrl) {
		this.interfaceUrl = interfaceUrl;
	}

	public String getRefreshTime() {
		return refreshTime;
	}

	public void setRefreshTime(String refreshTime) {
		this.refreshTime = refreshTime;
	}

	public String getCompParamInfo() {
		return compParamInfo;
	}

	public void setCompParamInfo(String compParamInfo) {
		this.compParamInfo = compParamInfo;
	}

	public String getChartId() {
		return chartId;
	}

	public String getOpacity() {
		return opacity;
	}

	public void setOpacity(String opacity) {
		this.opacity = opacity;
	}

	public String getInterfaceId() {
		return interfaceId;
	}

	public void setInterfaceId(String interfaceId) {
		this.interfaceId = interfaceId;
	}

	public String getCompNo() {
		return compNo;
	}

	public void setCompNo(String compNo) {
		this.compNo = compNo;
	}

	public String getDataList() {
		return dataList;
	}

	public void setDataList(String dataList) {
		this.dataList = dataList;
	}

	public void setChartId(String chartId) {
		this.chartId = chartId;
	}

	public String getChartType() {
		return chartType;
	}

	public void setChartType(String chartType) {
		this.chartType = chartType;
	}

	public String getTop() {
		return top;
	}

	public void setTop(String top) {
		this.top = top;
	}

	public String getLeft() {
		return left;
	}

	public void setLeft(String left) {
		this.left = left;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}
	
}
