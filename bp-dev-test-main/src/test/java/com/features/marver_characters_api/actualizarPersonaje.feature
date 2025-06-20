@REQ_BTPMARVEL-001 @HU001 @update_marvel_character @marvel_characters_api @Agente2 @E2 @iniciativa_marvel_api
Feature: BTPMARVEL-001 Actualizar personaje Marvel (microservicio para actualización de personajes)

  Background:
    * url port_marvel_characters_api
    * def generarHeaders =
      """
      function() { return { "Content-Type": "application/json" }; }
      """
    * def headers = generarHeaders()
    * headers headers

  @id:1 @actualizarPersonaje @actualizacionExitosa200
  Scenario: T-API-BTPMARVEL-001-CA01-Actualizar personaje exitosamente 200 - karate
    * path '/characters/1'
    * def jsonData =
    {
    "name": "Iron Man",
    "alterego": "Tony Stark",
    "description": "Updated description",
    "powers": ["Armor", "Flight"]
    }
    And request jsonData
    When method PUT
    Then status 200
  # And match response.description == 'Updated description'
  # And match response.id == 1

  @id:2 @actualizarPersonaje @noEncontrado404
  Scenario: T-API-BTPMARVEL-001-CA02-Actualizar personaje no existente 404 - karate
    * path '/characters/999'
    * def jsonData =
    {
    "name": "Iron Man",
    "alterego": "Tony Stark",
    "description": "Updated description",
    "powers": ["Armor", "Flight"]
    }
    And request jsonData
    When method PUT
    Then status 404
  # And match response == karate.read('classpath:data/marvel_characters_api/response_character_not_found.json')
  # And match response.error == 'Character not found'