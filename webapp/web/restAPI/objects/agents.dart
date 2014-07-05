library agents;
import 'dart:convert';
import 'agent.dart';
import 'response.dart';

class Agents extends Response {

  List<Agent> agents; 
  int total;
 
  Agents.error() {}
  
  Agents.fromJSON(String json){
    Map parsedMap = JSON.decode(json);
    total = parsedMap["total"];
    agents = new List();
    for(Map agentMap in parsedMap["agents"]) {
      agents.add(new Agent.fromMap(agentMap));
    }
  }
  
  int getTotal() {
    return total;
  }

  List<Agent> getAgents() {
    return agents;
  }
}
