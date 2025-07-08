public with sharing class GiroBillingService {
  public static HttpResponse sendBill(Map<String, Object> billData) {
    HttpRequest req = new HttpRequest();
    req.setEndpoint('https://api.giro.or.kr/v1/bills/giro');
    req.setMethod('POST');
    req.setHeader('Content-Type', 'application/json; charset=UTF-8');
    req.setHeader('Authorization', 'Bearer ' + getAccessToken());

    req.setBody(JSON.serialize(billData));
    Http http = new Http();
    return http.send(req);
  }

  public static HttpResponse cancelBill(Map<String, Object> cancelData) {
    HttpRequest req = new HttpRequest();
    req.setEndpoint('https://api.giro.or.kr/v1/bills/giro/cancel');
    req.setMethod('POST');
    req.setHeader('Content-Type', 'application/json; charset=UTF-8');
    req.setHeader('Authorization', 'Bearer ' + getAccessToken());

    req.setBody(JSON.serialize(cancelData));
    Http http = new Http();
    return http.send(req);
  }

  public static HttpResponse checkPaymentStatus(
    Map<String, String> queryParams
  ) {
    String queryStr =
      'ptco_code=' +
      queryParams.get('ptco_code') +
      '&cls_code=' +
      queryParams.get('cls_code') +
      '&giro_no=' +
      queryParams.get('giro_no') +
      '&epay_no=' +
      queryParams.get('epay_no') +
      '&pay_yymm_seq=' +
      queryParams.get('pay_yymm_seq') +
      '&noti_issu_type=' +
      queryParams.get('noti_issu_type') +
      '&etc_type_code=' +
      queryParams.get('etc_type_code');
    HttpRequest req = new HttpRequest();
    req.setEndpoint(
      'https://api.giro.or.kr/v1/bills/giro/payment-yn?' + queryStr
    );
    req.setMethod('GET');
    req.setHeader('Authorization', 'Bearer ' + getAccessToken());

    Http http = new Http();
    return http.send(req);
  }

  private static String getAccessToken() {
    // Custom Metadata or Named Credential 등에서 발급받은 토큰 가져오기
    return 'YOUR_ACCESS_TOKEN';
  }
}
