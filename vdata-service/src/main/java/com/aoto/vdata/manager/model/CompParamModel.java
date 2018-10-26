package com.aoto.vdata.manager.model;

/**
 * @ClassName: ChartModel
 * @Description: 图表
 * @author liuy08
 * @date 2018-05-21 上午10:00:00
 * 
 */

public class CompParamModel{

	private static final long serialVersionUID = 1L;
	
	private String compId;  //组件ID
	
	private String paramId;  //参数id
	
	private String paramName; //参数名字
	
	private String paramValue;  //参数值	

	public String getParamName() {
		return paramName;
	}

	public void setParamName(String paramName) {
		this.paramName = paramName;
	}

	public String getCompId() {
		return compId;
	}

	public void setCompId(String compId) {
		this.compId = compId;
	}

	public String getParamId() {
		return paramId;
	}

	public void setParamId(String paramId) {
		this.paramId = paramId;
	}

	public String getParamValue() {
		return paramValue;
	}

	public void setParamValue(String paramValue) {
		this.paramValue = paramValue;
	}
	
	

}
