package com.aoto.vdata.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

/** 
 * @author liuy08
 * @date 2018-05-21 上午10:10:00 
 *  
 */

public class JsonUtil 
{
    private static ObjectMapper objectMapper = new ObjectMapper();

    /**
     * javaBean,list,array convert to json string
     */
    public static String obj2json(Object obj) throws Exception
    {
        return objectMapper.writeValueAsString(obj);
    }

    /**
     * json string convert to javaBean
     */
    public static <T> T json2pojo(String jsonStr, Class<T> clazz) throws Exception
    {
        return objectMapper.readValue(jsonStr, clazz);
    }

    /**
     * json string convert to map
     */
    @SuppressWarnings("unchecked")
    public static <T> Map<String, Object> json2map(String jsonStr) throws Exception
    {
        return objectMapper.readValue(jsonStr, Map.class);
    }

    /**
     * json string convert to map with javaBean
     */
    public static <T> Map<String, T> json2map(String jsonStr, Class<T> clazz) throws Exception
    {
        Map<String, Map<String, Object>> map = objectMapper.readValue(jsonStr, new TypeReference<Map<String, T>>()
        {
        });
        Map<String, T> result = new HashMap<String, T>();
        for (Entry<String, Map<String, Object>> entry : map.entrySet())
        {
            result.put(entry.getKey(), map2pojo(entry.getValue(), clazz));
        }
        return result;
    }

    /**
     * json array string convert to list with javaBean
     */
    public static <T> List<T> json2list(String jsonArrayStr, Class<T> clazz) throws Exception
    {
        List<Map<String, Object>> list = objectMapper.readValue(jsonArrayStr, new TypeReference<List<T>>()
        {
        });
        List<T> result = new ArrayList<T>();
        for (Map<String, Object> map : list)
        {
            result.add(map2pojo(map, clazz));
        }
        return result;
    }

    /**
     * map convert to javaBean
     */
    public static <T> T map2pojo(Map<?, ?> map, Class<T> clazz)
    {
        return objectMapper.convertValue(map, clazz);
    }

    // @SuppressWarnings("unchecked")
    // public static <T> T json2Object(String json, Class<T> clazz) {
    // JSONObject jsonObject = JSONObject.fromObject(json);
    // String[] dateFormats = new String[] { "yyyy-MM-dd HH:mm:ss" };
    // JSONUtils.getMorpherRegistry().registerMorpher(new
    // TimestampMorpher(dateFormats));
    // return (T) JSONObject.toBean(jsonObject, clazz);
    // }
    
	/**
	 * @param ob
	 * @return 将从数据库得到的数据 SMS4加密返回字符串
	 */
	public static String returnObjectToSMS4(Object ob)
	{
		String sms4str = "";
		String strJson;
		try
		{
			strJson = obj2json(ob);
			sms4str = SMS4Util.SMS4EncodeStr(strJson);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return sms4str;
		
	}
	
	public static String ReadFile(MultipartFile file) {  
        BufferedReader reader = null;  
        String laststr = "";  
        try{
            InputStreamReader inputStreamReader = new InputStreamReader(file.getInputStream(), "UTF-8");  
            reader = new BufferedReader(inputStreamReader);
            String tempString = null;
            while((tempString = reader.readLine()) != null) {  
                laststr += tempString;
            }  
            reader.close();  
        }catch(IOException e){  
            e.printStackTrace();  
        }finally{  
            if(reader != null) {  
                try {  
                    reader.close();  
                } catch (IOException e) {  
                    e.printStackTrace();  
                }  
            }  
        }  
        return laststr;
    }
}