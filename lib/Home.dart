import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_tab_app/CustomCardView.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TabState();
  }
}
class TabState extends StatefulWidget{
  createState() => TabPage();
}

class Details{
  String type;
  int id;
}

class TabPage extends State<TabState> with SingleTickerProviderStateMixin{

  bool loading = false;
  List<Details> details = [];

  var data =[{
    "id":1,
    "type":"One"
  },
  {
    "id":2,
    "type":"Two"
  },
  {
    "id":3,
    "type":"Three"
  },
  {
    "id":4,
    "type":"Four"
  },{
    "id":5,
    "type":"Five"
  },{
    "id":6,
    "type":"Six"
  }];
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading = true;
    _tabController = TabController(length: data.length, vsync: this);
    for(var i=0; i<data.length; i++){
      Details d = Details();
      d.type = data[i]['type'];
      d.id = data[i]['id'];
      details.add(d);
    }
    Timer(Duration(milliseconds: 1500), (){

      setState(() {
        loading = false;
      });
    });
  }


  List<Widget> _DynamicTab(){
    List<Widget> _widget = [];

    for(var i=0; i<details.length;i++){
      Widget tabBar = Tab(
        child: Container(
          width: 40.0,
          height: 60.0,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.home),
              Text(details[i].type)
            ],
          )
        )
      );
      _widget.add(tabBar);
    }
    return _widget;
  }

  Widget _AppBar(){
    return AppBar(
      bottom: TabBar(
        isScrollable: true,
        indicatorPadding: EdgeInsets.all(0.0),
        indicatorColor: Colors.white,
        tabs: _DynamicTab(),
      ),
      title: Text("Tabs"),
    );
  }

  List<Widget> _TabBarViewList(){
    List<Widget> _list = [];
    for(var i=0; i<details.length; i++){
      Widget tabbarview = TabListView(type: details[i].type,);
      _list.add(tabbarview);
    }
    return _list;
  }
  Widget _TabBarView(){
    return TabBarView(
      children:_TabBarViewList() ,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: details.length,
      child: Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: loading ? null : _AppBar(),
        body: loading ? Center(child: CircularProgressIndicator(),) : _TabBarView()
      )
    );
  }
}

class TabListView extends StatelessWidget{
  String type;
  TabListView({this.type});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        key: PageStorageKey(type),
        itemBuilder: (context,index){
          return  CustomCardView(index: index,type: type,);
        },
        itemCount: 100,
    );
  }
}
