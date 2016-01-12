package com.dataControler;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import com.remoteData.*;
import com.servlet.ChartServlet;
import com.toolbean.JsonUtil;
import com.toolbean.RequestData;

public class GetComputerLog {

	public static void main(String[] args){
		//new GetComputerLog().getGraphicData(ComputeEnum.COMPUTE_ERROR);
		getGraphicData(ComputeEnum.COMPUTE_ERROR,"进算计错误类型比例",100,100, null,null,null);
	}
	
	public GetComputerLog(){}
	
	public ResponseGetComputeLog0 getTestData(int computeId){
		ResponseGetComputeLog0 computeLog = new ResponseGetComputeLog0();
		computeLog.setType(1);
		List<ComputeLog> logList = new ArrayList<ComputeLog>();
		for(int i=0; i<20; i++){
			ComputeLog log = new ComputeLog();
			log.setCode(String.valueOf(i));
			log.setDescribe("err"+String.valueOf(i));
			logList.add(log);
		}
		computeLog.setComputeLogLists(logList);
		return computeLog;
		
	}
	
	// 返回所有数据
	public String[][] getDataTable(ComputeEnum computeType){
		String[][] data = null;
		ResponseGetComputeLog0 computeLog = getTestData(computeType.getValue());
		List<ComputeLog> logList = computeLog.getComputeLogLists();
		data = new String[logList.size()][2];
		for(int i=0; i<logList.size(); i++){
			ComputeLog log = logList.get(i);
			data[i][0] = log.getCode();
			data[i][1] = log.getDescribe();
		}
		

		return data;
	}
	// 根据检索条件返回显示数据
	public String[][] getDataTable(String param){
		String[][] data = null;
		return data;
	}
	
	/**
	 * 显示统计图
	 * @param computeType
	 * @param title
	 * @param width
	 * @param height
	 * @param session
	 * @param pw
	 * @return
	 */
	public static String getGraphicData(ComputeEnum computeType,String title,int width ,int height, 
			HttpSession session,PrintWriter pw,String url){
		Object logData = RequestData.requestComputeLog(computeType.getValue());
		ObjectMapper objectMapper = new ObjectMapper();
		ResponseGetComputeLog log=null;
		try {
			log = objectMapper.readValue(JsonUtil.toJson(logData),ResponseGetComputeLog.class);
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
		
		String filename=null;
		if(log!=null){
			HashMap map = log.getMap();
			Iterator iter = map.entrySet().iterator();
			String[] keys = new String[map.size()];
			double[] values = new double[map.size()];
			System.out.println(map.size());
			int i=0;
			while(iter.hasNext()){
				Map.Entry<String,String> entry = (Map.Entry<String,String>)iter.next();
				
				keys[i] = entry.getKey();
				values[i] = Integer.parseInt(entry.getValue());
				i++;
			}
			
			filename = ChartServlet.generatePieChart(title,width,height, session, pw,keys,values,url);
		}
		return filename;
	}
	
}
