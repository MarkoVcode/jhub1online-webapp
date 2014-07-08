abstract class Service {

  static const String URL = "http://127.0.0.1";
  static const String PORT = "8081";
  static const String VERSION = "mock0";
  
  String buildURI() {
    var buffer = new StringBuffer();
    buffer.write(URL);
    buffer.write(":");
    buffer.write(PORT);
    buffer.write("/");
    buffer.write(VERSION);
    buffer.write("/");
    return buffer.toString();
  }
}
