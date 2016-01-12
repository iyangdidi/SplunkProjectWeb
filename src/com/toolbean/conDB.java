package com.toolbean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class conDB {

	 private String classname = "com.microsoft.sqlserver.jdbc.SQLServerDriver";  //加载JDBC驱动
	 private String url = "jdbc:sqlserver://localhost:1433; DatabaseName=onlineBank";  //连接服务器和数据库test
	 private String userName = "sa";  //默认用户名
	 private String password = "ling520";  //密码
	 private Connection con=null;            
	 private Statement stm=null;  
	
		public conDB()
		{
			
		}
		
		public void conSqlServer(){
			classname = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
			url = "jdbc:sqlserver://localhost:1433; DatabaseName=onlineBank";
			userName = "sa";
			password = "ling520";
			try{
				Class.forName(classname).newInstance();
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("加载sql server数据库驱动失败！！！");
			}
		}
		
		public void conMySql(){
			classname = "com.mysql.jdbc.Driver";
			url = "jdbc:mysql://127.0.0.1:3306/test";
			userName = "root";
			password = "root";
			try{
				Class.forName(classname).newInstance();
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("加载mysql数据库驱动失败！！！");
			}
		}

		public boolean createCon()
		{
			try{
			
				con=DriverManager.getConnection(url,userName,password);
				return true;
			}catch(Exception e)
			{
				e.printStackTrace();
				System.out.println("连接数据库失败！");
				return false;
			}
		}
		
		
		public void getStm()
		{
			createCon();
			try{
				
				stm=con.createStatement();
			}catch(Exception e)
			{
				e.printStackTrace();
				System.out.println("创建statement对象失败!");
			}
		}
		
		/**
		 * 
		 * @param sql
		 * @return boolean
		 */
		public boolean executeUpdate(String sql)
		{
			boolean mark=false;
			try{
				getStm();
			
				int iCount=stm.executeUpdate(sql);
			    if(iCount>0)
			    	mark=true;
			    else
			    	mark=false;
			}catch(Exception e)
			{
			    
				System.out.println("数据库更新失败！");
				e.printStackTrace();
				mark=false;
			}
			return mark;
		}
		
		/**
		 * 
		 * @param sql
		 * @return boolean
		 */
		public ResultSet executeQuery(String sql)
		{
			ResultSet rs=null;
			try{
				getStm();
				try{
					rs=stm.executeQuery(sql);
				}catch(Exception e)
				{
					e.printStackTrace();
					System.out.println("数据库查询失败!");
				}
			}catch(Exception e)
			{
				e.printStackTrace();
			}
			return rs;
		}
}

