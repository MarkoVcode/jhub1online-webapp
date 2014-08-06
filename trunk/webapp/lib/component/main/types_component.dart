library view_types_component;

import 'package:angular/angular.dart';
import "package:jhub1onlineapi/jhub1onlineapi.dart";
import 'package:jhub1onlinewebapp/service/query_service.dart';
import 'package:logging/logging.dart';

@Component(
    selector: 'view-types',
    templateUrl: 'packages/jhub1onlinewebapp/component/main/types_component.html',
    cssUrl: 'packages/jhub1onlinewebapp/component/main/types_component.css',
    publishAs: 'cmp')
class ViewTypesComponent {
  @NgOneWay('ping-object')
  Ping pingObj;

  //all agents will be stored here
  Types typesObj;
  
  //loading indicator - initial value true - because it is loading at start
  bool loading = true;

  //this is the API for Restful service
  JHUB1OnlineServices jhub1online;
  
  //accessor for the agents - 'agentsList' - this is used in the template 
  List<EpType> get typesList => typesObj == null ? null : typesObj.getTypes();

  String get pingStatus => pingObj == null ? null : pingObj.getPingTest();
  
  //accessor for loading indicator - see template for agentsLoading
  bool get typesLoading => loading;
  
  ViewTypesComponent(RouteProvider routeProvider, QueryService queryService) {
    //log line - output to console
    _logger.fine("ViewTypesComponent: component instantiated");
    
    //queryService - holds our API instantiated in the service
    jhub1online = queryService.getAPI();
    
    // getting all agents with the call back to setAgents
    jhub1online.getTypesFuture().then((types) => setTypes(types));
  }
  
  void setTypes(Types types) {
    //template picks this automatically when ready
    typesObj = types;
    loading = false;
  }
  
  void reloadTypes() {
    //this is demo for reload button/link please note that reload is loaded from server not cache and is using the same callback
    loading = true;
    jhub1online.getTypesFuture(invalidateCache: true).then((types) => setTypes(types));
  }
}

Logger _logger = new Logger("view_types_component");