import 'package:flutter/material.dart';
import 'package:github_client_flutter/components/commit_list_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu,color: Colors.white,),//Container(height: 2,width: 2,child: Image.asset("images/github.png",fit: BoxFit.fitHeight,)),
        backgroundColor: Colors.black,
        title: Text("GitHub"),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh,color: Colors.white,),
            onPressed: (){},
          )
        ],
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: 10,
            primary: true,
            itemBuilder: (context, int index) {
              return CommitListItem();
            },
          )),
    );
  }
}
