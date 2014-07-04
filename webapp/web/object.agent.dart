library agent;
import 'dart:convert';

class Agent {
  
  String id;
  DateTime created;
  String status;
  DateTime updated;
  String name;
  String icon;
  String color;
  String description;
  int sorder;
  String buildid;
  DateTime builddate;

  Agent(String agentJsonString) {
    Map parsedMap = JSON.decode(agentJsonString);
    id = parsedMap["id"];
    status = parsedMap["status"];
    name = parsedMap["name"];
    icon = parsedMap["icon"];
    color = parsedMap["color"];
    description = parsedMap["description"];
    buildid = parsedMap["buildid"];
  }

  String getID() {
    return id;
  }
  
  String getStatus() {
    return status;
  }
  String getName() {
    return name;
  }
  
  String getIcon() {
    return icon;
  }
  
  String getColor() {
    return color;
  }
  
  String getDescription() {
    return description;
  }
  
  String getBuildId() {
    return buildid;
  }
}

class Agents {
  List agents; 
  int total = 100;
  String something;
  
  int getTotal() {
    return total;
  }
  String getRubbish() {
    return "RUBBISH";
  }
  String getSomething() {
    return something;
  }
  void setSomething(String value) {
    something = value;
  }
}
