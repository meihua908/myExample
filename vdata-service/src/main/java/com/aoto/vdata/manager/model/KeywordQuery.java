package com.aoto.vdata.manager.model;

import com.aoto.framework.commons.pagination.PaginationQuery;

/**
 * @ClassName: CustIdKeywordQuery
 * @Description: 客户id关键字查询条件
 * @author liuy08
 * @date 2018-01-08 上午08:30:00
 * 
 */

public class KeywordQuery extends PaginationQuery {
		
	private static final long serialVersionUID = 1L;
	
	private String keyword;
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

}