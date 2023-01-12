class Constants {
  static String getEndpoint(String endPoint) => BASE_URL+endPoint;
  static String getLoginEndpoint(String endPoint) => SMARTZI_BASE_URL+endPoint;
  static String BASE_URL = "https://jsonplaceholder.typicode.com/";
  static String SMARTZI_BASE_URL = "https://staging.smartzi.com/customer-service/";
}