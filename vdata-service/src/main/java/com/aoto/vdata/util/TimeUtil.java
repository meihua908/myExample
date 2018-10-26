/**   
* @Title: TimeUtil.java 
* @Package com.aoto.easymanager.util 
* @Description: (时间工具类)  
* @author liur01 
* @date 2015-12-8 下午01:35:11 
* @version V1.0   
*/
package com.aoto.vdata.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/** 
 * @ClassName: TimeUtil
 * @Description: (时间工具类) 
 * @author liuy08
 * @date 2018-05-21 上午10:10:00 
 *  
 */

public class TimeUtil {

	/**
	 * 获取当前时间，细化到秒
	 * @return
	 */
	public static String getThisTime(){
		SimpleDateFormat sdf_second = new SimpleDateFormat("yyyyMMddHHmmss");
		return sdf_second.format(new Date());
	}
	
	/**
	 * 获取当前时间，细化到秒
	 * @return
	 */
	public static String getThisFormatTime(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(new Date());
	}
	
	/**
	 * 获取当前时间，细化到分
	 * @return
	 */
	public static String getThisMinute(){
		SimpleDateFormat sdf_minute = new SimpleDateFormat("yyyyMMddHHmm");
		return sdf_minute.format(new Date());
	}
	
	/**
	 * 获取当前时间，细化到小时
	 * @return
	 */
	public static String getThisHour(){
		SimpleDateFormat sdf_hour = new SimpleDateFormat("yyyyMMddHH");
		return sdf_hour.format(new Date());
	}
	
	/**
	 * 获取当天日期（String），格式yyyyMMdd
	 * @return
	 */
	public static String getToday(){
		SimpleDateFormat sdf_day = new SimpleDateFormat("yyyyMMdd");
		return sdf_day.format(new Date());
	}
	
	/**
	 * 获取当天日期（String），格式yyyy-MM-dd
	 * @return
	 */
	public static String getTodayStd(){
		SimpleDateFormat sdf_day_std = new SimpleDateFormat("yyyy-MM-dd");
		return sdf_day_std.format(new Date());
	}
	
	/**
	 * 格式转换，格式由yyyy-MM-dd转为yyyyMMdd
	 * @return
	 */
	public static String tranfer(String srcDate){
		SimpleDateFormat sdf_day_std = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf_day = new SimpleDateFormat("yyyyMMdd");
		Date date = null;
		try {
			date = sdf_day_std.parse(srcDate);
		} catch (ParseException e) {
			date = new Date();
		}
		return sdf_day.format(date);
	}
	
	/**
	 * 获取当前时间，格式long
	 * @return
	 */
	public static long getTime(){
		return new Date().getTime();
	}
	
	/**
	 * 字符串转date类型，格式yyyyMMdd
	 * @return
	 */
	public static Date parseDayDate(String date){
		SimpleDateFormat sdf_day = new SimpleDateFormat("yyyyMMdd");
		try {
			return sdf_day.parse(date);
		} catch (ParseException e) {
			return null;
		}
	}
	
	/**
	 * 字符串转date类型，格式yyyy-MM-dd
	 * @return
	 */
	public static Date parseDayDateStd(String date){
		SimpleDateFormat sdf_day_std = new SimpleDateFormat("yyyy-MM-dd");
		try {
			return sdf_day_std.parse(date);
		} catch (ParseException e) {
			return null;
		}
	}
	
	/**
	 * 字符串转date类型，格式yyyy-MM-dd HH:mm:ss
	 * @return
	 */
	public static Date parseSecondDateStd(String time){
		SimpleDateFormat sdf_second_std = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			return sdf_second_std.parse(time);
		} catch (ParseException e) {
			return null;
		}
	}
	
	/**
	 * 时间字符串转当天时间的长整型，格式HH:mm:ss
	 * @return
	 */
	public static long timeToLong(String hms){
		SimpleDateFormat sdf_second_std = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = getTodayStd()+" "+hms;
		try {
			return sdf_second_std.parse(time).getTime();
		} catch (ParseException e) {
			return 0;
		}
	}
	
	/**
	 * 判断给定字符串的生日今天是否是生日，格式yyyyMMdd
	 * @return 1是0不是
	 */
	public static String isBirthday(String birth){
		SimpleDateFormat sdf_birthday = new SimpleDateFormat("MMdd");
		try
	      {
	          if (sdf_birthday.format(new Date()).equals(birth.substring(4)))
	          {
	              return "1";
	          }
	      }
	      catch (Exception e)
	      {
	
	      }
	      return "0";
	
		}
}
