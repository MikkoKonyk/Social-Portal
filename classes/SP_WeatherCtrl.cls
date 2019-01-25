public class SP_WeatherCtrl {

    public SP_WeatherCtrl() {}

    @RemoteAction
    public static SP_WeatherService.WeatherDetails getWeatherByCity(String city, String countryCode) {
        SP_WeatherService.WeatherDetails weatherInfo = null;
        try {
            weatherInfo = new SP_WeatherService().makeCalloutByCity(city, countryCode);
        } catch (Exception e) {
            throw new CustomException(e.getMessage());
        }
        return weatherInfo;
    }
}