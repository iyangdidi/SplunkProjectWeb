function SelectAll(e)
{
    var table = document.getElementById("gvwInfo"); 
    var checkes =table.getElementsByTagName("input");
    for(var i=0;i<checkes.length;i++)  
    {   
        if(checkes[i].type=="checkbox") 
        {
            checkes[i].checked= e.checked;  
        }
    }
}

function Selected() {
    var table = document.getElementById("gvwInfo");
    var checkes = table.getElementsByTagName("input");
    for(var i=0;i<checkes.length;i++)  
    {   
        if(checkes[i].type=="checkbox"&&checkes[i].checked == true) 
        {
            if(confirm("是否删除所选项？"))
                return true;
            else
                return false; 
        }
    }
    alert("尚未选择记录！"); 
    return false;
}

function clearInfo() {
    var table = document.getElementById("tblInput");
    var obj = table.getElementsByTagName("input");
    for (var i = 0; i < obj.length; i++) {
        if (obj[i].type == "text") {
            obj[i].value = "";
        }
    }
    obj = table.getElementsByTagName("TEXTAREA");
    for (i = 0; i < obj.length; i++) {
        if (obj[i].type == "textarea")
            obj[i].value = "";
    }
    obj = table.getElementsByTagName("select");
    for (i = 0; i < obj.length; i++) {
        if (obj[i].type == "select-one")
            obj[i].selectedIndex = 0;
    }
}

function enableControl() {
    var obj = window.document.forms[0].elements;
    for (var i = 0; i < obj.length; i++) {
        obj[i].disabled = false;
    }
}

function chooseTeacher() {
    var flag = true;
    if (document.getElementById("ddlTeacher").value == "请选择") {
        flag = false;
    }
    return flag;
}

//正整数
function IsPositiveInteger(id) {
    if (!(/^[0-9]*[1-9][0-9]*$/.test(document.getElementById(id).value.replace(/[ ]/g, ""))))
        return false;
    else
        return true;
}
//非负整数
function IsNonnegativeInteger(id) {
    if (!(/^[1-9]d*|0$/.test(document.getElementById(id).value.replace(/[ ]/g, ""))))
        return false;
    else
        return true;
}
function IsNotNull(id) {
    if (document.getElementById(id).value.replace(/[ ]/g, "") == "")
        return false;
    else
        return true;
}

function GoToPage() {
    var table = document.getElementById("gvwInfo");
    var textbox = table.getElementsByTagName("input");
    for (var i = 0; i < textbox.length; i++) {
        if (textbox[i].type == "text" && !(/^[1-9]\d*$/.test(textbox[i].value))) {
            alert("页数输入有误！");
            return false;
        }
    }
    return true;
}

function reflesh() {
    window.location.href = window.location.href;
}

function show_title(str) {
    window.parent.window.document.getElementById("spanTitle").innerHTML = str;
}