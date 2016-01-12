package com.toolbean;

public class Constants {
	
	public static String URL_Server = "http://166.111.81.135:8080/banana/splunk";
	public static String URL_Test =   "http://166.111.81.135:8080/banana/test";
	//public static String HOST = "host = centos-client01";
	public static String HOST = "node-1.domain.tld";
	//public static String SOURCE = source=/var/log/
	public static String SEARCH_PRE = "search" +" "+ HOST +" "+"source=/var/log/log/";
	//public static String computeLog_search_pre = SEARCH_PRE + "ceilometer/compute.log field4=";
	public static String computeLog_search_pre = "search host=node-1.domain.tld source=/var/log/ceilometer/compute.log";
		
	//对应的监控数据：监控openstack各组件的状态及资源使用情况
	//public static String ceilometer_search_pre = "search host=centos-client01 source = /var/log/log/ceilometer/*";
	public static String search_ceilometer_pre = "search host=node-1.domain.tld source = /var/log/ceilometer/*";
	//存储资源的信息
	//public static String ceph_search_pre = "search host=centos-client01 source = /var/log/log/ceph/*";
	public static String search_ceph_pre = "search host=node-1.domain.tld source = /var/log/ceph/*";
	//网络资源信息
	//public static String neutron_search_pre = "search host=centos-client01 source = /var/log/log/neutron/*";
	public static String search_neutron_pre = "search host=node-1.domain.tld source = /var/log/neutron/*";
	//计算资源的信息
	//public static String nova_search_pre = "search host=centos-client01 source = /var/log/log/nova/*";
	public static String search_nova_pre = "search host=node-1.domain.tld source = /var/log/nova/*";
	//时间信息
	//public static String ntpstats_search_pre = "search host=centos-client01 source = /var/log/log/ntpstats/*";
	public static String search_ntpstats_pre = "search host=node-1.domain.tld source = /var/log/ntpstats/*";
	//虚拟交换机的信息
	//public static String openvswitch_search_pre = "search host=centos-client01 source = /var/log/log/openvswitch/*";
	public static String search_openvswitch_pre = "search host=node-1.domain.tld source = /var/log/openvswitch/*";
	//public static String search_openvswitch_pre = "search host=node-1.domain.tld source = /var/log/openvswitch/*";
	
	public static String count_by_source = " |stats count by source";
	public static String count_total = " |stats count";
	
	public static int PAGE_NUM = 10;
}
