import 'package:flutter/material.dart';
import 'package:github_client_flutter/services/services.dart';
import 'package:github_client_flutter/ui/home.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => Services.create(),
      dispose: (_, Services service) => service.client.dispose(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
