import 'package:flutter/material.dart';
import 'package:github_client_flutter/ui/home.dart';
import 'package:github_client_flutter/ui/repo_details.dart';
import 'package:github_client_flutter/utils/constants.dart';

class NavigationUtils {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String,String> args = settings.arguments;
    switch (settings.name) {
      case Constants.ROUTE_HOME:
        final username = args["username"];
        final reponame = args["reponame"];
        return MaterialPageRoute(builder: (_) => HomeScreen(username,reponame));
      case Constants.ROUTE_REPO_DETAILS:
        return MaterialPageRoute(builder: (_) => RepoDetails());
      default:
        return _errorRoute(" Comming soon...");
    }
  }

  static Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
          appBar: AppBar(title: Text('Error')),
          body: Center(child: Text(message)));
    });
  }

  static void pushReplacement(BuildContext context, String routeName,
      {Object arguments}) {
    Navigator.of(context).pushReplacementNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> push(BuildContext context, String routeName,
      {Object arguments}) {
    return Navigator.of(context).pushNamed(routeName, arguments: arguments);
  }

  static void pop(BuildContext context, {dynamic args}) {
    Navigator.of(context).pop(args);
  }

  static Future<dynamic> pushAndRemoveUntil(
      BuildContext context, String routeName,
      {Object arguments}) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: arguments);
  }
}
