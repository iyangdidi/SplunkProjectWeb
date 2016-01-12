
	//全选/反选代码
	function selectAll(flag) {
	    var inputs = document.forms[0].elements;
	    //var grid = document.getElementById("GridViewCouplets");
	    //var inputs = grid.elements;
	    for (var i = 0; i < inputs.length; i++)
	        if (inputs[i].type == 'checkbox') {
	            if (!inputs[i].disabled) {
	                if (flag)
	                    inputs[i].checked = true;
	                else
	                    inputs[i].checked = false;
	            }
	        }
    }

    //页面刷新代码
    function myrefresh() {
        window.location.reload();
    }

    //重置
    function clearInfo() {
        
        var table = document.getElementById("inputbox");
        var obj = table.getElementsByTagName("input");
        for (var i = 0; i < obj.length; i++) {
            if (obj[i].type == "text" && obj[i].disabled==false) {
                obj[i].value = "";
            }
        }
        obj = table.getElementsByTagName("textarea");
        for (i = 0; i < obj.length; i++) {
            if (obj[i].disabled == false) {
                obj[i].value = "";
            }
        }
        obj = table.getElementsByTagName("select");
        for (i = 0; i < obj.length; i++) {
            if (obj[i].type == "select-one" && obj[i].disabled == false && obj[i].id!="ddlName1") {
                obj[i].selectedIndex = 0;
            }
        }

        //document.getElementById("btReturn").click(); 
    }

    /*
     *院级（本院教工-外单位-研究生）类型的项目录入表重置
    */
    function clearInfo2() {

        var table = document.getElementById("inputbox");
        var obj = table.getElementsByTagName("input");
        for (var i = 0; i < obj.length; i++) {
            if (obj[i].type == "text" && obj[i].disabled == false) {
                obj[i].value = "";
            }
        }
        obj = table.getElementsByTagName("textarea");
        for (i = 0; i < obj.length; i++) {
            if (obj[i].disabled == false) {
                obj[i].value = "";
            }
        }
        obj = table.getElementsByTagName("select");
        var k = 1;
        var ddl;
        while ((ddl = document.getElementById("ddlDivClass" + k.toString())) != null) {
            ddl.onchange();
            k++;
        }

        for (i = 0; i < obj.length; i++) {
            if (obj[i].type == "select-one" && obj[i].disabled == false && obj[i].id != "ddlName1") {
                obj[i].selectedIndex = 0;
            }
        }
    }
    /*
    *删除成员时给出提醒
    */
    function Selected() {
        var table = document.getElementById("GridView1");
        var checkes = table.getElementsByTagName("input"); 
        for (var i = 0; i < checkes.length; i++) {
            if (checkes[i].type == "checkbox" && checkes[i].checked == true) {
                if (confirm("是否删除所选项？"))
                    return true;
                else
                    return false;
            }
        }
        alert("尚未选择记录！");
        return false;
    }

    
        
