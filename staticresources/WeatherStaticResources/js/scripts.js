        function getWeather() {
            var city = document.getElementById('city').value;
            var countryCode = document.getElementById('countryCode').value;
            SP_WeatherCtrl.getWeatherByCity(
				city,  
                countryCode,
            function (result, event) { 
                    if (event.status) { 
                        document.getElementById('temperatureId').innerHTML = result.temp;
                        document.getElementById('humidityId').innerHTML =  result.humidity;
                        document.getElementById('pressureId').innerHTML =  result.pressure;
                    } else { 
                    }
                }, { buffer: true, escape: true, timeout: 120000 });
        }