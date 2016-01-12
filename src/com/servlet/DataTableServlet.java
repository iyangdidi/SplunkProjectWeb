package com.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.toolbean.conDB;

public class DataTableServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private int testnum = 0;
    String[][] ddwhoneList=null;
    
    //设置每张网页显示三笔记录(每页显示的记录数)
    int PageSize=8;
    //设置欲显示的页数(初始页)
    int ShowPage=1;
    //ResultSet的记录笔数(总记录数)
    int RowCount=0;
    //ResultSet分页后的总数(总页数)
    int PageCount=0;
    
    protected void doPost(HttpServletRequest request,HttpServletResponse response)
    		throws ServletException,IOException{
    			String action=request.getParameter("action");
    			if(action == null || action.equals("load") == false)
    				reactPaging(request,response);
    			else
    				loadData(request,response);
    		}
    public void reactPaging(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
    	String action=request.getParameter("action");
		
    	if(action == null)
		{
			ShowPage = Integer.parseInt(request.getParameter("go"));
		}else{
	    	if(action.equals("next"))
			{
				
				ShowPage = ShowPage + 1 ;
			}
	    	else if(action.equals("up"))
			{
				ShowPage = ShowPage - 1;
			}
	    	else if(action.equals("first"))
			{
				ShowPage = 1;
			}
	    	else if(action.equals("last"))
			{
				ShowPage = PageCount;
			}
		}
		
		int size;
		if(ShowPage == PageCount)
			size = RowCount - (PageSize*(PageCount-1));
		else
			size = PageSize;
		String[][] showData = getDataToShow(ShowPage,size);     
        request.setAttribute("ddwhoneList", showData);
        request.setAttribute("showPage", ShowPage);
        request.setAttribute("pageCount", PageCount);
       
        request.getRequestDispatcher("/testPage/table_dadiweihong.jsp").forward(request, response);
    }
    	
    public void loadData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        conDB DB = new conDB();
        DB.conMySql();
        ResultSet rs = DB.executeQuery("select * from users");
        
       
        //将指标移至最后一条记录
        try{
        	rs.last();            
        	System.out.println("数据大小！！"+rs.getRow());
        	RowCount = rs.getRow();
        	ddwhoneList = new String[rs.getRow()][4];
        	rs.absolute(1); 
        	int i=0;
	        while(rs.next()){
	        	ddwhoneList[i][0] = rs.getString("id");
	        	ddwhoneList[i][1] = rs.getString("username");
	        	ddwhoneList[i][2] = rs.getString("password");
	        	ddwhoneList[i][3] = rs.getString("name");
	        	i++;
	        	
	        }
	      //计算显示的页数(关键)
	      PageCount=((RowCount%PageSize)==0?(RowCount/PageSize):(RowCount/PageSize)+1);
	      System.out.println("总共有多少页："+PageCount);
	    }catch(Exception e){
	        	e.printStackTrace();
        }
        
        String[][] showData = getDataToShow(ShowPage,PageSize);     
        request.setAttribute("ddwhoneList", showData);
        request.setAttribute("showPage", ShowPage);
        request.setAttribute("pageCount", PageCount);
       
        request.getRequestDispatcher("/testPage/table_dadiweihong.jsp").forward(request, response);

    }
    protected String[][] getDataToShow(int fromIndex,int size)
    {
    	String[][] showData = new String[size][4];
    	for(int i=0; i<size; i++){
    		showData[i][0] = ddwhoneList[fromIndex+i][0];
    		showData[i][1] = ddwhoneList[fromIndex+i][1];
    		showData[i][2] = ddwhoneList[fromIndex+i][2];
    		showData[i][3] = ddwhoneList[fromIndex+i][3];
    	}
    	return showData;
    }
 
    protected void doGet(HttpServletRequest request,HttpServletResponse response)
    		throws ServletException,IOException{
    			doPost(request,response);
    		}
}
