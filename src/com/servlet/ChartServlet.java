package com.servlet;

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
import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.entity.StandardEntityCollection;
import org.jfree.chart.servlet.ServletUtilities;

import com.chart.BarChart;
import com.chart.LineChart;
import com.chart.PieChart;
import com.remoteData.ComputeEnum;
import com.remoteData.ResponseGetComputeLog;
import com.toolbean.JsonUtil;
import com.toolbean.RequestData;

public class ChartServlet {
	
	static String  errFileName = "public_error_500x300.png";
	
	/**
	 * 柱形图
	 * @param title
	 * @param width
	 * @param height
	 * @param session
	 * @param pw
	 * @return
	 */
	public static String generateBarChart(String title, int width ,int height, HttpSession session,PrintWriter pw){
		double[][] data = new double[][] {{1230,1110,1120,1210}, {720,750,860,800}, {830,780,790,700,}, {400,380,390,450}};  
		String[] rowKeys = {"苹果", "香蕉", "橘子", "梨子"};  
		String[] columnKeys = {"鹤壁","西安","深圳","北京"};  
		String filename = null;
		try {
			   
			JFreeChart chart = new BarChart().generateChart(title, "水果","销量", data,rowKeys, columnKeys);
			if(chart != null){
				 //把生成的图片放到临时目录
	            ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
	            //500是图片长度，300是图片高度
	            filename = ServletUtilities.saveChartAsPNG(chart, width, height, info,session);
	            ChartUtilities.writeImageMap(pw, filename, info, false);
	            pw.flush();
			}else{
				System.out.println("获取柱形图失败");
			}
			
		}catch(Exception e){
			e.printStackTrace();
			filename = errFileName;
		}
		
		return filename;
	}
	
	/**
	 * 饼图
	 * @param title
	 * @param session
	 * @param pw
	 * @return
	 */
	public static String generatePieChart(String title,int width ,int height, 
			HttpSession session,PrintWriter pw) {
		String[] keys = {"一月","二月","三月"};
		double[] values = {500,580,828};
		
		String filename = null;
		try {
			PieChart pieChart = new PieChart();
			JFreeChart chart = pieChart.generateChart(title,keys,values);
			pieChart.setURL(chart,"");
			//把生成的图片放到临时目录
			ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
			//500是图片长度，300是图片高度
			filename = ServletUtilities.saveChartAsPNG(chart, width, height, info,session);
			ChartUtilities.writeImageMap(pw, filename, info, false);
			pw.flush();
		} catch (Exception e) {
			System.out.println("Exception - " + e.toString());
			e.printStackTrace(System.out);
			filename = errFileName;
		}
		return filename;
	 }
	
	public static String generatePieChart(String title,int width ,int height, 
			HttpSession session,PrintWriter pw,String[] keys,double[] values,String url) {
//		String[] keys = {"一月","二月","三月"};
//		double[] values = {500,580,828};
		
		String filename = null;
		try {
			PieChart pieChart = new PieChart();
			JFreeChart chart = pieChart.generateChart(title,keys,values);
			pieChart.setURL(chart,url);
			//把生成的图片放到临时目录
			ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
			//500是图片长度，300是图片高度
			filename = ServletUtilities.saveChartAsPNG(chart, width, height, info,session);
			ChartUtilities.writeImageMap(pw, filename, info, false);
			pw.flush();
		} catch (Exception e) {
			System.out.println("Exception - " + e.toString());
			e.printStackTrace(System.out);
			filename = errFileName;
		}
		return filename;
	 }
	
	
	 /** 
     * 生成折线图
     */
    public static String generateLineChart(String lineName, String xName, String yName ,int width ,int height,
    		HttpSession session,PrintWriter pw) {
        
        List<String[]> data = dateList2();
        
        JFreeChart chart = new LineChart().generateLineChart(lineName, xName, yName,data);
        String filename=null;
        try {
	        //生成图片
	        filename = ServletUtilities.saveChartAsPNG(chart, width, height, null, session);
	        //把生成的图片放到临时目录
	        ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
	        ChartUtilities.writeImageMap(pw, filename, info, false);
	        pw.flush();
        
        }catch(Exception e){
            e.printStackTrace();
            filename = errFileName;
        }
  
        //return imagePath_area;
        return filename;
    }
    
    /** 
     * 生成折线图
     */
    public static String generateLineChart(String lineName, String xName, String yName ,int width ,int height,
    		HttpSession session,PrintWriter pw,List<String[]> data) {
        
       // List<String[]> data = dateList2();
        
        JFreeChart chart = new LineChart().generateLineChart(lineName, xName, yName,data);
        String filename=null;
        try {
	        //生成图片
	        filename = ServletUtilities.saveChartAsPNG(chart, width, height, null, session);
	        //把生成的图片放到临时目录
	        ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
	        ChartUtilities.writeImageMap(pw, filename, info, false);
	        pw.flush();
        
        }catch(Exception e){
            e.printStackTrace();
            filename = errFileName;
        }
  
        //return imagePath_area;
        return filename;
    }
    
  
    /**
     * 折线图的数据格式{y,曲线名称,x}
     * @return
     */
    public static List<String[]> dateList2(){
        List<String[]> list = new ArrayList<String[]>();
        String[] s1 = {"10" ,"北京" ,"2010"};
        String[] s2 = {"15" ,"北京" ,"2011"};
        String[] s3 = {"20" ,"北京" ,"2012"};
        String[] s4 = {"13" ,"北京" ,"2013"};
        String[] s5 = {"17" ,"北京" ,"2014"};
        String[] s6 = {"50" ,"北京" ,"2015"};
        
        list.add(s1);
        list.add(s2);
        list.add(s3);
        list.add(s4);
        list.add(s5);
        list.add(s6);
        
        return list;
    }
    
    /**
     * 折线图的数据格式{y,曲线名称,x}
     * @return
     */
    public static List<String[]> dateList(){
        List<String[]> list = new ArrayList<String[]>();
        String[] s1 = {"10" ,"北京" ,"2010"};
        String[] s2 = {"15" ,"北京" ,"2011"};
        String[] s3 = {"20" ,"北京" ,"2012"};
        String[] s4 = {"13" ,"北京" ,"2013"};
        String[] s5 = {"17" ,"北京" ,"2014"};
        String[] s6 = {"50" ,"北京" ,"2015"};
        
        String[] z1 = {"25" ,"上海" ,"2010"};
        String[] z2 = {"30" ,"上海" ,"2011"};
        String[] z3 = {"5" ,"上海" ,"2012"};
        String[] z4 = {"60" ,"上海" ,"2013"};
        String[] z5 = {"30" ,"上海" ,"2014"};
        String[] z6 = {"0" ,"上海" ,"2015"};
        
        list.add(s1);
        list.add(s2);
        list.add(s3);
        list.add(s4);
        list.add(s5);
        list.add(s6);
        
        list.add(z1);
        list.add(z2);
        list.add(z3);
        list.add(z4);
        list.add(z5);
        list.add(z6);
        
        return list;
    }

}
