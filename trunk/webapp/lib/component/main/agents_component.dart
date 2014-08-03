library view_agents_component;

import 'package:angular/angular.dart';
import "package:jhub1onlineapi/jhub1onlineapi.dart";
import 'package:jhub1onlinewebapp/service/query_service.dart';
import 'package:logging/logging.dart';

@Component(
    selector: 'view-agents',
    templateUrl: 'packages/jhub1onlinewebapp/component/main/agents_component.html',
    cssUrl: 'packages/jhub1onlinewebapp/component/main/agents_component.css',
    publishAs: 'cmp')
class ViewAgentsComponent {
  //all agents will be stored here
  Agents agentsObj;
  
  //loading indicator - initial value true - because it is loading at start
  bool loading = true;

  //this is the API for Restful service
  JHUB1OnlineServices jhub1online;
  
  //accessor for the agents - 'agentsList' - this is used in the template 
  List<Agents> get agentsList => agentsObj == null ? null : agentsObj.getAgents();

  //accessor for loading indicator - see template for agentsLoading
  bool get agentsLoading => loading;
  
  ViewAgentsComponent(RouteProvider routeProvider, QueryService queryService) {
    //log line - output to console
    _logger.fine("ViewAgentsComponent: component instantiated");
    
    //queryService - holds our API instantiated in the service
    jhub1online = queryService.getAPI();
    
    // getting all agents with the call back to setAgents
    jhub1online.getAgentsFuture().then((agents) => setAgents(agents));
  }
  
  void setAgents(Agents agents) {
    //template picks this automatically when ready
    agentsObj = agents;
    loading = false;
  }
  
  void reloadAgents() {
    //this is demo for reload button/link please note that reload is loaded from server not cache and is using the same callback
    loading = true;
    jhub1online.getAgentsFuture(invalidateCache: true).then((agents) => setAgents(agents));
  }
}

Logger _logger = new Logger("view_agents_component");