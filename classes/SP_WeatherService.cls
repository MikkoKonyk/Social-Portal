public class SP_WeatherService {

	private static final String OPEN_WEATHER_SETTING = 'Weather_WS_Settings';

	private List<Weather_WS_Settings__mdt> configs;

	public SP_WeatherService() {
		this.configs = [SELECT API_Key__c, EndPoint__c FROM Weather_WS_Settings__mdt WHERE DeveloperName = :OPEN_WEATHER_SETTING];
		if (this.configs.isEmpty()) {
			throw new CustomException(String.format(CustomException.NO_METADATA_BY_NAME, new List<String> { OPEN_WEATHER_SETTING }));
		}
	}

	public WeatherDetails makeCalloutByCity(String city, String countryCode) {
		HttpResponse response = HttpService.makeGetRequest(this.configs[0].EndPoint__c + 'q=' + city + ',' + countryCode + '&units=metric' + '&APPID=' + this.configs[0].API_Key__c + '&mode=json');
		if (String.isEmpty(response.getBody())) {
			throw new CustomException(CustomException.RESPONSE_EMPTY);
		}
		Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
		
		Map<String, Object> items = (Map<String, Object>) result.get('main');

		if (result.isEmpty()) {
			throw new CustomException(CustomException.DESERIALIZED_RESULT_EMPTY);
		}
		return new WeatherDetails((Decimal) items.get('temp'), (Decimal) items.get('humidity'), (Decimal) items.get('pressure'));

	}

	public class WeatherDetails {
		public Decimal temp { get; set; }
		public Decimal humidity { get; set; }
		public Decimal pressure { get; set; }

		public WeatherDetails(Decimal temp, Decimal humidity, Decimal pressure) {
			this.temp = temp;
			this.humidity = humidity;
			this.pressure = pressure;
		}

		public WeatherDetails() { }

	}
}