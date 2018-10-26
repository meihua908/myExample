package com.aoto.vdata.manager.model;

import com.aoto.framework.commons.pagination.PaginationQuery;

/**
 * @ClassName: ComponentModel
 * @Description: 组件
 * @author liuy08
 * @date 2018-05-21 上午10:00:00
 * 
 */

public class ComponentModel extends PaginationQuery {

	private static final long serialVersionUID = 1L;
	
	private int componentId;//组件id
	
	private String componentNo;//组件编号
	
	private String componentName;//组件名称
	
	private String componentType;//组件类型
	
	private String remark;//备注
	
	private String createdBy;//创建人
	
	private String createdDate;//创建时间
	
	private String lastUpdatedBy;//维护人
	
	private String lastUpdatedDate;//维护时间
	
	private int deleted;//删除标志
	
	private String compPath;//文件路径

	public int getComponentId() {
		return componentId;
	}

	public void setComponentId(int componentId) {
		this.componentId = componentId;
	}

	public String getComponentNo() {
		return componentNo;
	}

	public void setComponentNo(String componentNo) {
		this.componentNo = componentNo;
	}

	public String getComponentName() {
		return componentName;
	}

	public void setComponentName(String componentName) {
		this.componentName = componentName;
	}

	public String getComponentType() {
		return componentType;
	}

	public void setComponentType(String componentType) {
		this.componentType = componentType;
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

	public int getDeleted() {
		return deleted;
	}

	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}

	public String getCompPath() {
		return compPath;
	}

	public void setCompPath(String compPath) {
		this.compPath = compPath;
	}
	
}
