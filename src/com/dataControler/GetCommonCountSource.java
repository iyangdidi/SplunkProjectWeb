package com.dataControler;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.remoteData.RequestEnum;
import com.remoteData.ResponseCommonCountSource;
import com.toolbean.RequestData;

public class GetCommonCountSource {
	
	public static void main(String[] args){
		GetCommonCountSource.getData();
	}
	
	public static void getData(){
	
		ResponseCommonCountSource data = RequestData.requestCommonCountSource(null,RequestEnum.Request_SourceCount_Ceilometer.getValue());
		HashMap map = data.getMap();
		Iterator iter = map.entrySet().iterator();
		String[] keys = new String[map.size()];
		int[] values = new int[map.size()];
		while(iter.hasNext()){
			Map.Entry<String,Integer> entry = (Map.Entry<String,Integer>)iter.next();
//			keys[i] = entry.getKey();
//			values[i] = entry.getValue();
			System.out.println(entry.getKey()+"   "+entry.getValue());
		}
	}
}
