// 左侧菜单
function border_left(left_tabid, left_menu_cnt) {
    var oItem = document.getElementById('menu').getElementsByTagName("li");
    for (var i = 0; i < oItem.length; i++) {
        var x = oItem[i];
        x.className = "";
    }
    document.getElementById(left_tabid).className = "Selected";
    var dvs = document.getElementById('menu').getElementsByTagName("ul");
    for (i = 0; i < dvs.length; i++) {
        if (dvs[i].id.indexOf('dleft_tab') == 0) {
            if (dvs[i].id == ('d' + left_tabid)) {
                dvs[i].style.display = 'block';
            }
            else {
                dvs[i].style.display = 'none';
            }
        }
    }
}


//将左侧菜单和框架内的网页保存为Cookie,方便还原
function SaveCookie() {
    var dvs = document.getElementById('menu').getElementsByTagName("ul");
    for (var i = 0; i < dvs.length; i++) {
        if (dvs[i].style.display == 'block') {
            document.cookie = "id=" + i + ";";
            break;
        }
    }
    var link = window.content3.location.href;
    document.cookie = "href=" + link.replace('=', '###');
}


//将Cookie内的内容还原
function RecoverMenu() {
    var dvs = document.getElementById('menu').getElementsByTagName("ul");
    var i = 0;
    var link;
    var title;
    //寻找cookie中id和href的值
    var strCookie = document.cookie;
    var arrCookie = strCookie.split("; ");
    for (var k = 0; k < arrCookie.length; k++) {
        var arr = arrCookie[k].split("=");
        if ("id" == arr[0]) {
            i = arr[1];
        }
        if ("href" == arr[0]) {
            link = arr[1];
        }
    }
    //还原左边菜单
    var left_tabid = 'left_tab' + i;
    var left_menu_cnt = 'left_menu_cnt' + i;
    border_left(left_tabid, left_menu_cnt);
    //还原框架网页
    window.content3.location.href = link.replace('###', '=');
    //清除cookie
    document.cookie = "id=;expires=" + (new Date(0)).toGMTString();
    document.cookie = "href=;expires=" + (new Date(0)).toGMTString();
}

//框架内刷新
function reflesh() {
    window.content3.location.href = window.content3.location.href;
}

//显示框架的title
function show_title() {
    document.getElementById("spanTitle").innerHTML = window.content3.document.title;
}

function addli(dleft_tab, url, name) {
    document.getElementById(dleft_tab).innerHTML += '<li id="now11"><a href="' + url + '" target="content3"><span>' + name + '</span></a></li>';
}