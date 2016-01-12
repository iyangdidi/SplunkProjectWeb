package com.chart;

import java.awt.Color;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.labels.ItemLabelAnchor;
import org.jfree.chart.labels.ItemLabelPosition;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer3D;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.general.DatasetUtilities;
import org.jfree.ui.TextAnchor;

public class BarChart {
	
	public JFreeChart generateChart(String title, String categoryAxisLabel,String valueAxisLabel, 
			double[][] data,String[] rowKeys, String[] columnKeys){
		
	
		JFreeChart chart = null;
		try {
			CategoryDataset dataset = DatasetUtilities.createCategoryDataset(rowKeys, columnKeys, data);   
			  
			chart = ChartFactory.createBarChart3D(title,   
												categoryAxisLabel,  
												valueAxisLabel,  
												dataset,  
												PlotOrientation.VERTICAL,  
												true,  
												true,  
												false);
			commonControl.setImageFont(chart);
			CategoryPlot plot = chart.getCategoryPlot();    
			//设置网格背景颜色  
			plot.setBackgroundPaint(Color.white);  
			//设置网格竖线颜色  
			plot.setDomainGridlinePaint(Color.pink);  
			//设置网格横线颜色  
			plot.setRangeGridlinePaint(Color.pink);  
			  
			//显示每个柱的数值，并修改该数值的字体属性  
			BarRenderer3D renderer = new BarRenderer3D();  
			renderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());  
			renderer.setBaseItemLabelsVisible(true);  
			  
			//默认的数字显示在柱子中，通过如下两句可调整数字的显示  
			//注意：此句很关键，若无此句，那数字的显示会被覆盖，给人数字没有显示出来的问题  
			renderer.setBasePositiveItemLabelPosition(new ItemLabelPosition(ItemLabelAnchor.OUTSIDE12, TextAnchor.BASELINE_LEFT));  
			renderer.setItemLabelAnchorOffset(10D);  
			  
			//设置每个地区所包含的平行柱的之间距离  
			renderer.setItemMargin(0.4);  
			plot.setRenderer(renderer);  
			  
			//设置地区、销量的显示位置  
			//将下方的“肉类”放到上方  
			//plot.setDomainAxisLocation(AxisLocation.TOP_OR_RIGHT);  
			//将默认放在左边的“销量”放到右方  
			//plot.setRangeAxisLocation(AxisLocation.BOTTOM_OR_RIGHT);  
			   
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return chart;
	}
}
