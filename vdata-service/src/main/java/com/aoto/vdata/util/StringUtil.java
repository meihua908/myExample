/**   
* @Title: StringUtil.java 
* @Package com.aoto.easymanager.util 
* @Description: (字符串工具类) 
* @author liur01 
* @date 2015-12-8 下午02:40:52 
* @version V1.0   
*/
package com.aoto.vdata.util;


/** 
 * @ClassName: StringUtil 
 * @Description: (字符串工具类) 
 * @author liuy08
 * @date 2018-05-21 上午10:10:00 
 *  
 */

public class StringUtil {

	/**
	 * Object对象转换为字符串
	 * @param obj
	 * @return
	 */
	public static String toString(Object obj){
		return obj==null?"":obj.toString();
	}
	
}
