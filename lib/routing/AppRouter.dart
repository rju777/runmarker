import 'package:auto_route/auto_route.dart';
import 'package:markrun/routing/AppRouter.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter{
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LaunchRoute.page,initial: true)
  ];
}