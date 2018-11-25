import 'package:flutter/material.dart';
import 'package:share/share.dart';

class CustomCardView extends StatelessWidget {
  int index;
  String type;

  CustomCardView({this.index, this.type});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        elevation: 2.0,
        child: Container(
          padding: EdgeInsets.only(top: 5.0,left: 5.0),
          width: MediaQuery.of(context).size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 5.0,left: 5.0,right: 5.0),
                    child: Container(
                      height: 50.0,
                      child: Text("$index hello $type "),
                    ),
                  )
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Container(
                    width: 50.0,
                    child: InkResponse(
                      onTap: (){
                        Share.share("hello $index");
                      },
                      child: Icon(Icons.share),
                    )
                ),
              )
            ],
          ),
        )
    );
  }
}
