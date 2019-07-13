import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';


class Appetizer extends StatefulWidget {
  @override
  _AppetizerState createState() => _AppetizerState();
}

class _AppetizerState extends State<Appetizer> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListPageAppetizer(),
    );
  }
}

class ListPageAppetizer extends StatefulWidget {
  @override
  _ListPageAppetizerState createState() => _ListPageAppetizerState();
}

class _ListPageAppetizerState extends State<ListPageAppetizer> {

  Future _data;
  Future getPosts() async{

    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("appetizer").getDocuments();
    return qn.documents;
  }

  navigateToDetail(DocumentSnapshot appetizer){
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPageAppetizer(appetizer: appetizer)));
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


class DetailPageAppetizer extends StatefulWidget {

  final DocumentSnapshot appetizer;
  DetailPageAppetizer({this.appetizer});


  @override
  _DetailPageAppetizerState createState() => _DetailPageAppetizerState();
}

class _DetailPageAppetizerState extends State<DetailPageAppetizer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appetizer.data["title"]),
      ),
      body: Container(
          child: ListView(
            children: <Widget>[
              Image.network(widget.appetizer.data["image"]),
              Image.network(widget.appetizer.data["bahan"]),
              Image.network(widget.appetizer.data["carabuat"]),
            ],
          ),
      ),
    );
  }

}

