library dashboard_routing;

import 'package:angular/angular.dart';

void jhub1DashboardRouteInitializer(Router router, RouteViewFactory views) {
  views.configure({
    'agents': ngRoute(
        path: '/agents',
        view: 'view/agents.html'),
    'endpoints': ngRoute(
        path: '/endpoints',
        view: 'view/endpoints.html'),
    'dashboard': ngRoute(
        defaultRoute: true,
        path: '/dashboard',
        view: 'view/dashboard.html'),
    'types': ngRoute(
        path: '/types',
        view: 'view/types.html')
  });
}