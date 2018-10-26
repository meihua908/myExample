package com.aoto.vdata.manager.model;

import org.springframework.web.multipart.MultipartFile;

import com.aoto.framework.commons.pagination.PaginationQuery;

/**
 * @ClassName: ChartModel
 * @Description: 图表
 * @author liuy08
 * @date 2018-05-21 上午10:00:00
 * 
 */

public class ChartModel extends PaginationQuery {

	private static final long serialVersionUID = 1L;
	
	private int chartId;//图表id
	
	private String chartName;//图表名称
	
	private String status;//图表状态
	
	private String remark;//备注
	
	private String backImg;//背景图片路径
	
	private String backImgName;//背景图片
	
	private String backColor;//背景颜色
	
	private String resolution;//分辨率
	
	private String path;//图表路径
	
	private String createdBy;//创建人
	
	private String createdDate;//创建时间
	
	private String lastUpdatedBy;//维护人
	
	private String lastUpdatedDate;//维护时间
	
	private String chartInfo;
	
	private MultipartFile file;
	
	private String imgUrl;
	
	private int deleted;//删除标志
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public int getChartId() {
		return chartId;
	}

	public void setChartId(int chartId) {
		this.chartId = chartId;
	}

	public String getChartName() {
		return chartName;
	}

	public void setChartName(String chartName) {
		this.chartName = chartName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getBackImg() {
		return backImg;
	}

	public void setBackImg(String backImg) {
		this.backImg = backImg;
	}

	public String getBackImgName() {
		return backImgName;
	}

	public void setBackImgName(String backImgName) {
		this.backImgName = backImgName;
	}

	public String getBackColor() {
		return backColor;
	}

	public void setBackColor(String backColor) {
		this.backColor = backColor;
	}

	public String getResolution() {
		return resolution;
	}

	public void setResolution(String resolution) {
		this.resolution = resolution;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
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

	public String getChartInfo() {
		return chartInfo;
	}

	public void setChartInfo(String chartInfo) {
		this.chartInfo = chartInfo;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
}
