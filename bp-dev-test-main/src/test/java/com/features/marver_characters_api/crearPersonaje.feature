@REQ_BTPMARVEL-001 @HU001 @create_marvel_character @marvel_characters_api @Agente2 @E2 @iniciativa_marvel_api
Feature: BTPMARVEL-001 Crear personaje Marvel (microservicio para creación y validación de personajes)

  Background:
    * url port_marvel_characters_api
    * path '/characters'
    * def generarHeaders =
      """
      function() {
        return { "Content-Type": "application/json" };
      }
      """
    * def headers = generarHeaders()
    * headers headers

  @id:1 @crearPersonaje @creacionExitosa201
  Scenario: T-API-BTPMARVEL-001-CA01-Crear personaje exitosamente 201 - karate
    * def jsonData = read('classpath:data/marvel_characters_api/request_create_character.json')
    And request jsonData
    When method POST
    Then status 201
  # And match response == karate.read('classpath:data/marvel_characters_api/response_character_ok.json')
  # And match response.name == 'Iron Man'

  @id:2 @crearPersonaje @errorNombreDuplicado400
  Scenario: T-API-BTPMARVEL-001-CA02-Crear personaje con nombre duplicado 400 - karate
    * def jsonData = read('classpath:data/marvel_characters_api/request_create_character_duplicate.json')
    And request jsonData
    When method POST
    Then status 400
  # And match response == karate.read('classpath:data/marvel_characters_api/response_create_character_duplicate.json')
  # And match response.error contains 'already exists'

  @id:3 @crearPersonaje @errorCamposRequeridos400
  Scenario: T-API-BTPMARVEL-001-CA03-Crear personaje con campos requeridos faltantes 400 - karate
    * def jsonData = read('classpath:data/marvel_characters_api/request_create_character_invalid.json')
    And request jsonData
    When method POST
    Then status 400
  # And match response == karate.read('classpath:data/marvel_characters_api/response_create_character_invalid.json')
  # And match response.name == 'Name is required'