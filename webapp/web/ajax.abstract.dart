import 'dart:html';
import 'object.agent.dart';

abstract class Jhub1Service {
  
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

class ServiceAgents extends Jhub1Service {
  
  static const String AGENTS = "agents";
  
  String buildURI() {
    var buffer = new StringBuffer();
    buffer.write(super.buildURI());
    buffer.write(AGENTS);
    return buffer.toString();
  }

  void get(Function callback(Agents agents)) {
    var request = HttpRequest.getString(buildURI()).then((String resp) { 
      //here parse and run callback
      var agents = new Agents();
      agents.setSomething("ble");
      callback(agents);
    },
    onError: (e) { 
      // Invoked when the future is completed with an error.
    //  if (canHandle(e)) {
    //    return 499;  // The successor is completed with the value 499.
    //  } else {
        throw e;  // The successor is completed with the error e.
    //  }
    });
  }
  
  void onDataLoaded(String responseText) {
    var jsonString = responseText;
   // print(jsonString);
    querySelector("#sample_text_id").text = jsonString;
//  querySelector("#sample_text_id").text = "wewewewewew";
  }
}


class ServiceAgent extends Jhub1Service {
  
  static const String AGENT = "agent";
  
  String buildURI() {
    var buffer = new StringBuffer();
    buffer.write(super.buildURI());
    buffer.write(AGENT);
    return buffer.toString();
  }
  
  void getByID(Function callback(Agents agents), String id) {
    var request = HttpRequest.getString(buildURI()).then(this.onDataLoaded);
  }
  
  void onDataLoaded(String responseText) {
    var jsonString = responseText;
   // print(jsonString);
    querySelector("#sample_text_id").text = jsonString;
//  querySelector("#sample_text_id").text = "wewewewewew";
  }
}