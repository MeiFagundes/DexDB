<%-- 
    Document   : index
    Created on : 17/09/2018, 12:41:53
    Author     : Mei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <link rel="stylesheet" href="css/button.css">
    <link rel="stylesheet" href="css/master.css">
    <link rel="stylesheet" href="css/searchBoard.css">
    <link rel="stylesheet" href="css/searchBar.css">
    <link rel="stylesheet" href="css/pokeBoard.css">
    <meta charset="utf-8">
    <title>PokedexDB - Your Pokedex Database!</title>
  </head>
  <body>
    <div class="searchBoard">
      <h1>PokedexDB</h1>
      <h2>Your pokedex search tool</h2>
      <div class="col-3">
        	<input class="searchBar" onfocusout="this.value=''" type="text" placeholder="">
            <label>Search for pokemon with ID or Name</label>
          <span class="focus-border"></span>
      </div>
      <button class="btn" type="button"><span>Search!</span></button>
    </div>

    <div class="pokeBoardOff">
      <div class="pokeEntry">
        <h1 class="pokeName"></h1>
        <p class="text"></p>
      </div>
      <div class="pokeSprite">
        <img class = "sprite" src="" alt="">
      </div>
      <div class="pokeType">
        <img src="" alt="" class="type1">
        <img src="" alt="" class="type2">
      </div>

    </div>

  </body>
  <script src="js/pokemonCard.js" charset="utf-8"></script>
</html>