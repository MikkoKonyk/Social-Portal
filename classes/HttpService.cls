public with sharing class HttpService {

    //Make sure we can't misspell methods
    public enum HttpMethod { XGET, XPUT, XHEAD, XOPTIONS, XDELETE, XPOST }

    static HttpMethod method;
    static final Integer timeout = 60000;

    public static HttpResponse makeGetRequest(final String endpoint) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setHeader('Content-Type', 'application/json');
        req.setMethod(method.name().removeStart('X'));
        req.setTimeout(timeout);
        return new Http().send(req);
    }
}