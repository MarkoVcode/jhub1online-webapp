import 'dart:html';
import 'restAPI/ajax/agents.dart';
import 'restAPI/objects/agent.dart';
import 'restAPI/objects/agents.dart';


void main() {
  var ajax = new ServiceAgents();
  ajax.getByID(doShitWithMyAgent, "A-1E6B9-5P8TQ-HJ9JKDL0Y.733");
  ajax.get(doShitWithMyAgents);
  
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

void doShitWithMyAgents(Agents agents) {
  if(agents.hasError()) {
    querySelector("#sample_text_id_agents").text = agents.getErrorMessage(); 
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
    querySelector("#sample_text_id").text = "ERROR";
  } else {
    querySelector("#sample_text_id").text = agent.getColor();
    querySelector("#sample_text_id_link").text = agent.getLink().getHref();
  }
}

