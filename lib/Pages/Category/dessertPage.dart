import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';


class Dessert extends StatefulWidget {
  @override
  _DessertState createState() => _DessertState();
}

class _DessertState extends State<Dessert> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListPageDessert(),
    );
  }
}

class ListPageDessert extends StatefulWidget {
  @override
  _ListPageDessertState createState() => _ListPageDessertState();
}

class _ListPageDessertState extends State<ListPageDessert> {

  Future _data;
  Future getPosts() async{

    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("dessert").getDocuments();
    return qn.documents;
  }

  navigateToDetail(DocumentSnapshot dessert){
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPageDessert(dessert: dessert)));
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


class DetailPageDessert extends StatefulWidget {

  final DocumentSnapshot dessert;
  DetailPageDessert({this.dessert});


  @override
  _DetailPageDessertState createState() => _DetailPageDessertState();
}

class _DetailPageDessertState extends State<DetailPageDessert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dessert.data["title"]),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Image.network(widget.dessert.data["image"]),
            Image.network(widget.dessert.data["bahan"]),
            Image.network(widget.dessert.data["carabuat"]),

          ],
        ),
      ),
    );
  }

}

