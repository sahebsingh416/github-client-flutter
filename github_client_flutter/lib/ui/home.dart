import 'package:flutter/material.dart';
import 'package:github_client_flutter/components/commit_list_item.dart';
import 'package:github_client_flutter/model/gitcommit.dart';
import 'package:github_client_flutter/services/services.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

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
            onPressed: () async {
              final response =
                await Provider.of<Services>(context,listen: false).getCommits("sahebsingh416","digital_clock");
            },
          )
        ],
      ),
      body: _buildBody(context)
      
    );
  }
}

FutureBuilder _buildBody(BuildContext context){
  return FutureBuilder(
    future: Provider.of<Services>(context).getCommits("sahebsingh416","digital_clock"),
    builder: (context,snapshot){
      if(snapshot.connectionState == ConnectionState.done){
        List<dynamic> user = json.decode(snapshot.data.bodyString);
        // print(user[1]["commit"]["message"]);
        return buildUser(user[0]["committer"]["avatar_url"],context);
        
      }else{
        return Container();
      }
    },
  );
}
Builder buildUser(String url,BuildContext context) {
  return Builder(
    builder: (context)=>Container(child: Center(child: Image.network(url),),),    
  );
}
// Container(
      //     height: MediaQuery.of(context).size.height,
      //     child: ListView.builder(
      //       itemCount: 10,
      //       primary: true,
      //       itemBuilder: (context, int index) {
      //         return CommitListItem();
      //       },
      //     )),