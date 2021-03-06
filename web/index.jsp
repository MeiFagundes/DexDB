<%-- 
    Document   : index
    Created on : 17/09/2018, 12:41:53
    Author     : Mei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="css/materialize.css"  media="screen,projection"/>
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DexDB</title>
    </head>
    <body>

        <nav class="red">
            <div id="navContainer">
                <a id='logo'>DexDB</a> 
                <a href="#" onclick="showPokedexSearch()">Search Pokemon</a>
                <a href="#" onclick="showPokedexList()">Pokedex List</a>
            </div>
        </nav>

        <section id="mainSection">
            
            <div id='loginField' class='card'>
                <input type='text' id="login" class="input" value="" placeholder='Login* (Default: root)'/>
                <input type='text' id="password" class="input" placeholder='Password (No password by default)'/>
                <input type='text' id="dbName" class="input" placeholder='DB Name* (Default: dexdb)'/>
                <button type="button" class="btn" onclick="authenticate()">Authenticate</button>
            </div>
            
            
            <section id='searchSection'>
                <h3>Pokedex Search:</h3>
                <section id="inputSection" class="card-panel">
                    Search Pokemon By:<br>
                    <select id="inputType" class="select-dropdown" onchange="inputType_onchange()">
                    <option value="id">Pokedex Id</option>
                    <option value="name" selected>Name</option>
                    </select><br><br>

                    Value to be searched:
                    <div id="inputDataDiv" class="input-field">
                        <input type='text' id="inputData" class="input" placeholder='Type Pokemon Name'/>
                    </div>
                    <button type="button" class="btn" onclick="executeSearch()">Search Pokemon</button>
                </section>
                <section id="data" class="card">
                        <div id="dataLeft">
                            <p id="dataEntry"></p>
                        </div>
                        <div id="dataRight">
                            <img id="dataSprite">
                            <p id="dataName"></p>
                            <p id="dataId"></p>
                            <img id="primType" class="pokemonTypes">
                            <img id="secType" class="pokemonTypes">
                            <div id="pokemonNavigation">
                                <button id="prevButton" onclick="navigationButton_onclick(-1)" class="btn">Previous</button>
                                <button id="nextButton" onclick="navigationButton_onclick(1)" class="btn">Next</button>
                            </div>
                        </div>
                </section>

            </section>
            <section id='pokemonList' class='card'>
                <h3>Pokedex</h3>
                <table class='tabbed'>
                    <thead>
                        <tr><th>#</th><th>Sprite</th><th>Name</th><th>Type</th></tr>
                    </thead>
                    <tbody id="pokemonListBody"></tbody>
                </table>
            </section>
        </section>        
        
        <script src="PokeScript.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/materialize.js"></script>
    </body>
</html>