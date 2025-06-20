@REQ_BTPMARVEL-001 @HU001 @list_marvel_characters @marvel_characters_api @Agente2 @E2 @iniciativa_marvel_api
Feature: BTPMARVEL-001 Listar y consultar personajes Marvel (microservicio para consulta de personajes)

  Background:
    * url port_marvel_characters_api
    * def generarHeaders =
      """
      function() { return { "Content-Type": "application/json" }; }
      """
    * def headers = generarHeaders()
    * headers headers

  @id:1 @listarPersonajes @consultaExitosa200
  Scenario: T-API-BTPMARVEL-001-CA01-Listar personajes exitosamente 200 - karate
    * path '/characters'
    When method GET
    Then status 200
  # And match response == []

  @id:2 @consultarPersonajePorId @consultaExitosa200
  Scenario: T-API-BTPMARVEL-001-CA02-Consultar personaje por ID exitosamente 200 - karate
    * path '/characters/1'
    When method GET
    Then status 200
  # And match response == karate.read('classpath:data/marvel_characters_api/response_character_ok.json')
  # And match response.name == 'Iron Man'

  @id:3 @consultarPersonajePorId @noEncontrado404
  Scenario: T-API-BTPMARVEL-001-CA03-Consultar personaje por ID no existente 404 - karate
    * path '/characters/999'
    When method GET
    Then status 404
  # And match response == karate.read('classpath:data/marvel_characters_api/response_character_not_found.json')
  # And match response.error == 'Character not found'