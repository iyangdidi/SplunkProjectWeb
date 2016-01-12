package com.dataControler;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import com.remoteData.ComputeEnum;
import com.remoteData.ResponseGetComputeLog;
import com.servlet.ChartServlet;
import com.toolbean.JsonUtil;
import com.toolbean.RequestData;

public class GetMachineInfo {

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
	public static String geLineChartData(ComputeEnum computeType,String title,int width ,int height, 
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
