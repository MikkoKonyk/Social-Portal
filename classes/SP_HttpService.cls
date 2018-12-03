public class SP_HttpService {
	public static final String settingName = 'Weather_WS_Settings';

	private static Weather_WS_Settings__mdt getConfig(String configName) {
		Weather_WS_Settings__mdt config = [SELECT API_Key__c, EndPoint__c FROM Weather_WS_Settings__mdt WHERE Name = :configName LIMIT 1];
		if (null == config) {
			throw new WeatherServiceException('ERROR');
		}
		return config;
	}

	public static HttpResponse getResponse(String city) {
		Weather_WS_Settings__mdt config = getConfig(settingName);
		Http http = new Http();
		HttpRequest request = new HttpRequest();
		request.setEndpoint(config.EndPoint__c + city + '&units=metric' + '&APPID=' + config.API_Key__c);
		request.setMethod('GET');
		HttpResponse response = http.send(request);

		return response;
	}

	public static WheatherDetails getWeatherInfo(String city) {
		HttpResponse response = getResponse(city);

		WheatherDetails wheatherInfo = new WheatherDetails(temp, humidity, pressure);
		Map results = (Map) JSON.deserializeUntyped(response.getBody);

		city = String.valueOf(response.get('name'));
		temp = String.valueOf(results.get('temp'));
		humidity = String.valueOf(results.get('humidity'));
		pressure = String.valueOf(results.get('pressure'));

		return wheatherInfo;
	}

	public class WheatherDetails {
		public String temp { get; set; }
		public String humidity { get; set; }
		public String pressure { get; set; }

		public WheatherDetails(String temp, String humidity, String pressure) {
			this.temp = temp;
			this.humidity = humidity;
			this.pressure = pressure;
		}
	}

	public class WeatherServiceException extends Exception {
	}
}
