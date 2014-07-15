import 'dart:html';
import "package:JHUB1OnlineRestfulAPI/jhub1_online_restful_api.dart";

void main() {
  
 var jhub1online = new JHUB1OnlineServices();
 
 jhub1online.getAgentByID((agent) => doShitWithMyAgent(agent), "A-1E6B9-5P8TQ-HJ9JKDL0Y.733");
 jhub1online.getAgents((agents) => doShitWithMyAgents(agents));

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

//Call backs for  agents:

void doShitWithMyAgents(Agents agents) {
  //always check the error - you do not have to handle it nicely right now but we will have to later
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
