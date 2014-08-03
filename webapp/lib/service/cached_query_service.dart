library cached_query_service;

import 'dart:html';
import 'dart:async';
import "package:jhub1onlineapi/jhub1onlineapi.dart";
import 'package:angular/angular.dart';


@Injectable()
class CachedQueryService {
  
  Agents _agentsCache;
    
  Future _loadedAgents;
  
  String hello = "helloQQQ";
  JHUB1OnlineServices jhub1online = new JHUB1OnlineServices(new ServicesConfig());
  
  CachedQueryService() {
    jhub1online.getAgentsFuture().then((Agents allAgents) {
                   _agentsCache = allAgents;       
    });
  //  _loaded = Future.wait([_loadAgents(), _loadCategories()]);
  }

  Agents getAgents() {
    return _agentsCache;
//    }
//    return new Future.value(_agentsCache);
  }
  
  JHUB1OnlineServices getAPI() {
    return jhub1online;
  }
  
 // Agents getAgentsX() {
 //   if(_agentsCache == null) {
 //     jhub1online.getAgentsFuture().then((Agents allAgents) {
  //                  _agentsCache = allAgents;       
  //          });
  //  }
  //  while(_agentsCache == null) {}
  //  return _agentsCache;
 // }
  
//  Future _loadAgents() {
//      return jhub1online.getAgentsFuture().then((Agents allAgents) {
 //       _agentsCache = allAgents;       
//      });
//  }
  
  Future<Ping> getPing() {
    return jhub1online.pingFuture();
  }
}
