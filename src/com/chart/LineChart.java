package com.chart;

import java.util.List;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;

public class LineChart {
	  public JFreeChart generateLineChart(String lineName, String xName, String yName,List<String[]> data){
	       
	    	CategoryDataset linedataset = this.getDataSet(data);

	        JFreeChart chart = ChartFactory.createLineChart(lineName, // chart title
	                xName, // domain axis label
	                yName, // range axis label
	                linedataset, // data
	                PlotOrientation.VERTICAL, // orientation
	                true, // include legend
	                true, // tooltips
	                false // urls
	                );
	        commonControl.setImageFont(chart);
	        CategoryPlot line = chart.getCategoryPlot();
	        // customise the range axis...
	        NumberAxis rangeAxis = (NumberAxis) line.getRangeAxis();
	        rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
	        rangeAxis.setAutoRangeIncludesZero(true);
	        rangeAxis.setUpperMargin(0.20);
	        rangeAxis.setLabelAngle(Math.PI / 2.0);
	        line.setRangeAxis(rangeAxis);
	        
	        return chart;
	    }
	    
	  //构建数据
	  private CategoryDataset getDataSet(List<String[]> data){
	        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
	        for(String[] ss : data){
	            dataset.addValue(Double.valueOf(ss[0]), ss[1], ss[2]);
	        }
	        return dataset;
	  }
}
