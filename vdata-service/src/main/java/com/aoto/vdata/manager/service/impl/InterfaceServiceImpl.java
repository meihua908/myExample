package com.aoto.vdata.manager.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aoto.framework.commons.constant.BeanProperty.Bean;
import com.aoto.framework.commons.pagination.PagingCriteria;
import com.aoto.framework.commons.userdetails.CurrentUserHolder;
import com.aoto.vdata.manager.model.InterfaceModel;
import com.aoto.vdata.manager.model.KeywordQuery;
import com.aoto.vdata.manager.model.ParamItemModel;
import com.aoto.vdata.manager.model.ParamModel;
import com.aoto.vdata.manager.persistence.inf.InterfaceMapper;
import com.aoto.vdata.manager.persistence.inf.ParamItemMapper;
import com.aoto.vdata.manager.persistence.inf.ParamMapper;
import com.aoto.vdata.manager.service.inf.InterfaceService;
import com.aoto.vdata.util.TimeUtil;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/**
 * @ClassName: InterfaceServiceImpl
 * @Description: 接口维护
 * @author liuy08
 * @date 2018-05-21 上午10:00:00
 * 
 */

@Service
public class InterfaceServiceImpl implements InterfaceService  {
	
	String now = TimeUtil.getThisTime();

	@Autowired
	private InterfaceMapper interfaceMapper;

	@Autowired
	private ParamMapper paramMapper;

	@Autowired
	private ParamItemMapper paramItemMapper;
	
	Gson gson = new Gson();

	@Override
	public List<Map<String, Object>> getInterfaceByPage(PagingCriteria pagingCriteria, KeywordQuery model) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(Bean.PAGING, pagingCriteria);
        map.put("keyword", model.getKeyword());
        List<Map<String, Object>> resultMapList = interfaceMapper.selectInterfaceByPage(map);
        return resultMapList;
	}
	
	@Override
	public List<Map<String, Object>> showInterface(int interfaceId) {
        return paramMapper.selectParamByInterfaceId(interfaceId);
	}
	
	@Override
	public Map<String, Object> importInterface(String data) {
		Map<String, Object> map = new HashMap<String, Object>();
		int createdBy = CurrentUserHolder.getCurrentUser().getUserId();
		int interfaceId = 0, paramId = 0;
		JsonParser parser = new JsonParser();
		JsonArray jarray1 = parser.parse(data).getAsJsonArray();
		for(int i = 0; i < jarray1.size(); i++) {
			JsonObject json1 = jarray1.get(i).getAsJsonObject();
			InterfaceModel interfaceModel = gson.fromJson(json1, InterfaceModel.class);
			interfaceModel.setCreatedBy(String.valueOf(createdBy));
			interfaceId = addInterface(interfaceModel);
			if(0 != interfaceId) {
				interfaceModel.setInterfaceId(interfaceId);
				paramItemMapper.deleteParamItemByParam(interfaceId);
				paramMapper.deleteParamByInterface(interfaceId);
				paramMapper.deleteConnectByInterface(interfaceId);
				if(null != json1.getAsJsonArray("param")) {
					JsonArray jarray2 = json1.getAsJsonArray("param");
					for(int j = 0; j < jarray2.size(); j++) {
						JsonObject json2 = jarray2.get(j).getAsJsonObject();
						ParamModel param = gson.fromJson(json2, ParamModel.class);
						param.setInterfaceId(interfaceModel.getInterfaceId());
						param.setCreatedBy(String.valueOf(createdBy));
						paramId = addParam(param);
						if(0 != paramId) {
							param.setParamId(paramId);
							if("1".equals(json2.get("paramType").getAsString())) {
								JsonArray jarray3 = json2.getAsJsonArray("paramItem");
								for(int k = 0; k < jarray3.size(); k++) {
									JsonObject json3 = jarray3.get(k).getAsJsonObject();
									ParamItemModel paramItem = gson.fromJson(json3, ParamItemModel.class);
									paramItem.setParamId(param.getParamId());
									paramItem.setCreatedBy(String.valueOf(createdBy));
									addParamItem(paramItem);
								}
							}
						}else {
							map.put("returnCode", "-1");
							return map;
						}
					}
				}
			}else {
				map.put("returnCode", "-1");
				return map;
			}
		}
		map.put("returnCode", "200");
        return map;
	}

	@Override
	public int removeInterface(List<String> list) {
		int i = 0;
		int createdBy = CurrentUserHolder.getCurrentUser().getUserId();
		if(0 < list.size()) {
			for(String data : list) {
				int interfaceId = Integer.parseInt(data);
				paramItemMapper.deleteParamItemByParam(interfaceId);
				paramMapper.deleteParamByInterface(interfaceId);
				paramMapper.deleteConnectByInterface(interfaceId);
				interfaceMapper.deleteInterfaceComp(interfaceId);
				int j = interfaceMapper.updateInterfaceStatus(interfaceId, createdBy);
				if(0 < j) {
					i++;
				}
			}
		}
		return i;
	}

	@Override
	public int addInterface(InterfaceModel interfaceModel) {
		Map<String, Object> map = new HashMap<String, Object>();
		int interfaceId = 0, i = 0;
		map.put("pk_interfaceId", 0);
		map.put("interfaceId", 0);
		map.put("interfaceNo", interfaceModel.getInterfaceNo());
		map.put("interfaceName", interfaceModel.getInterfaceName());
		map.put("interfaceWay", interfaceModel.getInterfaceWay());
		map.put("interfaceUrl", interfaceModel.getInterfaceUrl());
		map.put("remark", interfaceModel.getRemark());
		map.put("createdBy", interfaceModel.getCreatedBy());
		map.put("createdDate", now);
		interfaceModel.setLastUpdatedBy(interfaceModel.getCreatedBy());
		interfaceModel.setLastUpdatedDate(now);
		String oldInterfaceId = interfaceMapper.selectIdByNo(interfaceModel.getInterfaceNo());
		if(null != oldInterfaceId) {
			interfaceModel.setInterfaceId(Integer.parseInt(oldInterfaceId));
			i = interfaceMapper.updateInterface(interfaceModel);
			interfaceId = Integer.parseInt(oldInterfaceId);
		}else {
			i = interfaceMapper.insertInterface(map);
			if(0 != i) {
				interfaceId = Integer.parseInt(map.get("interfaceId").toString());
			}
		}
		return interfaceId;
	}

	@Override
	public int addParam(ParamModel param) {
		Map<String, Object> map = new HashMap<String, Object>();
		int paramId = 0;
		map.put("pk_paramId", 0);
		map.put("paramId", 0);
		map.put("paramMark", param.getParamMark());
		map.put("paramName", param.getParamName());
		map.put("paramType", param.getParamType());
		map.put("paramDefault", param.getParamDefault());
		map.put("remark", param.getRemark());
		map.put("createdBy", param.getCreatedBy());
		map.put("createdDate", now);
		int i = paramMapper.insertParam(map);
		if(0 != i) {
			paramId = Integer.parseInt(map.get("paramId").toString());
			map.clear();
			map.put("pk_interfaceParamId", 0);
			map.put("interfaceParamId", 0);
			map.put("interfaceId", param.getInterfaceId());
			map.put("paramId", paramId);
			paramMapper.insertConnect(map);
		}
		return paramId;
	}

	@Override
	public void addParamItem(ParamItemModel paramItem) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pk_paramItemId", 0);
		map.put("paramItemId", 0);
		map.put("paramId", paramItem.getParamId());
		map.put("paramItemName", paramItem.getParamItemName());
		map.put("paramItemValue", paramItem.getParamItemValue());
		map.put("paramItemOrder", paramItem.getParamItemOrder());
		map.put("createdBy", paramItem.getCreatedBy());
		map.put("createdDate", now);
		paramItemMapper.insertParamItem(map);
	}
	
	@Override
	public int bindComponent(int interfaceId, List<Integer> list) {
		int i = 0;
        for(int componentId : list) {
        	int j = interfaceMapper.insertInterfaceComp(interfaceId, componentId);
        	if(0 < j) {
        		i++;
        	}
        }
        return i;
	}
	
	@Override
	public int unbindComponent(List<Integer> list) {
		int i = 0;
        for(int interfaceId : list) {
        	int j = interfaceMapper.deleteInterfaceComp(interfaceId);
        	if(0 < j) {
        		i++;
        	}
        }
        return i;
	}
}
