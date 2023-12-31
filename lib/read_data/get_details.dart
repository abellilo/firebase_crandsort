import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetDetails extends StatelessWidget {
  final String documentId;

  GetDetails({Key? key, required this.documentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection("users");

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder: (context, snapshots) {
          if (snapshots.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshots.data!.data() as Map<String, dynamic>;
            return Text('${data['first name']} ${data['last name']} ${data['age']} years old');
          }
          return Text("loading...");
        });
  }
}
