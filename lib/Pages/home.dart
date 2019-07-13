import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Category/appetizerPage.dart' as appetizer;
import 'Category/dessertPage.dart' as dessert;
import 'Category/maincoursePage.dart' as maincourse;
import 'package:cooking_app/main.dart' as halau;


class Home extends StatefulWidget {
  const Home({
    Key key,
    @required this.user
  }) : super(key: key);
  final FirebaseUser user;

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  TabController controller;

  @override
  void initState() {
    controller = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(

    appBar: new AppBar(
      backgroundColor: Colors.blue,
      automaticallyImplyLeading: false,
      title: new Text("Cooking FUN!"),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.more_vert), onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => halau.MyApp()),
          );
        },)
      ],
      bottom: new TabBar(
        controller: controller,
          tabs: <Widget>[
            new Tab(text: 'Appetizer',),
            new Tab(text: 'Dessert',),
            new Tab(text: 'MainCourse',),
          ],
      ),
    ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new appetizer.Appetizer(),
          new dessert.Dessert(),
          new maincourse.Maincourse()
        ],
      ),
    );

  }


}

