public class SP_WeatherService {

	private static final String OPEN_WEATHER_SETTING = 'Weather_WS_Settings';

	private List<Weather_WS_Settings__mdt> configs;

	public SP_WeatherService() {
		this.configs = [SELECT API_Key__c, EndPoint__c FROM Weather_WS_Settings__mdt WHERE DeveloperName = :OPEN_WEATHER_SETTING];
		if (this.configs.isEmpty()) {
			throw new CustomException(String.format(CustomException.NO_METADATA_BY_NAME, new List<String> { OPEN_WEATHER_SETTING }));
		}
	}

	public WeatherDetails makeCalloutByCity(final String city) {
		HttpResponse response = HttpService.makeGetRequest(this.configs[0].EndPoint__c + 'q=' + city + '&units=metric' + '&APPID=' + this.configs[0].API_Key__c + '&mode=json');
		System.debug('response >>> ' + response.getBody());
		if (String.isEmpty(response.getBody())) {
			throw new CustomException(CustomException.RESPONSE_EMPTY);
		}
		//Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
		//System.debug(JSON.serialize(result));

		Map<String, Object> obj = (Map<String, Object>) JSON.deserializeUntyped(body);
		List<Object> items = (List<Object>) obj.get('items');

		for (Object item : items) {
			result.add(parseItem(item));
		}

		if (result.isEmpty()) {
			throw new CustomException(CustomException.DESERIALIZED_RESULT_EMPTY);
		}
		return new WeatherDetails((String) result.get('temp'), (String) result.get('humidity'), (String) result.get('pressure'));

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

	}
}