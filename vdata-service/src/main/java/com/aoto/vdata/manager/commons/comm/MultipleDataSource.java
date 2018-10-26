/**   
* @Title: MultipleDataSource.java 
* @Package com.aoto.easymanager.manager.commons.comm 
* @Description: TODO(用一句话描述该文件做什么) 
* @author liur01 
* @date 2016-1-6 下午02:51:11 
* @version V1.0   
*/
package com.aoto.vdata.manager.commons.comm;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

/** 
 * @ClassName: MultipleDataSource 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 * @author liuy08
 * @date 2018-5-21 上午10:00:00 
 *  
 */
public class MultipleDataSource extends AbstractRoutingDataSource {

	private static final ThreadLocal<String> dataSourceKey = new InheritableThreadLocal<String>();

    public static void setDataSourceKey(String dataSource) {
        dataSourceKey.set(dataSource);
    }
	
	
	/* (非 Javadoc) 
	 * <p>Title: determineCurrentLookupKey</p> 
	 * <p>Description: </p> 
	 * @return 
	 * @see org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource#determineCurrentLookupKey() 
	 */
	@Override
	protected Object determineCurrentLookupKey() {

		return dataSourceKey.get();
	}

}
