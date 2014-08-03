
import 'package:logging/logging.dart';
import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:jhub1onlinewebapp/routing/dashboard_router.dart';
import 'package:jhub1onlinewebapp/jhub1app.dart';
import 'package:jhub1onlinewebapp/service/query_service.dart';
import 'package:jhub1onlinewebapp/component/main/agents_component.dart';

Logger _logger = new Logger("demoPage");

void main() {
  Logger.root..level = Level.ALL
             ..onRecord.listen((LogRecord r) { print(r.message); });
  applicationFactory()
      .addModule(new MyAppModule())
      .run();
}

class MyAppModule extends Module {
  MyAppModule() {
    type(JHUB1OnlineMainController);
    type(ViewAgentsComponent);
    type(QueryService);
    value(RouteInitializerFn, jhub1DashboardRouteInitializer);
    factory(NgRoutingUsePushState,
        (_) => new NgRoutingUsePushState.value(false));
  }
}
