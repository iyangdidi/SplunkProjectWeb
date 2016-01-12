package com.toolbean;

import java.io.IOException;


import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import com.remoteData.ComputeEnum;
import com.remoteData.ComputeLog;
import com.remoteData.RequestCommon;
import com.remoteData.RequestEnum;
import com.remoteData.RequestGetComputeLog;
import com.remoteData.ResponseCommonCountSource;
import com.remoteData.ResponseData;
import com.remoteData.ResponseGetComputeLog0;
import com.remoteData.ResponseGetEvent;
import com.remoteData.ResponseGetRawData;
import com.remoteData.ResponseGetComputeLog;

public class RequestData {
	
	static String ip = "http://166.111.81.140:8080";
	
	public RequestData(){
		
	}
	
	public static void main(String[] args){
		
	}
	
	
	
	/**
	 * 获取所有机器列表
	 * @return
	 */
	public static ResponseGetEvent requestEvent(String param,int request_id){
		RequestCommon request = new RequestCommon();
		request.setRequest_id(request_id);
		request.setKeyword(param);;
    	String url =ip+"/banana/splunk/getEvent";
    	Object value=requestRemoteData(request,url);
    	ObjectMapper objectMapper = new ObjectMapper();
    	ResponseGetEvent log=null; 
		try {
			log = objectMapper.readValue(JsonUtil.toJson(value),ResponseGetEvent.class);
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return log;

	}
	
	/**
	 * 获取所有机器列表
	 * @return
	 */
	public static ResponseCommonCountSource requestGetGroup(String param,int request_id){
		RequestCommon request = new RequestCommon();
		request.setRequest_id(request_id);
		request.setKeyword(param);;
    	String url =ip+"/banana/splunk/getGroup";
    	Object value=requestRemoteData(request,url);
    	ObjectMapper objectMapper = new ObjectMapper();
    	ResponseCommonCountSource log=null; 
		try {
			log = objectMapper.readValue(JsonUtil.toJson(value),ResponseCommonCountSource.class);
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return log;

	}
	
	
	/**
	 * 通过源信息获取源相关的所有原生数据
	 * @param param
	 * @return
	 */
	public static ResponseGetRawData requestRawData(String param,int request_id){
		RequestCommon request = new RequestCommon();
		request.setRequest_id(request_id);
		request.setKeyword(param);;
    	String url =ip+"/banana/splunk/getRawData";
    	Object value=requestRemoteData(request,url);
    	ObjectMapper objectMapper = new ObjectMapper();
    	ResponseGetRawData log=null; 
		try {
			log = objectMapper.readValue(JsonUtil.toJson(value),ResponseGetRawData.class);
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return log;

	}
	
	/**
	 * 通过源信息获取源相关的所有原生数据
	 * @param param
	 * @return
	 */
	public static ResponseGetRawData requestRawDataBySource(String param,int request_id){
		RequestCommon request = new RequestCommon();
		request.setRequest_id(request_id);
		request.setKeyword(param);;
    	String url =ip+"/banana/splunk/getRawDataBySource";
    	Object value=requestRemoteData(request,url);
    	ObjectMapper objectMapper = new ObjectMapper();
    	ResponseGetRawData log=null; 
		try {
			log = objectMapper.readValue(JsonUtil.toJson(value),ResponseGetRawData.class);
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return log;

	}
	
	/**
	 * 获取不同文件夹下的源信息
	 * @return
	 */
	public static ResponseCommonCountSource requestCommonCountSource(String param,int request_id){
		RequestCommon request = new RequestCommon();
		request.setRequest_id(request_id);
		request.setKeyword(param);
    	String url =ip+"/banana/splunk/getCommonCountSource";
    	Object value=requestRemoteData(request,url);
    	ObjectMapper objectMapper = new ObjectMapper();
    	ResponseCommonCountSource log=null; 
		try {
			log = objectMapper.readValue(JsonUtil.toJson(value),ResponseCommonCountSource.class);
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return log;

	}
	
	/**
	 * 获取计算机日子类型统计列表
	 * @param computeType
	 * @return
	 */
	public static  ResponseGetComputeLog requestComputeLog2(int computeType){
		
		RequestGetComputeLog request = new RequestGetComputeLog();
		request.setCompute_type(computeType);
    	//String url ="http://166.111.81.135:8080/banana/splunk/getComputeLog2";
		String url =ip+"/banana/test/getComputeLog2";
		Object value=requestRemoteData(request,url);
    	ObjectMapper objectMapper = new ObjectMapper();
    	ResponseGetComputeLog log=null; 
		try {
			log = objectMapper.readValue(JsonUtil.toJson(value),ResponseGetComputeLog.class);
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return log;
	}

	/**
	 * 获取计算机日子类型统计列表
	 * @param computeType
	 * @return
	 */
	public static  Object requestComputeLog(int computeType){
		
		RequestGetComputeLog request2 = new RequestGetComputeLog();
		request2.setCompute_type(computeType);
		ResponseData logData=null;
		//data : {"value":{"type":0,"computeLogLists":null},"errorCode":null,"depreciated":false}
		//发网络请求
		ObjectMapper objectMapper = new ObjectMapper();
		String url =ip+"/banana/splunk/getComputeLog2";
    	String result;
    	String param = null;
		try {
			param = objectMapper.writeValueAsString(request2);
			result = PostAndGet.sendPost(url, param); 
			System.out.println(result);
			logData= objectMapper.readValue(result, ResponseData.class);
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
		if(logData == null)
			return null;
		else{
			return logData.getValue();
		}
	}
	
	/**
	 * 基本调用，根据请求从对应url上请求数据
	 * @param request
	 * @param url
	 * @return
	 */
	public static Object requestRemoteData(Object request,String url){
		
		ResponseData respondData=null;
		//发网络请求
		ObjectMapper objectMapper = new ObjectMapper();
    	String result;
    	String param = null;
		try {
			param = objectMapper.writeValueAsString(request);
			result = PostAndGet.sendPost(url, param); 
			
			System.out.println(result);
			
			respondData = objectMapper.readValue(result, ResponseData.class);
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
		
		if(respondData == null)
			return null;
		else{
			return respondData.getValue();
		}
	}
	
}
