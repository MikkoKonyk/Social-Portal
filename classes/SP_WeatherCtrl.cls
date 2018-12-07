public class SP_WeatherCtrl {

    public SP_WeatherCtrl() {}

    @RemoteAction
    public static SP_WeatherService.WeatherDetails getWeatherByCity(final String city) {
        SP_WeatherService.WeatherDetails weatherInfo = null;
        try {
            weatherInfo = new SP_WeatherService().makeCalloutByCity(city);
            System.debug('weatherInfo>>>' + weatherInfo);
        } catch (Exception e) {
            throw new CustomException(e.getMessage());
        }
        System.debug('result >>> ' + weatherInfo);
        return weatherInfo;
    }
}