package com.remoteData;

import java.util.List;

public class ResponseGetRawData {
	
	int total;
	List<String> rawDatas;

	public List<String> getRawDatas() {
		return rawDatas;
	}

	public void setRawDatas(List<String> rawDatas) {
		this.rawDatas = rawDatas;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}
}
