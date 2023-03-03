function fn() {
    //set up runtime variables based on environment
    //get system property 'karate.env'
    var env = karate.env;

    var config = {
        baseUrl: 'http://localhost:8080/',
        apiKey2: '1234_from_karate-config.js'
    }

//switch environment
    if (env === 'local') {
        config.baseUrl = 'http://localhost:8000/';
        config.apiKey2 = '1234_from_karate-config.js';
    } else if (env === 'something') { //Pre-production environment settings
        config.baseUrl = 'something';
        config.apiKey2 = 'something';
    }

    karate.log('karate.env =', karate.env);
    karate.log('config.baseUrl =', config.baseUrl);
    karate.log('config.apiKey =', config.apiKey2);

    return config;
}