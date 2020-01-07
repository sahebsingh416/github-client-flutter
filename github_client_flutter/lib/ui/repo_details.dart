import 'package:flutter/material.dart';
import 'package:github_client_flutter/utils/constants.dart';
import 'package:github_client_flutter/utils/localization/localization.dart';
import 'package:github_client_flutter/utils/navigation.dart';


class RepoDetails extends StatefulWidget {
  @override
  _RepoDetailsState createState() => _RepoDetailsState();
}

class _RepoDetailsState extends State<RepoDetails> {
  var _userController = new TextEditingController();
  var _repoController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.black),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  new Positioned(
                    top: MediaQuery.of(context).size.height * 0.15,
                    left: MediaQuery.of(context).size.height * 0.18,
                    child: Image.asset(Constants.GITHUB_LOGO_BLACK),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.45,
                    left: MediaQuery.of(context).size.width * 0.08,
                    right: MediaQuery.of(context).size.width * 0.08,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.20,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _getTextField(Localization.of(context).userName,
                                Localization.of(context).msgUserName,_userController),
                            _getTextField(Localization.of(context).repoName,
                                Localization.of(context).msgRepoName,_repoController),
                          ],
                        ),
                      ),
                    ),
                  ),
                  _getNextButton(),
                ],
              )),
        ),
      ),
    );
  }

  Widget _getTextField(String placeholder, String errorMessage,TextEditingController controller) {
    return TextFormField(
      cursorColor: Colors.black,
      controller: controller,
      decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black))),
      validator: (value) {
        if (value.isEmpty) {
          return errorMessage;
        }
      },
      style: TextStyle(color: Colors.black),
    );
  }

  Widget _getNextButton() {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.6),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.45,
          height: MediaQuery.of(context).size.height * 0.055,
          child: RaisedButton(
            onPressed: () {
              _formKey.currentState.validate()
                  ? NavigationUtils.pushReplacement(context, Constants.ROUTE_HOME,arguments: {"username" : _userController.text,"reponame" : _repoController.text})
                  : Container();
            },
            color: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(
                    (MediaQuery.of(context).size.height * 0.055) / 2),
                side: BorderSide(color: Colors.black)),
            child: Text(
              Localization.of(context).next,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
