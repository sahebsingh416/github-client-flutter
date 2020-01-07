import 'package:flutter/material.dart';
import 'package:github_client_flutter/utils/navigation.dart';
import 'package:github_client_flutter/widgets/commit_list_item.dart';
import 'package:github_client_flutter/services/services.dart';
import 'package:github_client_flutter/utils/constants.dart';
import 'package:github_client_flutter/utils/localization/localization.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  final String username;
  final String reponame;
  HomeScreen(this.username, this.reponame);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool dataLoaded = false;

  Future callCommitAPi() async {
    await Provider.of<Services>(context, listen: false)
        .getCommits(widget.username, widget.reponame);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      callCommitAPi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
            child: Image.asset(
              Constants.GITHUB_LOGO,
              fit: BoxFit.fitHeight,
            ),
          ),
          onTap: () {
            NavigationUtils.pushReplacement(
                context, Constants.ROUTE_REPO_DETAILS);
          },
        ),
        backgroundColor: Colors.black,
        title: Text(Localization.of(context).github),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {});
              // final response =
              //   await Provider.of<Services>(context,listen: false).getCommits(widget.username,widget.reponame);
            },
          )
        ],
      ),
      body: _buildBody(context, widget.username, widget.reponame),
    );
  }
}

FutureBuilder _buildBody(
    BuildContext context, String username, String reponame) {
  return FutureBuilder(
    future: Provider.of<Services>(context).getCommits(username, reponame),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        try {
          List<dynamic> commits = json.decode(snapshot.data.bodyString);
          return buildUser(commits, context);
        } catch (e) {
          return Container(
            child: Center(
              child: Text("data"),
            ),
          );
        }
      } else {
        return Container(
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.black,
            ),
          ),
        );
      }
    },
  );
}

Builder buildUser(List<dynamic> commits, BuildContext context) {
  return Builder(
    builder: (context) => Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: commits.length,
          primary: true,
          itemBuilder: (context, int index) {
            return CommitListItem(commits[index]);
          },
        )),
  );
}
