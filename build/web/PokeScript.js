/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

// ---- DATA ----

let pokedexLength = 50;
let inputDataEl = document.querySelector("#inputData");
let inputTypeEl = document.querySelector("#inputType");
let dataEl = document.querySelector("#data");
let dataNameEl = document.querySelector("#dataName");
let dataIdEl = document.querySelector("#dataId");
let dataSpriteEl = document.querySelector("#dataSprite");
let primTypeEl = document.querySelector("#primType");
let secTypeEl = document.querySelector("#secType");
let dataEntryEl = document.querySelector("#dataEntry");
let prevButtonEl = document.querySelector("#prevButton");
let nextButtonEl = document.querySelector("#nextButton");
let currentPokemonId = 0;
let xhttp = new XMLHttpRequest();
let login = "root";
let password = "";
let db = "dexdb";


function authenticate(){
    
    login = document.querySelector("#login").value;
    password = document.querySelector("#password").value;
    db = document.querySelector("#dbName").value;
    
    if(document.querySelector("#login").value === "" || document.querySelector("#dbName").value === ""){
        
        if (document.querySelector("#login").value === "") {
            login = "root";
        }
        if (document.querySelector("#dbName").value === "") {
            db = "dexdb";
        }
        document.querySelector("#loginField").innerHTML = "<p id='loginMessageRed'>There are empty required fields in the login section, the respective default values will be used instead.</p><p id='loginMessageGreen'>Done! Now click in one of the options above!</p>";
    } else{
        document.querySelector("#loginField").innerHTML = "<p id='loginMessageGreen'>Done! Now click in one of the options above!</p>";
    }
}

function executeSearch(){
    
    xhttp.open("POST", "PokeServlet?inputType=" + inputTypeEl.value + "&inputData=" + inputDataEl.value + "&login=" + login + "&password=" + password + "&db=" + db, true);
    xhttp.send();
    
    xhttp.onreadystatechange = () => {
        if (xhttp.readyState === 4) {
            if (xhttp.status === 200) {

                if (xhttp.responseText !== "incorrect parameters" && xhttp.responseText !== "not found") {

                
                    let response = xhttp.responseText.toString();
                    response = response.replace('@','').split("&");
                    currentPokemonId = response[0];
                    dataEl.style.visibility = "visible";
                    dataNameEl.innerHTML = response[1];
                    dataIdEl.innerHTML = "#" + response[0];
                    dataSpriteEl.src = "sprites/" + response[0] + ".png";
                    primTypeEl.src = "types/" + response[2].toLowerCase() + ".png";
                    if (response[3] !== "") {
                        secTypeEl.src = "types/" + response[3].toLowerCase() + ".png";
                    } else {
                        secTypeEl.src = "";
                    }
                    dataEntryEl.innerHTML = response[4];

                    prevButtonEl.innerHTML = "Previous #" + (currentPokemonId - 1);
                    nextButtonEl.innerHTML = "Next #" + (parseInt(currentPokemonId) + 1);

                    switch(parseInt(currentPokemonId)){
                        case parseInt(pokedexLength):
                            nextButtonEl.disabled = true;
                            break;

                        case 1:
                            prevButtonEl.disabled = true;
                            prevButtonEl.innerHTML = "Previous";
                            break;

                        default:
                            prevButtonEl.disabled = false;
                            nextButtonEl.disabled = false;
                    }
                }
            }
        }
    };
}

function retrieveList(){
        
        xhttp.open("POST", "PokeServlet?inputType=list&login=" + login + "&password=" + password + "&db=" + db, true);
        xhttp.send();

        xhttp.onreadystatechange = () => {
            if (xhttp.readyState === 4) {
                if (xhttp.status === 200) {

                    if (xhttp.responseText !== "incorrect parameters" && xhttp.responseText !== "not found") {

                        let response = xhttp.responseText.toString().split("@");
                        
                        for (let i = 0; i <= 50; i++) {
                            let current = response[i].split("&");
                            let pokemon = document.createElement('tr');
                            pokemon.className = "pokemonRow";
                            let type2 = "";
                            if (current[3] !== "") {
                                type2 = "<br><img class='innerTableType' src='types/"+ current[3].toLowerCase() + ".png'>";
                            }
                            pokemon.innerHTML = "<th>"+ current[0] +"</th><th><img class='innerTableSprite' src='sprites/"+ current[0] +".png'></th><th>"+ current[1] +"</th><th><img class='innerTableType' src='types/"+ current[2].toLowerCase() + ".png'>" + type2 + "</th>";
                            document.querySelector("#pokemonListBody").appendChild(pokemon);
                        }
                    }
                }
            }
        };
}

function retrieveData(){
    xhttp.open("POST", "PokeServlet?inputType=" + inputTypeEl.value + "&inputData=" + inputDataEl.value, true);
    xhttp.send();
}

function showPokedexSearch(){
    document.querySelector("#searchSection").style.visibility = "visible";
    document.querySelector("#pokemonList").style.visibility = "hidden";
    document.querySelector("#searchSection").style.display = "block";
    document.querySelector("#pokemonList").style.display = "none";
    document.querySelector("#loginField").style.display = "none";
    
}

function showPokedexList(){
    document.querySelector("#searchSection").style.visibility = "hidden";
    document.querySelector("#pokemonList").style.visibility = "visible";
    document.querySelector("#searchSection").style.display = "none";
    document.querySelector("#pokemonList").style.display = "block";
    document.querySelector("#loginField").style.display = "none";
    retrieveList();
}

function navigationButton_onclick(i){
    xhttp.open("POST", "PokeServlet?inputType=id&inputData=" + (parseInt(currentPokemonId) + parseInt(i)) + "&login=" + login + "&password=" + password + "&db=" + db , true);
    xhttp.send();
}


function inputType_onchange(){
    changeInputType(inputType = document.querySelector("#inputType").value);
}

function changeInputType(inputType){
    
    switch(inputType){
        case "id":
            inputDataEl.type = "number";
            inputDataEl.placeholder = "Type Pokemon Id (Max: "+ pokedexLength + ")";
            inputDataEl.min = 1;
            inputDataEl.max = pokedexLength.toString();

            break;
            
        case "name":
            inputDataEl.type = "text";
            inputDataEl.placeholder = 'Type Pokemon Name';
            break;
        
        default:
            return;
    }
}



/*
function retrieveDataExternal(){
    
    let xhttp = new XMLHttpRequest();
    
    xhttp.onreadystatechange = () => {
        if (xhttp.readyState === 4) {
            if (xhttp.status === 200) {
                dataEl.innerHTML = xhttp.responseText;
            }
        }
    };
    
    //let inputType = document.querySelector("#inputType").value;
    //let inputData = document.querySelector("#inputData").value;
    
    xhttp.open("GET", "https://pokeapi.co/api/v1/pokemon/5/", true);
    xhttp.send();
    //xhttp.responseType = 'text';
}*/

