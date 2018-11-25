import 'package:flutter/material.dart';
import "Home.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home:HomePage(),
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
        accentColor: Colors.blueGrey
      ),
    );
  }
}


class Demo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("TEST"),
        elevation: 0.0,
      ),
      body: Card(
        elevation: 2.0,
        child: Container(
          padding: EdgeInsets.all(5.0),
          width: MediaQuery.of(context).size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 5.0,left: 5.0,right: 5.0),
                  child: Container(
                    height: 50.0,
                    child: Text("jello"),
                  ),
                )
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0,right: 5.0),
                child: Container(
                  width: 50.0,
                  child: InkResponse(
                    onTap: (){},
                    child: Icon(Icons.home),
                  )
                ),
              )
            ],
          ),
        )
      )
    );
  }
}