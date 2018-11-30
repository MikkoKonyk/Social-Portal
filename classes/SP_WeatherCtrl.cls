public class SP_WeatherCtrl {
	public String city { get; set; }
	public String code { get; set; }
	public SP_HttpService.WheatherDetails wheatherInfo { get; set; }

	public SP_WeatherCtrl() {
		User user = [SELECT City FROM User WHERE Id = :UserInfo.getUserId()];
		this.city = user.City;
	}

	public SP_HttpService.WheatherDetails getWeatherByCityAndCountryCode(String city) {
		this.wheatherInfo = SP_HttpService.getWeatherInfo(city);

		return this.wheatherInfo;
	}
}