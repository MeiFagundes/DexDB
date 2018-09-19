/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

// ---- DATA ----

var fetchPkmnUntilNo = 151;


function inputType_onchange(){
    changeInputType(inputType = document.querySelector("#inputType").value);
}

function changeInputType(inputType){
    
    switch(inputType){
        case "id":
            document.querySelector("#inputDataDiv").innerHTML = "<input type='number' id='inputData' max='" + this.fetchPkmnUntilNo + "' placeholder='Type Pokemon Id'/>";
            break;
            
        case "name":
            document.querySelector("#inputDataDiv").innerHTML = "<input type='text' id='inputData' placeholder='Type Pokemon Name'/>";
            break;
        
        default:
            return;
    }
}

function retrieveData(){
    
    let xhttp = new XMLHttpRequest();
    
    xhttp.onreadystatechange = () => {
        if (xhttp.readyState === 4) {
            if (xhttp.status === 200) {
                document.querySelector("#data").innerHTML = xhttp.responseText;
            }
        }
    };
    
    let inputType = document.querySelector("#inputType").value;
    let inputData = document.querySelector("#inputData").value;
    
    xhttp.open("POST", "PokeServlet?inputType=" + inputType + "&inputData=" + inputData, true);
    xhttp.send();
    //xhttp.responseType = 'text';
}

