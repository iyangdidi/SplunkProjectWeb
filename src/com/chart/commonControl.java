package com.chart;

import java.awt.Font;

import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.plot.CategoryPlot;

public class commonControl {
	 /**
     * 解决乱码问题
     */
    public static void setImageFont(JFreeChart chart)
    {
        CategoryPlot plot = (CategoryPlot)chart.getPlot();
        CategoryAxis domainAxis = plot.getDomainAxis();
        ValueAxis numberaxis = plot.getRangeAxis();
        
        //设置标题文字 
        chart.getTitle().setFont(new Font("宋体", Font.BOLD, 12));
        
        //设置X轴坐标上的文字    
        domainAxis.setTickLabelFont(new Font("黑体", Font.PLAIN, 11));
        
        //设置X 轴的标题文字  
        domainAxis.setLabelFont(new Font("宋体", Font.PLAIN, 12));
        
        //设置Y 轴坐标上的文字   
        numberaxis.setTickLabelFont(new Font("sans-serif", Font.PLAIN, 12));
        
        //设置Y 轴的标题文字
        numberaxis.setLabelFont(new Font("黑体", Font.PLAIN, 12));
        
        //设置底部文字 
        chart.getLegend().setItemFont(new Font("宋体", Font.PLAIN, 12));
    }
}
