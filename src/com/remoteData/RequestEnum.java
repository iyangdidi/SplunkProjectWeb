package com.remoteData;

public enum RequestEnum {
	Request_ComputeLog(0,"ComputeLog"),
	Request_SourceCount_Ceilometer(1,"SourceCount_Ceilometer"),//监控openstack各组件的状态及资源使用情况
	Request_SourceCount_Ceph(2,"SourceCount_Ceph"),//存储资源的信息	
	Request_SourceCount_Neutron(3,"SourceCount_Neutron"),//网络资源信息
	Request_SourceCount_Nova(4,"SourceCount_Nova"),//计算资源的信息
	Request_SourceCount_Ntpstats(5,"SourceCount_Ntpstats"),//时间信息
	
	Request_SourceCount_Openvswitch(60,"SourceCount_Openvswitch"),//虚拟交换机的信息	
	Request_Feild1Count_Openvswitch(61,"Feild1Count_Openvswitch"),
	Request_Feild1Count_Raw_Openvswitch(62,"Feild1Count_Openvswitch"),
	Request_Search_Openvswitch(63,"Search_Openvswitch"),
	
	Request_GetEvent_SourceCount(100,"GetEv0ent_SourceCount"),
	
	Request_ComputeLog_Type(1000,"ComputeLog_Type"),
	Request_Search_Ceilometer(1001,"ComputeLog_Search"),
	
	//------------------------------------------------------------------
	//第三方平台相关的请求类型
	Request_GetMachineName(101,"Request_Machine name"),
    Request_GetItemFromDpMachine(102,"GetItemFromDpMachine"),
    Request_GetContentDpMachineAndItem(103,"GetContentDpMachineAndItem"),
    Request_GetAllMachineName(104,"GetAllMachineName");

	
	private int value;
	private String name;
	
	public static String getFlagsName(int flagsId) {
        for (RequestEnum t : RequestEnum.values()) {
            if (t.getValue() == flagsId) {
                return t.getName();
            }
        }
        return null;
    }
	
	private RequestEnum(int value, String name) {
		this.value = value;
		this.name = name;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}