@REQ_BTPMARVEL-001 @HU001 @delete_marvel_character @marvel_characters_api @Agente2 @E2 @iniciativa_marvel_api
Feature: BTPMARVEL-001 Eliminar personaje Marvel (microservicio para eliminar personajes)

  Background:
    * url port_marvel_characters_api
    * def generarHeaders =
      """
      function() { return { "Content-Type": "application/json" }; }
      """
    * def headers = generarHeaders()
    * headers headers

  @id:1 @eliminarPersonaje @eliminacionExitosa204
  Scenario: T-API-BTPMARVEL-001-CA01-Eliminar personaje exitosamente 204 - karate
    * path '/characters/1'
    When method DELETE
    Then status 204
  # And match response == null

  @id:2 @eliminarPersonaje @noEncontrado404
  Scenario: T-API-BTPMARVEL-001-CA02-Eliminar personaje no existente 404 - karate
    * path '/characters/999'
    When method DELETE
    Then status 404
  # And match response == karate.read('classpath:data/marvel_characters_api/response_character_not_found.json')
  # And match response.error == 'Character not found'