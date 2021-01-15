import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Resuelocations extends StatefulWidget {
  @override
  _ResuelocationsState createState() => _ResuelocationsState();
}

class _ResuelocationsState extends State<Resuelocations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Row(
            children: <Widget>[
              Image.asset(
                'lib/img/floodimg.png',
                fit: BoxFit.cover,
                height: 50,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'FLOOD APP',
                style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontSize: 35),
              ),
            ],
          ),
        ),
        body: StreamBuilder(
          stream: Firestore.instance.collection('location').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              const Text('Loading');
            }
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.lightGreenAccent, Colors.yellowAccent],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft),
              ),
              child: ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot mypost = snapshot.data.documents[index];
                    return Stack(children: <Widget>[
                      Column(children: <Widget>[
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: 350.0,
                            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Material(
                                color: Colors.white,
                                elevation: 14.0,
                                shadowColor: Colors.grey,
                                child: Center(
                                    child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(children: <Widget>[
                                          Text(
                                            'Latitude:${mypost['latitude']}',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blueGrey),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(
                                            'Longitude:${mypost['longitude']}',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blueGrey),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                        ])))))
                      ]),
                      Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .47,
                          left: MediaQuery.of(context).size.height * .52,
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 20.0,
                            ),
                          ),
                        ),
                      )
                    ]);
                  }),
            );
          },
        ));
  }
}
