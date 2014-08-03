library view_agents_component;

import 'package:angular/angular.dart';
import "package:jhub1onlineapi/jhub1onlineapi.dart";
import 'package:jhub1onlinewebapp/service/cached_query_service.dart';
import 'package:logging/logging.dart';

@Component(
    selector: 'view-agents',
    templateUrl: 'packages/jhub1onlinewebapp/component/main_agents_component.html',
    cssUrl: 'packages/jhub1onlinewebapp/component/main_agents_component.css',
    publishAs: 'cmp')
class ViewAgentsComponent {
  @NgOneWay('agents-obj')
  Agents agentsObjx;
  
  Agents agentsObj;
  
  bool loading = true;
  
  String hello;
  Agents agentsListLocal;

  JHUB1OnlineServices jhub1online;
  
  Agents get agents => agentsListLocal == null ? null : agentsListLocal;
  
  List<Agents> get agentsList => agentsObj == null ? null : agentsObj.getAgents();

  bool get agentsLoading => loading;
  
  String get helloString => hello == null ? null : hello;
  
  ViewAgentsComponent(RouteProvider routeProvider, CachedQueryService queryService) {
    _logger.fine("component instantiated");
    jhub1online = queryService.getAPI();
    jhub1online.agentsAPI.findAll().then((agents) => setAgents(agents));
  }
  
  void setAgents(Agents agents) {
    agentsObj = agents;
    loading = false;
  }
  
  void reloadAgents() {
    loading = true;
    jhub1online.agentsAPI.findAll(true).then((agents) => setAgents(agents));
  }
}

Logger _logger = new Logger("view_agents_component");