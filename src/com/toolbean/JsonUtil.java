package com.toolbean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;



import org.codehaus.jackson.map.ObjectMapper;



/**
 * JSON转换工具类
 */
public class JsonUtil {
	
	private static ObjectMapper objectMapper = new ObjectMapper();

//	/**
//	 * json字符串转换为Map<String,Object>格式
//	 * 
//	 * @param json
//	 * @return
//	 */
//	public static Map<String, Object> transferJson2Map(String json) {
//		if (StringUtils.isBlank(json)) {
//			return new HashMap<String, Object>();
//		}
//		Map<String, Object> result = new JSONDeserializer<Map<String, Object>>().use(null,
//				new HashMap<String, Object>().getClass()).deserialize(json);
//		return result;
//	}

	public static String toJson(Object obj) {
		try {
			return objectMapper.writeValueAsString(obj);
		} catch (Exception e) {
			throw new RuntimeException("OrderRequest.toJson error", e);
		}
	}

//	public static <T> T fromJsonToObject(String body, Class<T> clazz) {
//		if(StringUtil.isEmpty(body)) {
//			return null;
//		}
//		try {
//			objectMapper.configure(Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
//			return objectMapper.readValue(body, clazz);
//		} catch (Exception e) {
//			throw new RuntimeException("OrderRequest.fromJsonToOrderRequest error", e);
//		}
//	}
//	
//	public static <T> T fromJsonToObject(String body, TypeReference<T> typeReference) {
//		if(StringUtil.isEmpty(body)) {
//			return null;
//		}
//		try {
//			objectMapper.configure(Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
//			return objectMapper.readValue(body, typeReference);
//		} catch (Exception e) {
//			throw new RuntimeException("OrderRequest.fromJsonToOrderRequest error", e);
//		}
//	}
//	
//	public static <T> String[] getJsonArray(List<T> list) {
//		if(null == list) {
//			return new String[0];
//		}
//		String[] buffer = new String[list.size()];
//		for(int i = 0; i < list.size(); i ++) {
//			buffer[i] = toJson(list.get(i));
//		}
//		return buffer;
//	}
//	
//	public static <T> List<T> fromJsonToList(List<String> list, Class<T> clazz) {
//		if(null == list || list.isEmpty()) {
//			return null;
//		}
//		List<T> result = new ArrayList<T>();
//		for(String json : list) {
//			result.add(fromJsonToObject(json, clazz));
//		}
//		return result;
//	}
//	
//	public static <T> List<T> fromJsonArrayToObjects(String json, Class<T> clazz) {
//		if(StringUtils.isBlank(json)) {
//			return new ArrayList<T>();
//		}
//        return new JSONDeserializer<List<T>>().use(null, ArrayList.class).use("values", clazz).deserialize(json);
//    }
}
