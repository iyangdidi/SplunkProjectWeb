package com.chart;

import org.jfree.chart.JFreeChart;
import org.jfree.chart.labels.StandardPieToolTipGenerator;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.urls.StandardPieURLGenerator;
import org.jfree.data.general.DefaultPieDataset;

public class PieChart {
	 	
	 	public DefaultPieDataset setPieData(String[] key, double[] value){
	    	DefaultPieDataset pieData = new DefaultPieDataset();
	    	for(int i=0; i<key.length; i++){
	    		pieData.setValue(key[i], value[i]);
	    	}
	    	return pieData;
	    }
	    public JFreeChart generateChart(String title,String[] keys,double[] values){
	    	DefaultPieDataset data = setPieData(keys,values);
	    	 //创建chart对象
	        PiePlot plot = new PiePlot(data);
	        plot.setToolTipGenerator(new StandardPieToolTipGenerator());
	        JFreeChart chart = new JFreeChart("", JFreeChart.DEFAULT_TITLE_FONT,
	                                          plot, true);
	        chart.setTitle(title);
	        
	        return chart;
	    }
	    public void  setURL(JFreeChart chart,String url){
	    	PiePlot plot = (PiePlot)chart.getPlot();
	    	plot.setURLGenerator(new StandardPieURLGenerator(url,"section"));
	    }
}
