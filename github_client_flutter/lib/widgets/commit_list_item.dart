import 'package:flutter/material.dart';
import 'package:github_client_flutter/utils/constants.dart';

class CommitListItem extends StatefulWidget {
  final Map<dynamic, dynamic> commits;
  CommitListItem(this.commits);

  @override
  _CommitListItemState createState() => _CommitListItemState();
}

class _CommitListItemState extends State<CommitListItem> {
  var committedDate;
  bool dataLoaded = false;

  @override
  void initState() {
    super.initState();
    committedDate = widget.commits["commit"]["committer"]["date"];
  }

  @override
  Widget build(BuildContext context) {
    String committerName = widget.commits["committer"] == null
        ? widget.commits["commit"]["author"]["name"]
        : widget.commits["committer"]["login"];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Text(
          //   "Commits on " + committedDate,
          //   style: TextStyle(fontSize: 18, color: Colors.black38),
          // ),
          Container(
            // margin: EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black38, width: 0.5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '"' + widget.commits["commit"]["message"] + '"',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 30,
                          width: 30,
                          color: Colors.grey,
                          child: widget.commits["committer"] != null
                              ? Image.network(
                                  widget.commits["committer"]["avatar_url"],
                                )
                              : Image.asset(Constants.GITHUB_LOGO)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.12,top: MediaQuery.of(context).size.width*0.03),
                      child: Text(
                          committerName + " committed on " + committedDate),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
