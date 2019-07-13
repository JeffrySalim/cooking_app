import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';


class Maincourse extends StatefulWidget {
  @override
  _MaincourseState createState() => _MaincourseState();
}

class _MaincourseState extends State<Maincourse> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListPageMaincourse(),
    );
  }
}

class ListPageMaincourse extends StatefulWidget {
  @override
  _ListPageMaincourseState createState() => _ListPageMaincourseState();
}

class _ListPageMaincourseState extends State<ListPageMaincourse> {

  Future _data;
  Future getPosts() async{

    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("maincourse").getDocuments();
    return qn.documents;
  }

  navigateToDetail(DocumentSnapshot maincourse){
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPageMaincourse(maincourse: maincourse)));
  }

  @override
  void initState() {
    super.initState();
    _data = getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: _data,
          builder: (_, snapshot){

            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: Text("Loading..."),
              );
            }else{
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index){

                    return Card(
                        child:ListTile(
                          leading: Icon(Icons.fiber_manual_record),
                          title: Text(snapshot.data[index].data["title"],
                            style: TextStyle(fontSize: 18.0),),
                          trailing: Icon(Icons.arrow_forward),
                          onTap: () => navigateToDetail(snapshot.data[index]),
                          dense: true,
                        ));
                  });
            }

          }),
    );
  }
}


class DetailPageMaincourse extends StatefulWidget {

  final DocumentSnapshot maincourse;
  DetailPageMaincourse({this.maincourse});


  @override
  _DetailPageMaincourseState createState() => _DetailPageMaincourseState();
}

class _DetailPageMaincourseState extends State<DetailPageMaincourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.maincourse.data["title"]),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Image.network(widget.maincourse.data["image"]),
            Image.network(widget.maincourse.data["bahan"]),
            Image.network(widget.maincourse.data["carabuat"]),

          ],
        ),
      ),
    );
  }

}

