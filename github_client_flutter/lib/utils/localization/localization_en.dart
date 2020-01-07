import 'package:github_client_flutter/utils/localization/localization.dart';

class LocalizationEN implements Localization {
  @override
  String get github => "GitHub";

  @override
  String get internetNotConnected => "No internet connection";

  @override
  String get msgRepoName => "You cannot have an empty reponame";

  @override
  String get msgUserName => "You cannot have an empty username";

  @override
  String get next => "Next";

  @override
  String get repoName => "Reponame";

  @override
  String get userName => "Username";
  
}