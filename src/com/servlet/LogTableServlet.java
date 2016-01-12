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

import com.toolbean.Paging;


public class LogTableServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    Paging paging = new Paging();
    String logId = "1";
    
    protected void doPost(HttpServletRequest request,HttpServletResponse response)
    		throws ServletException,IOException{
    			String action=request.getParameter("action");
    			if(action.equals("load")){
    				//首次加载数据
    				String[][] showData = paging.loadData(Integer.parseInt(logId));
    			    request.setAttribute("logList", showData);
    			    request.setAttribute("showPage", paging.getShowPage());
    			    request.setAttribute("pageCount", paging.getPageCount());
    			    request.getRequestDispatcher("/dataTable/computerLogTable.jsp").forward(request, response);
    			    
    			}else{
    				//分页或跳转
    				String goPage=request.getParameter("go");
    				String[][] showData = paging.reactPaging(action, goPage);    
    		        request.setAttribute("logList", showData);
    		        request.setAttribute("showPage", paging.getShowPage());
    		        request.setAttribute("pageCount", paging.getPageCount());
    		        request.getRequestDispatcher("/dataTable/computerLogTable.jsp").forward(request, response);
    			}
    		}
    
    protected void doGet(HttpServletRequest request,HttpServletResponse response)
    		throws ServletException,IOException{
    			doPost(request,response);
    		}
}
