public class SP_WeatherCtrl {

    public SP_WeatherCtrl() {}

    //TODO: Here goes the @RemoteAction method that has city as input parameter. It calls appropriate SP_WeatherService method (getWeatherInfo()).
    @RemoteAction
    public static SP_WeatherService.WeatherDetails getWeatherByCity(final String city) {
        SP_WeatherService.WeatherDetails weatherInfo = null;
        try {
            weatherInfo = new SP_WeatherService().makeCalloutByCity(city);
            System.debug('weatherInfo>>>' + weatherInfo);
        } catch (Exception e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, e.getMessage()));
        }
        return weatherInfo;
    }
}