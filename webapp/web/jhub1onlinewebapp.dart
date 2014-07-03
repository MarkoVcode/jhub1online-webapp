import 'dart:html';

void main() {
//  loadData();
  var ajax = new Jhub1Ajax();
  ajax.getAgent("QWERTY");
  
  querySelector("#sample_text_id")
      ..text = "Click me!"
      ..onClick.listen(reverseText);
 // querySelector("#sample_text_id").text = "wewewewewew";
}

void reverseText(MouseEvent event) {
  var text = querySelector("#sample_text_id").text;
  var buffer = new StringBuffer();
  for (int i = text.length - 1; i >= 0; i--) {
    buffer.write(text[i]);
  }
  querySelector("#sample_text_id").text = buffer.toString();
}

void loadData() {
  var url = "http://127.0.0.1:8081/mock0/agent/QWERTY";

  // call the web server asynchronously
//  var request = HttpRequest.getString(url).then(onDataLoaded);
}



class Jhub1Ajax {
  
  static const String URL = "http://127.0.0.1:8081";
  static const String VERSION = "mock0";
  
  static const String AGENT = "agent";

  void getAgent(String agentID) {
    var buffer = new StringBuffer();
    buffer.write(URL);
    buffer.write("/");
    buffer.write(VERSION);
    buffer.write("/");
    buffer.write(AGENT);
    buffer.write("/");
    buffer.write(agentID);
    var request = HttpRequest.getString(buffer.toString()).then(this.onDataLoaded);
  }
  
  void onDataLoaded(String responseText) {
    var jsonString = responseText;
   // 
   // print(jsonString);
    querySelector("#sample_text_id").text = jsonString;
//  querySelector("#sample_text_id").text = "wewewewewew";
  }
  
}
