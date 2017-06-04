var get_weather_widget = function($object, date, hour) {

    var apiKey = 'eb7f35de94f846278ef54159170406',
        postalCode = 'L2P3J8',
        apiURL = "https://api.apixu.com/v1/forecast.json?key=" + apiKey + "&q=" + postalCode + "&dt=" + date + "&hour=" + hour,
        $weatherDOM = $object.find('.content .weather-forecast');

    $weatherDOM.prepend('<img class="loader-gif" src="/assets/ajax-loader.gif" alt="Loading..." />');

    $.get(apiURL, function(data) {

        var weatherDetails = data.forecast.forecastday[0]['hour'][0];

        $weatherDOM.find('.loader-gif').remove();

        $weatherDOM.find('.condition-text').html(weatherDetails.condition.text);
        $weatherDOM.find('.condition-icon').html('<img src="' + weatherDetails.condition.icon + '" alt="Weather Icon" />');
        $weatherDOM.find('.condition-temp').html('Temp: ' + weatherDetails.temp_c + ' C / ' + weatherDetails.temp_f + ' F');
        $weatherDOM.find('.condition-wind').html('Wind: ' + weatherDetails.wind_kph + ' kph');
        $weatherDOM.find('.condition-humidity').html('Humidity: ' + weatherDetails.humidity + '%');
    });
};