public class SP_WeatherCtrl {

    public SP_WeatherCtrl() {}

    @RemoteAction
    public static SP_WeatherService.WeatherDetails getWeatherByCity(String city, String countryCode) {
        SP_WeatherService.WeatherDetails weatherInfo = null;
        system.debug('city>>>' + city);
        system.debug('countryCode>>>' + countryCode);
        try {
            weatherInfo = new SP_WeatherService().makeCalloutByCity(city, countryCode);
            System.debug('weatherInfo>>>' + weatherInfo);
        } catch (Exception e) {
            throw new CustomException(e.getMessage());
        }
        System.debug('result >>> ' + weatherInfo);
        return weatherInfo;
    }
}