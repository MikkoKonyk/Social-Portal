function getWeather() {
    var city = document.getElementById('city').value;
    var countryCode = document.getElementById('countryCode').value;
    SP_WeatherCtrl.getWeatherByCity(
		city,  
		countryCode,
    	function (result, event) { 
			if (event.status) {
			    document.getElementById('message').innerHTML = 'The weather parameter in selected by you city now are:';
				document.getElementById('temperatureId').innerHTML = result.temp + 'ºC';
				document.getElementById('humidityId').innerHTML =  result.humidity + '%';
				document.getElementById('pressureId').innerHTML =  result.pressure + 'mb';
			} else {
			}
     	}, 
    	{ buffer: true, escape: true, timeout: 120000 }
    );
};

navigator.geolocation.getCurrentPosition(
	function getWeatherByIpLocation(position) {
		var lat = position.coords.latitude;
		var lon = position.coords.longitude;
		SP_WeatherCtrl.getWeatherByIpLocation(
			lat,
			lon,
			function (result, event) {
				if (event.status) {
				    document.getElementById('message').innerHTML = 'The weather parameter in your city now are:';
					document.getElementById('temperatureId').innerHTML = result.temp + 'ºC';
					document.getElementById('humidityId').innerHTML =  result.humidity + '%';
					document.getElementById('pressureId').innerHTML =  result.pressure + 'mb';
				} else {
				}
			},
			{ buffer: true, escape: true, timeout: 120000 }
		);
	}
);
