import 'dart:html';

void main() {
  var ajax = new Jhub1AjaxWorks();
  ajax.getWorks();
  
  querySelector("#sample_text_id")
      ..text = "It Doesn't Work"
      ..onClick.listen(reverseText);
}

void reverseText(MouseEvent event) {
  var text = querySelector("#sample_text_id").text;
  var buffer = new StringBuffer();
  for (int i = text.length - 1; i >= 0; i--) {
    buffer.write(text[i]);
  }
  querySelector("#sample_text_id").text = buffer.toString();
}


class Jhub1AjaxWorks {
  
  static const String URL = "http://127.0.0.1";
  static const String PORT = "8081";
  static const String VERSION = "mock0";
  static const String TEST = "works";

  String buildURI() {
    var buffer = new StringBuffer();
    buffer.write(URL);
    buffer.write(":");
    buffer.write(PORT);
    buffer.write("/");
    buffer.write(VERSION);
    buffer.write("/");
    buffer.write(TEST);
    return buffer.toString();
  }
  
  void getWorks() {
    var request = HttpRequest.getString(buildURI()).then(this.onDataLoaded);
  }
  
  void onDataLoaded(String responseText) {
    var jsonString = responseText;
    querySelector("#sample_text_id").text = jsonString;
  }
  
}
