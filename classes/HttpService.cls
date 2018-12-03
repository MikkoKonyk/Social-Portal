public with sharing class HttpService {

    static final Integer timeout = 60000;

    public static HttpResponse makeGetRequest(final String endpoint) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setHeader('Content-Type', 'application/json');
        req.setMethod('GET');
        req.setTimeout(timeout);
        return new Http().send(req);
    }
}