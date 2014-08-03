library query_service;

import "package:jhub1onlineapi/jhub1onlineapi.dart";
import 'package:angular/angular.dart';

@Injectable()
class QueryService {

  JHUB1OnlineServices jhub1online = new JHUB1OnlineServices(new ServicesConfig());
  
  QueryService();
 
  JHUB1OnlineServices getAPI() {
    return jhub1online;
  }
}
