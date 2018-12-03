public class SP_HttpService {
	public static final String settingName = 'Weather_WS_Settings';

	private static Weather_WS_Settings__mdt getConfig(String configName) {
		Weather_WS_Settings__mdt config = [SELECT API_Key__c, EndPoint__c FROM Weather_WS_Settings__mdt WHERE MasterLabel = :configName LIMIT 1];
		if (null == config) {
			throw new WeatherServiceException('ERROR');
		}
		return config;
	}

	public static HttpResponse getResponse(String city) {
		Weather_WS_Settings__mdt config = getConfig(settingName);
		Http http = new Http();
		HttpRequest request = new HttpRequest();
		request.setEndpoint(config.EndPoint__c + city + '&units=metric' + '&APPID=' + config.API_Key__c + '&mode=json');
		request.setMethod('GET');
		HttpResponse response = http.send(request);

		return response;
	}

	public static WeatherDetails getWeatherInfo(String city) {
		HttpResponse response = getResponse(city);

		WeatherDetails weatherInfo = new WeatherDetails();
		Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());

		weatherInfo.temp = String.valueOf(results.get('temp'));
		weatherInfo.humidity = String.valueOf(results.get('humidity'));
		weatherInfo.pressure = String.valueOf(results.get('pressure'));

		return weatherInfo;
	}
	public class WeatherDetails {
		public String temp { get; set; }
		public String humidity { get; set; }
		public String pressure { get; set; }

		public WeatherDetails(String temp, String humidity, String pressure) {
			this.temp = temp;
			this.humidity = humidity;
			this.pressure = pressure;
		}
		public WeatherDetails() {
		}
	}

	public class WeatherServiceException extends Exception {
	}
}
