library jhub1app_controller;

import 'package:angular/angular.dart';
import 'package:jhub1onlinewebapp/service/cached_query_service.dart';
import 'package:jhub1onlineapi/jhub1onlineapi.dart';
import 'dart:async';
import 'package:logging/logging.dart';

@Controller(
    selector: '[jhub1online-app]',
    publishAs: 'ctrl')
class JHUB1OnlineMainController {

  static const String LOADING_MESSAGE = "Loading app...";
  static const String ERROR_MESSAGE = "Sorry! Problem with loading";
  static const oneSec = const Duration(seconds:2);
  //in case you need to access API
  final CachedQueryService queryService;
  Ping ping;
  Agents agentsList;
  // Determine the initial load state of the app
  String message = LOADING_MESSAGE;
  bool isPageLoaded = false;

  JHUB1OnlineMainController(this.queryService) {
    _logger.fine("controller instantiated");
    isPageLoaded = true;
    message = ERROR_MESSAGE;
    
    agentsList = queryService.getAgents();
   //.then((Agents allAgents) {
   //  agentsList = allAgents;
   // });
        
    new Timer.periodic(oneSec, (timer) => readPingUpdate(timer));
  }
  
  void readPingUpdate(Timer timer){
    queryService.getPing().then((Ping pingObj) {
      ping = pingObj;
    });
  }

  Agents get agents => agentsList == null ? null : agentsList;
  String get status => ping == null ? null : ping.getPingTest();
}

Logger _logger = new Logger("jhub1app_controller");