import 'package:flutter/material.dart';
import 'package:sol/ui/pages/auth_page.dart';

class RouteNames {
  static String auth = "/auth";
}

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder> {
  RouteNames.auth : (BuildContext context) => const AuthPage(),
};