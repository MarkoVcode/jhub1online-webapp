library agentsCall;
import 'dart:html';
import 'abstract.dart';
import '../objects/agents.dart';
import '../objects/agent.dart';

class ServiceAgents extends Jhub1Service {
  
  static const String AGENTS = "agents";
  static const String AGENT = "agent";
  
  void get(Function callback(Agents agents)) {
    var buffer = new StringBuffer();
    buffer.write(buildURI());
    buffer.write(AGENTS);
    var request = HttpRequest.getString(buffer.toString()).then((String resp) { 
      //here parse and run callback
      var agents = new Agents.fromJSON(resp);
      callback(agents);
    },
    onError: (e) { 
      var agents = new Agents.error();
      agents.setErrorMessage(e.toString());
      callback(agents);
    });
  }
  
  void getByID(Function callback(Agent agent), String id) {
    var buffer = new StringBuffer();
    buffer.write(buildURI());
    buffer.write(AGENT);
    buffer.write("/");
    buffer.write(id);
    var request = HttpRequest.getString(buffer.toString()).then((String resp) { 
      var agent = new Agent.fromJSON(resp);
      callback(agent);
    },
    onError: (e) { 
      var agent = new Agent.error();
      agent.setErrorMessage(e.toString());
      callback(agent);
   //     throw e;  // The successor is completed with the error e.
    });
  }

}