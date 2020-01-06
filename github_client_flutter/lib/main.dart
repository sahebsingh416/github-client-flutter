import 'package:flutter/material.dart';
import 'package:github_client_flutter/ui/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Client Flutter',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
