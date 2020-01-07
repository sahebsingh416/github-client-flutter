import 'package:flutter/material.dart';

class CommitListItem extends StatefulWidget {
  @override
  _CommitListItemState createState() => _CommitListItemState();
}

class _CommitListItemState extends State<CommitListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Commits on Jan 21,2019",
              style: TextStyle(fontSize: 18, color: Colors.black38),
            ),
            Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38, width: 0.5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '"Initial Commit"',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: 30,
                                width: 30,
                                color: Colors.grey,
                                child: Image.asset(
                                  "images/github.png",
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Text("sahebsingh committed on Nov 21,2019"),
                          )
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
