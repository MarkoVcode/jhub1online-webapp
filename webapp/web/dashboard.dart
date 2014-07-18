import 'dart:html';
import "package:jhub1onlinerestfulapi/jhub1_online.dart";

void main() {
  
 var jhub1online = new JHUB1OnlineServices();
 
 //so far two methods are implemented:
 // retrieving single agent by id
 jhub1online.getAgentByID((agent) => doShitWithMyAgent(agent), "A-1E6B9-5P8TQ-HJ9JKDL0Y.733");
 // retrieving all agents 
 jhub1online.getAgents((agents) => doShitWithMyAgents(agents));
 //You need to provide callbacks for both of them 

 //Methods to get values of the endpoins
 jhub1online.getValuesByAgentName((values) => doShitWithMyValues(values), "tt56rsnixh");
 //jhub1online.getNewValues((values) => doShitWithMyValues(values));
 
 //Default click listener
  querySelector("#sample_text_id")
      ..text = "Click me!"
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

//Callbacks for  agents:

void doShitWithMyAgents(Agents agents) {
  //always check the error - you do not have to handle it nicely right now but we will have to later
  // you can excercise error by changing SoapUI settings to return 404 
  if(agents.hasError()) {
    querySelector("#sample_text_id_agents").text = "ERROR!!!!!!!!!!"; 
  } else {
    var buffer = new StringBuffer();
    List<Agent> agentsList = agents.getAgents();
    for(Agent agent in agentsList) {
      buffer.write("<div style=\"background-color:");
      buffer.write(agent.getColor());
      buffer.write(";\">");
      buffer.write(agent.getName());
      buffer.write("</div>");
    } 
    querySelector("#sample_text_id_agents").appendHtml(buffer.toString());
  }
}

void doShitWithMyAgent(Agent agent) {
  
  if(agent.hasError()) {
    querySelector("#sample_text_id").text = agent.getError().request.status.toString();
  } else {
    querySelector("#sample_text_id").text = agent.getColor();
    querySelector("#sample_text_id_link").text = agent.getLink().getHref();
  }
}

void doShitWithMyValues(Values values) {
  //always check the error - you do not have to handle it nicely right now but we will have to later
  // you can excercise error by changing SoapUI settings to return 404 
  if(values.hasError()) {
    querySelector("#sample_text_id_values").text = "ERROR!!!!!!!!!!"; 
  } else {
    var buffer = new StringBuffer();
    List<Value> valuesList = values.getValues();
    for(Value value in valuesList) {
      buffer.write("<div style=\"background-color:");
      buffer.write(value.getName());
      buffer.write(";\">");
      buffer.write(value.getName());
      buffer.write("</div>");
    } 
    querySelector("#sample_text_id_values").appendHtml(buffer.toString());
  }
}