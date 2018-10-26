package com.aoto.vdata.manager.service.impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.aoto.framework.commons.constant.BeanProperty.Bean;
import com.aoto.framework.commons.pagination.PagingCriteria;
import com.aoto.framework.commons.userdetails.CurrentUserHolder;
import com.aoto.vdata.manager.model.ComponentModel;
import com.aoto.vdata.manager.model.KeywordQuery;
import com.aoto.vdata.manager.persistence.inf.ComponentMapper;
import com.aoto.vdata.manager.service.inf.ComponentService;
import com.aoto.vdata.util.JsonUtil;
import com.aoto.vdata.util.TimeUtil;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/**
 * @ClassName: ComponentServiceImpl
 * @Description: 组件维护
 * @author liuy08
 * @date 2018-05-21 上午10:00:00
 * 
 */

@Service
public class ComponentServiceImpl implements ComponentService  {

	String now = TimeUtil.getThisTime();

	@Autowired
	private ComponentMapper componentMapper;

	@Value("${resourcePic}")
	private String resourcePic;

	@Value("${localResourcePic}")
	private String localResourcePic;

	@Value("${system}")
	private String system;

	@Override
	public List<Map<String, Object>> getComponentByPage(PagingCriteria pagingCriteria, KeywordQuery model) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(Bean.PAGING, pagingCriteria);
        map.put("keyword", model.getKeyword());
        List<Map<String, Object>> resultMapList = componentMapper.selectComponentByPage(map);
        return resultMapList;
	}
	
	@Override
	public ComponentModel upload(List<MultipartFile> files) {
		ComponentModel component = new ComponentModel();
		File newFile = null;
		String saveDir = null, saveDirServer = null;
		try {
	        for(MultipartFile file1 : files) {
        		if(!file1.isEmpty()) {
					String originalFilename = file1.getOriginalFilename();
        			if("json".equals(originalFilename.substring(originalFilename.lastIndexOf(".") + 1))) {
        				String jsonContext = JsonUtil.ReadFile(file1);
        				JsonObject json = new JsonParser().parse(jsonContext).getAsJsonObject();
        				component.setComponentNo(json.get("componentNo").getAsString());
        				component.setComponentName(json.get("componentName").getAsString());
        				component.setComponentType(json.get("componentType").getAsString());
        				component.setRemark(null == json.get("remark") ? null : json.get("remark").getAsString());
        				saveDir = localResourcePic + "\\component\\" +component.getComponentNo() + "\\";
        				saveDirServer = "/component/" + component.getComponentNo() + "/" + component.getComponentType() + "/";
        				//String saveDirServer = "\\home\\weblogic\\docProduct\\" + custId + "\\Thumb\\";
        				if("Linux".equals(system)) {
        					saveDir = localResourcePic + "/component/"+ component.getComponentNo() + "/";
        				}
        				component.setCompPath(saveDirServer);
        			}
        		}
	        }

	        File beforeDeletePath = new File(saveDir);
	        if (beforeDeletePath.exists()) {
	        	FileUtils.deleteDirectory(beforeDeletePath);
	        }
			for(MultipartFile file1 : files) {
        		if(!file1.isEmpty()) {
    	        	CommonsMultipartFile file2 = (CommonsMultipartFile)file1;   
    	        	DiskFileItem fileItem = (DiskFileItem)file2.getFileItem();  
    	        	String originalFilename = fileItem.getName();
	    			if(null != file1 && null != originalFilename && 0 < originalFilename.length()) {
						newFile = new File(saveDir + originalFilename);
						if (!newFile.getParentFile().exists()) {
							newFile.getParentFile().mkdirs();
						}
						file1.transferTo(newFile);
	    			}
        		}
	        }
		}catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return component;
	}
 
	@Override
	public Map<String, Object> addComponent(ComponentModel component) {
		int createdBy = CurrentUserHolder.getCurrentUser().getUserId();
		Map<String, Object> map1 = new HashMap<String, Object>();
		Map<String, Object> map2 = new HashMap<String, Object>();
		map1.put("pk_componentId", 0);
		map1.put("componentId", 0);
		map1.put("componentNo", component.getComponentNo());
		map1.put("componentName", component.getComponentName());
		map1.put("componentType", component.getComponentType());
		map1.put("remark", component.getRemark());
		map1.put("compPath", component.getCompPath());
		map1.put("createdBy", String.valueOf(createdBy));
		map1.put("createdDate", now);
		map1.put("lastUpdatedBy", String.valueOf(createdBy));
		map1.put("lastUpdatedDate", now);
		component.setLastUpdatedBy(String.valueOf(createdBy));
		component.setLastUpdatedDate(now);
		
		try {
			String a = componentMapper.selectIdByNo(component.getComponentNo());
			int j = 0;
			if(null == a) {
		        j = componentMapper.insertComponent(map1);
			}else {
				component.setComponentId(Integer.parseInt(a));
				j = componentMapper.updateComponent(component);
		    }
			map2.put("returnCode", "200");

			if(1 != j) {
				map2.put("returnCode", "101");
			}
		}catch(Exception e) {
			map2.put("returnCode", "101");
		}
        return map2;
	}

	@Override
	public int removeComponent(List<String> list) {
		int lastUpdatedBy = CurrentUserHolder.getCurrentUser().getUserId();
		int i = 0;
		String path = "";
		try {
			if(0 < list.size()) {
				for(String componentId : list) {
					if("Linux".equals(system)){
						path = localResourcePic +"/" + "component" +"/"+ componentMapper.selectNoById(Integer.parseInt(componentId));
					}else{
						path = localResourcePic + "\\component\\" + componentMapper.selectNoById(Integer.parseInt(componentId));
					}
			        File beforeDeletePath = new File(path);
			        if (beforeDeletePath.exists()) {
			        	FileUtils.deleteDirectory(beforeDeletePath);
			        }
					int j = componentMapper.updateComponentStatus(componentId, lastUpdatedBy, now);
					if(0 < j) {
						i++;
					}
				}
			}
		}catch(Exception e) {
			i = -1;
		}
		return i;
	}
	
	@Override
	public String getComponentPath(String componentId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("componentId", componentId);
		return (resourcePic + componentMapper.selectComponentPath(Integer.parseInt(componentId)));
	}

}
