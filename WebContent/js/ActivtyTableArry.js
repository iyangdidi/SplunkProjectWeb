// JScript 文件
// <script type="text/javascript">
    /**//*This function is use to add one row dynamicly 
* tabObj : Target table 
* colNum: The number of columns that of a row in table 
* sorPos: The source of the new row. 
* targPos: The position where the new row will be added. 
* 
*/ 
function addRow(tabObj,colNum,sorPos,targPos,Hidden){ 
    var nTR = tabObj.insertRow(tabObj.rows.length-targPos); // Insert a new row into appointed table on the 
    //appointed position. 
    var TRs = tabObj.getElementsByTagName('TR'); // Get TRs collection from the appointed table 
    var sorTR = TRs[sorPos]; // Positioned the sorTR 
    var TDs = sorTR.getElementsByTagName('TD'); // Get TDs collection from the appointed row 
    if(colNum==0 || colNum==undefined || colNum==isNaN){ 
        colNum=tabObj.rows[0].cells.length; 
    } 

    var lastRow = tabObj.rows.length;//测试
    var iteration = lastRow-3;//测试
    var ntd = new Array(); // Create a new TDs array 
    for(var i=0; i< colNum; i++){ // Traverl the TDs in row 
        ntd[i] = nTR.insertCell(); // Create new cell 
        ntd[i].id = TDs[0].id; // copy the TD's id to new cell. | Attention! The TDs's 
        //suffix must be appointed 
        ntd[i].innerHTML = TDs[i].innerHTML; // copy the value in ntd[i]'s innerHTML from corresponding TDs 

        //测试成功，第一列为序号。
        if(i==0){
            var textNode = document.createTextNode(iteration);//测试
            ntd[i].appendChild(textNode);//测试
        }

    }
    var std = iteration;//测试2
//    alert(std);
    Hidden.value=std;
} 
/**//* This function is use to remove appointed row in appointed table 
* tabObj: the appointed table 
* targPos: target row position 
* btnObj: currently clicked delete image button 
* 
*/ 
function deleteRow(tabObj,targPos,btnObj,Hidden){ //Remove table row 
    for(var i =0; i<tabObj.rows.length;i++){ 
        if(tabObj.getElementsByTagName('img')[i]==btnObj){ 
            tabObj.deleteRow(i+targPos); 
        } 
    }
    var lastRow = tabObj.rows.length;//给HiddenField（隐藏控件）赋值
    var std = lastRow-3; 
    Hidden.value=std; 
} 
//    </script>
