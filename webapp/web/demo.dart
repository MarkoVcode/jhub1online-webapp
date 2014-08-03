import 'dart:html';
import "package:jhub1onlineapi/jhub1onlineapi.dart";
import 'package:logging/logging.dart';
import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:jhub1onlinewebapp/routing/jhub1_dashboard_router.dart';
import 'package:jhub1onlinewebapp/jhub1app.dart';
import 'package:jhub1onlinewebapp/service/cached_query_service.dart';
import 'package:jhub1onlinewebapp/component/main_agents_component.dart';
import 'dart:async';

Logger _logger = new Logger("demoPage");

void main() {
  Logger.root..level = Level.ALL
             ..onRecord.listen((LogRecord r) { print(r.message); });
  applicationFactory()
      .addModule(new MyAppModule())
      .run();
  
  
// var jhub1online = new JHUB1OnlineServices();
 //so far two methods are implemented:
 // retrieving single agent by id
 //jhub1online.getAgentByID((agent) => doShitWithMyAgent(agent), "A-1E6B9-5P8TQ-HJ9JKDL0Y.733");
 
 ///Future<Agent> agent = jhub1online.getAgentByIDFuture("A-1E6B9-5P8TQ-HJ9JKDL0Y.733");
// agent.then((agent) => doShitWithMyAgent(agent));

 // retrieving all agents 
 //jhub1online.getAgents((agents) => doShitWithMyAgents(agents));
 
// Future<Agents> agents = jhub1online.getAgentsFuture();
// agents.then((agents) => doShitWithMyAgents(agents));
 
 //You need to provide callbacks for both of them 

 //Methods to get values of the endpoins
 //jhub1online.getValuesByAgentName((values) => doShitWithMyValues(values), "tt56rsnixh");
 //jhub1online.getNewValues((values) => doShitWithMyValues(values));
 
 //Default click listener
 // querySelector("#sample_text_id")
 //     ..text = "Click me!"
 //     ..onClick.listen(reverseText);
}

class MyAppModule extends Module {
  MyAppModule() {
    type(JHUB1OnlineMainController);
    type(ViewAgentsComponent);
    type(CachedQueryService);
    value(RouteInitializerFn, jhub1DashboardRouteInitializer);
    factory(NgRoutingUsePushState,
        (_) => new NgRoutingUsePushState.value(false));
  }
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
    querySelector("#sample_text_id_link").text = agent.getLinks().first.getHref();
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