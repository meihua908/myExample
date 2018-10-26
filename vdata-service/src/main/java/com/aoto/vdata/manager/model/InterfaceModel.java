package com.aoto.vdata.manager.model;

import com.aoto.framework.commons.pagination.PaginationQuery;

/**
 * @ClassName: InterfaceModel
 * @Description: 接口
 * @author liuy08
 * @date 2018-05-21 上午10:00:00
 * 
 */

public class InterfaceModel extends PaginationQuery {

	private static final long serialVersionUID = 1L;
	
	private int interfaceId;//接口id
	
	private String interfaceNo;//接口编号
	
	private String interfaceName;//接口名称
	
	private String interfaceWay;//请求方式
	
	private String interfaceUrl;//接口URL
	
	private String remark;//备注
	
	private String createdBy;//创建人
	
	private String createdDate;//创建时间
	
	private String lastUpdatedBy;//维护人
	
	private String lastUpdatedDate;//维护时间
	
	/*private ParamModel param;*/
	
	private int deleted;//删除标志

	public int getInterfaceId() {
		return interfaceId;
	}

	public void setInterfaceId(int interfaceId) {
		this.interfaceId = interfaceId;
	}

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

	public String getInterfaceWay() {
		return interfaceWay;
	}

	public void setInterfaceWay(String interfaceWay) {
		this.interfaceWay = interfaceWay;
	}

	public String getInterfaceUrl() {
		return interfaceUrl;
	}

	public void setInterfaceUrl(String interfaceUrl) {
		this.interfaceUrl = interfaceUrl;
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
	
}
