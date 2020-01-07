import 'package:flutter/material.dart';
import 'package:github_client_flutter/services/services.dart';
import 'package:github_client_flutter/ui/repo_details.dart';
import 'package:github_client_flutter/utils/localization/localization.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Provider(
      create: (_) => Services.create(),
      dispose: (_, Services service) => service.client.dispose(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            const MyLocalizationsDelegate(),
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en', ''),
            // const Locale('es', ''),
          ],
          home: RepoDetails()),
    );
  }
}
