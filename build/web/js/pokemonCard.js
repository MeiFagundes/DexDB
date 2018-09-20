searchBoard = document.getElementsByClassName('searchBoard')[0];
pokeBoard = document.getElementsByClassName('pokeBoardOff')[0];
searchButton = document.getElementsByClassName('btn')[0];
searchBar = document.getElementsByClassName('searchBar')[0];



function retrieveData(inputType, inputData){
    
    let xhttp = new XMLHttpRequest();
    
    xhttp.onreadystatechange = () => {
        if (xhttp.readyState === 4) {
            if (xhttp.status === 200) {
                
                if(xhttp != "Not_Found"){
                    pokeName = document.getElementsByClassName('pokeName')[0];
                    pokeText = document.getElementsByClassName('text')[0];
                    pokeSprite = document.getElementsByClassName('sprite')[0];
                    type1 =  document.getElementsByClassName('type1')[0];
                    type2 =  document.getElementsByClassName('type2')[0];
                    
                    var res = xhttp.responseText.split(",");
                    pokeName.innerHTML = res[0] + "|" + res[1];
                    pokeText.innerHTML = res[4];
                    pokeSprite.src = res[5];
                    type1.src = "images/types/" + res[2] +".png";
                    type2.src = "images/types/" + res[3] +".png";
                    searchBoard.style.visibility = "hidden";
                    pokeBoard.classList.add('pokeBoardOn');
                }
                else{
                    alert("ERROR: ");
                }
            }
        }
    };
    

    xhttp.open("POST", "PokeServlet?inputType=" + inputType + "&inputData=" + inputData, true);
    xhttp.send();  
}

function bringPokemonCard(identificator) {
    alert(identificator);
    if(/^\d+$/.test(identificator)){
        retrieveData("ID", identificator);
        
    }
    else{
        retrieveData("NAME", identificator);
    }
   
   
    
}

searchBar.onkeydown = function(event) {
    if (event.keyCode == 13) {
      bringPokemonCard(searchBar.value);
      searchBar.value = '';
    }
}

searchButton.addEventListener('click', function(){
  bringPokemonCard(searchBar.value);
});


