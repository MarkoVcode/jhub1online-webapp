library jhub1app_controller;

import 'package:angular/angular.dart';
import 'package:jhub1onlinewebapp/service/query_service.dart';
import 'package:jhub1onlineapi/jhub1onlineapi.dart';
import 'dart:async';
import 'package:logging/logging.dart';

@Controller(
    selector: '[jhub1online-app]',
    publishAs: 'ctrl')
class JHUB1OnlineMainController {

  static const String LOADING_MESSAGE = "Loading app...";
  static const String ERROR_MESSAGE = "Sorry! Problem with loading.";
  static const String ERROR_CONNECTION = "Looks like connection is lost.";
  static const String WORKING = "App is working";
  
  //timer for ping - every 2 sec.
  static const twoSec = const Duration(seconds:2);
  
  //our access to JHUB1 API
  final QueryService queryService;

  Ping ping;
  Agents menuAgents;
  String message = LOADING_MESSAGE;
  bool isPageLoaded = false;

  JHUB1OnlineMainController(this.queryService) {
    _logger.fine("JHUB1OnlineMainController: controller instantiated");
    isPageLoaded = true;
    message = ERROR_MESSAGE;
    
    //get agents for sub menu
    queryService.getAPI().getAgentsFuture().then((Agents agents) {
      menuAgents = agents;  
    });
    
    new Timer.periodic(twoSec, (timer) => readPingUpdate(timer));
  }
  
  void readPingUpdate(Timer timer){
    queryService.getAPI().pingFuture().then((Ping pingObj) {
      ping = pingObj;
    });
  }
  
  String getAppCondition() {
    if(ping != null) {
      if(ping.hasError()) {
        return ERROR_CONNECTION;
      }
    }
    return WORKING;
  }

  String get status => ping == null ? null : ping.getPingTest();
  List<Agents> get menuAgentsList => menuAgents == null ? null : menuAgents.getAgents();
}

Logger _logger = new Logger("jhub1app_controller");