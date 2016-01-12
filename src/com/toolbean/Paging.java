package com.toolbean;

import com.dataControler.GetComputerLog;
import com.remoteData.ComputeEnum;

public class Paging {
	private int listRow;
    private int listCol;
    private String[][] logList=null;
    private int PageSize=8;		// 每页显示记录数
    private int ShowPage=1;		// 显示第几页，初始显示第1页
    private int PageCount=0;	// 分页后的总数(总页数)
    
    
    public int getListRow() {
		return listRow;
	}

	public int getListCol() {
		return listCol;
	}

	public String[][] getLogList() {
		return logList;
	}

	public int getPageSize() {
		return PageSize;
	}

	public int getShowPage() {
		return ShowPage;
	}

	public int getPageCount() {
		return PageCount;
	}
	
    public Paging(){}
    
    /**
     * 第一次加载数据
     * @param id
     * @return
     */
    public String[][] loadData(int id){
    	String[][] showData=null;
    	switch(id){
    		case 1:
    			//计算机日志
    			logList = new GetComputerLog().getDataTable(ComputeEnum.COMPUTE_ERROR);
    			if(logList!=null){
	    			listRow = logList.length;
	    			listCol = logList[0].length;
	    			//计算显示的页数(关键)
	    		    PageCount=((listRow%PageSize)==0?(listRow/PageSize):(listRow/PageSize)+1);
	    		    showData = getDataToShow(ShowPage,PageSize);
    			}
    			break;
    		case 2:
    			break;
    		default:
    			break;
    	}
    	return showData;
    }
    
    /**
     * 对页面请求进行操作
     * @param action
     * @param goPage
     * @return
     */
    public String[][] reactPaging(String action,String goPage){
        
    	if(action.equals("go"))
		{
			ShowPage = Integer.parseInt(goPage);
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
			size = listRow - (PageSize*(PageCount-1));
		else
			size = PageSize;
		
		int formIndex =  (ShowPage-1)*PageSize; 
		String[][] showData = getDataToShow(formIndex,size);     
       
		return showData;
    }
    
    /**
     * 获取分页数据
     * 
     * @param fromIndex
     * @param size
     * @return
     */
    protected String[][] getDataToShow(int fromIndex,int size)
    {
    	String[][] showData = new String[size][4];
    	for(int i=0; i<size; i++){
    		for(int j=0; j<listCol; j++){
    			showData[i][j] = logList[fromIndex+i][j];
    		}
    	}
    	return showData;
    }
}
