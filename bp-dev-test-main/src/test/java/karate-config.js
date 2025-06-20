function fn() {
  var env = karate.env || 'local';

  // Configuración base para todos los entornos
  var config = {
    baseUrl: 'http://localhost:8080'
  };

  // URLs de microservicios (agrega aquí los que necesites)
  config.port_marvel_characters_api = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api';

  // Configuración específica por entorno
  if (env == 'dev') {
    config.baseUrl = 'https://api-dev.empresa.com';
    config.port_marvel_characters_api = 'https://api-dev.empresa.com/testuser/api';
    // Agrega aquí los endpoints reales para dev si los tienes
  } else if (env == 'qa') {
    config.baseUrl = 'https://api-qa.empresa.com';
    config.port_marvel_characters_api = 'https://api-qa.empresa.com/testuser/api';
    // Agrega aquí los endpoints reales para qa si los tienes
  }

  return config;
}