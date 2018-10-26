package com.aoto.vdata.manager.model;

import com.aoto.framework.commons.pagination.PaginationQuery;

/**
 * @ClassName: ChartModel
 * @Description: 图表
 * @author liuy08
 * @date 2018-05-21 上午10:00:00
 * 
 */

public class ParamModel extends PaginationQuery {

	private static final long serialVersionUID = 1L;
	
	private int paramId;//参数id
	
	private String paramMark;//参数标识
	
	private int interfaceId;//接口id

	private String paramName;//参数名称
	
	private String paramType;//参数类型
	
	private String paramDefault;//默认参数值
	
	private String remark;//备注

	private String createdBy;//创建人
	
	private String createdDate;//创建时间
	
	private String lastUpdatedBy;//维护人
	
	private String lastUpdatedDate;//维护时间

	/*private ParamItemModel paramItem;*/

	public int getParamId() {
		return paramId;
	}

	public void setParamId(int paramId) {
		this.paramId = paramId;
	}

	public int getInterfaceId() {
		return interfaceId;
	}

	public void setInterfaceId(int interfaceId) {
		this.interfaceId = interfaceId;
	}

	public String getParamMark() {
		return paramMark;
	}

	public void setParamMark(String paramMark) {
		this.paramMark = paramMark;
	}

	public String getParamName() {
		return paramName;
	}

	public void setParamName(String paramName) {
		this.paramName = paramName;
	}

	public String getParamType() {
		return paramType;
	}

	public void setParamType(String paramType) {
		this.paramType = paramType;
	}

	public String getParamDefault() {
		return paramDefault;
	}

	public void setParamDefault(String paramDefault) {
		this.paramDefault = paramDefault;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getLastUpdatedBy() {
		return lastUpdatedBy;
	}

	public void setLastUpdatedBy(String lastUpdatedBy) {
		this.lastUpdatedBy = lastUpdatedBy;
	}

	public String getLastUpdatedDate() {
		return lastUpdatedDate;
	}

	public void setLastUpdatedDate(String lastUpdatedDate) {
		this.lastUpdatedDate = lastUpdatedDate;
	}

	/*public ParamItemModel getParamItem() {
		return paramItem;
	}

	public void setParamItem(ParamItemModel paramItem) {
		this.paramItem = paramItem;
	}*/
	
}
