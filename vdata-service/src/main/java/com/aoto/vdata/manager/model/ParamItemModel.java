package com.aoto.vdata.manager.model;

import com.aoto.framework.commons.pagination.PaginationQuery;

/**
 * @ClassName: ChartModel
 * @Description: 图表
 * @author liuy08
 * @date 2018-05-21 上午10:00:00
 * 
 */

public class ParamItemModel extends PaginationQuery {

	private static final long serialVersionUID = 1L;
	
	private int paramItemId;//参数项id
	
	private int paramId;//参数id
	
	private String paramItemName;//参数项名称
	
	private String paramItemValue;//参数项值
	
	private int paramItemOrder;//顺序
	
	private int deleted;//删除标识
	
	private String createdBy;//创建人
	
	private String createdDate;//创建时间
	
	private String lastUpdatedBy;//维护人
	
	private String lastUpdatedDate;//维护时间

	public int getParamItemId() {
		return paramItemId;
	}

	public void setParamItemId(int paramItemId) {
		this.paramItemId = paramItemId;
	}

	public int getParamId() {
		return paramId;
	}

	public void setParamId(int paramId) {
		this.paramId = paramId;
	}

	public String getParamItemName() {
		return paramItemName;
	}

	public void setParamItemName(String paramItemName) {
		this.paramItemName = paramItemName;
	}

	public String getParamItemValue() {
		return paramItemValue;
	}

	public void setParamItemValue(String paramItemValue) {
		this.paramItemValue = paramItemValue;
	}

	public int getParamItemOrder() {
		return paramItemOrder;
	}

	public void setParamItemOrder(int paramItemOrder) {
		this.paramItemOrder = paramItemOrder;
	}

	public int getDeleted() {
		return deleted;
	}

	public void setDeleted(int deleted) {
		this.deleted = deleted;
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

}
