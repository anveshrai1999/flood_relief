import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Donordatapage extends StatefulWidget {
  @override
  _AdmindatapageState createState() => _AdmindatapageState();
}

class _AdmindatapageState extends State<Donordatapage> {
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
        stream: Firestore.instance.collection('donor').snapshots(),
        builder: (context, snapshot) {
          // ignore: missing_return
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
                // ignore: missing_return
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot mypost = snapshot.data.documents[index];
                  return Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
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
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'First Name:${mypost['Firstname']}',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueGrey),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        'Last Name:${mypost['Lastname']}',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueGrey),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        'Email:${mypost['Email']}',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueGrey),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        'Address:${mypost['Address']}',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueGrey),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        'Phone number:${mypost['Phone number']}',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueGrey),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        'Age:${mypost['Age']}',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueGrey),
                                      ),
                                      Text(
                                        'Medicine:${mypost['Medicine']}',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueGrey),
                                      ),
                                      Text(
                                        'Dress:${mypost['Dress']}',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueGrey),
                                      ),
                                      Text(
                                        'Food:${mypost['Food']}',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueGrey),
                                      ),
                                      Text(
                                        'Others:${mypost['Others']}',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueGrey),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                    ],
                  );
                },
              ),
            );
        },
      ),
    );
  }
}
