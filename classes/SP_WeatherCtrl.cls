public class SP_WeatherCtrl {

    public SP_WeatherCtrl() {}

    @RemoteAction
    public static SP_WeatherService.WeatherDetails getWeatherByCity(String city, String countryCode) {
        SP_WeatherService.WeatherDetails weatherInfo;
        try {
            weatherInfo = new SP_WeatherService().makeCalloutByCity(city, countryCode);
        } catch (Exception e) {
            throw new CustomException(e.getMessage());
        }
        return weatherInfo;
    }

    @RemoteAction
    public static SP_WeatherService.WeatherDetails getWeatherByIpLocation(Double lat, Double lon) {
        SP_WeatherService.WeatherDetails weatherInfo;
        try {
            weatherInfo = new SP_WeatherService().makeCalloutByIpLocation(lat, lon);
        } catch (Exception e) {
            throw new CustomException(e.getMessage());
        }
        return weatherInfo;
    }
}