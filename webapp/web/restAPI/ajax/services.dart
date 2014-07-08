library agentsCall;
import 'dart:html';
import 'abstract.dart';
import '../objects/agents.dart';
import '../objects/agent.dart';
import '../objects/user.dart';
import '../objects/endpoint.dart';
import '../objects/endpoints.dart';
import '../objects/endpointtypes.dart';

class JHUB1Services extends Service {
  
  static const String AGENTS = "agents";
  static const String AGENT = "agent";
  
  void getAgents(Function callback(Agents agents)) {
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
  
  void getAgentByID(Function callback(Agent agent), String id) {
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
  
  void getNewEndopints(Function callback(Endpoints endpoints)) {
//    var req = new HttpRequest();
//    req.open('post','http://localhost:8080/darttest/server.php');
//    req.on.readyStateChange.add((e){
//      if (req.readyState == HttpRequest.DONE && req.status == 200){
//        print(req.responseText);
//      }
//   });
//    req.send("jsondata");
  }
  
  void getEndopints(Function callback(Endpoints endpoints)) {
    
  }

  void getEndopintByID(Function callback(Endpoint endpoint), String id) {
    
  }
  
  void getUserByID(Function callback(User user), String id) {
    
  }
  
  void getEndopintTypes(Function callback(EndpointTypes endpointTypes)) {
    
  }
  
  void putEndpoint(Endpoint endpoint) {
    
  }
  
  void putAgent(Agent agent) {
    
  }
  
  void deleteAgents(List<String> agentIDs) {
    
  }
  
  void deleteEndpoints(List<String> endpointIDs) {
    
  }
  
  void deleteNewEndpoints(List<String> newendpointIDs) {
    
  }
}