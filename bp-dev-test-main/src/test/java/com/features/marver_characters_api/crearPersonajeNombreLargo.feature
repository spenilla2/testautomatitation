@REQ_BTPMARVEL-001 @HU001 @crear_personaje_nombre_largo @marvel_characters_api @Agente2 @E2 @iniciativa_marvel_api
Feature: BTPMARVEL-001 Validar creación de personaje con nombre demasiado largo

  Background:
    * url port_marvel_characters_api
    * path '/characters'
    * def headers = { "Content-Type": "application/json" }
    * headers headers

  @id:4 @nombreMuyLargo @errorValidacion400
  Scenario: T-API-BTPMARVEL-001-CA04-Crear personaje con nombre demasiado largo 400 - karate
    * def jsonData =
    {
    "name": "IronManConNombreExcesivamenteLargoQueNoDebeSerPermitidoPorLaApi",
    "alterego": "Tony Stark",
    "description": "Prueba nombre largo",
    "powers": ["Armor"]
    }
    And request jsonData
    When method POST
    Then status 400
  # And match response.message contains 'name too long'