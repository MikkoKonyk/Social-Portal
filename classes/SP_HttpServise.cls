public class SP_HttpServise {
	public String city { get; set; }
	public String code { get; set; }
	public String apiKey = 'd6e0ebc77d4107db718d04dbb2e8c24a';

	public SP_HttpServise() {

		User user = [SELECT City FROM User WHERE Id = :UserInfo.getUserId()];
		this.city = user.City;

		Http http = new Http();
		HttpRequest request = new HttpRequest();
		request.setEndpoint('https://api.openweathermap.org/data/2.5/weather?q=' + city + '&units=metric' + '&APPID=' + apiKey);
		request.setMethod('GET');
		HttpResponse response = http.send(request);
	}

	class WheatherDetails {
		public String temperature { get; set; }
		public String humidity { get; set; }
		public String windPower { get; set; }

		public WheatherDetails(String temperature, String humidity, String windPower) {
			this.temperature = temperature;
			this.humidity = humidity;
			this.windPower = windPower;
		}
	}
}