import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirstSemNote extends StatelessWidget {
  const FirstSemNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('first').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final List<DocumentSnapshot> documents = snapshot.data!.docs;
                return ListView(
                    children: documents
                        .map((doc) => Card(
                              child: ListTile(
                                title: Text(doc['name']),
                              ),
                            ))
                        .toList());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Error"),
                );
              } else {
                return Center(
                  child: Text("Loading"),
                );
              }
            }));
  }
}
