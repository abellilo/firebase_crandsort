import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cr_sort/read_data/get_details.dart';
import 'package:firebase_cr_sort/services/auth_service/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> docsId = [];

  //get documents ids
  Future getDocsId() async {
    //declase the firebase instance
    final authService = Provider.of<AuthService>(context, listen: false);
    //declare collections
    await authService.firestore
        .collection("users")
        .orderBy('age', descending: true)
        .get()
        .then((snapshots) => snapshots.docs.forEach((document) {
              print(document.reference);
              docsId.add(document.reference.id);
            }));
  }

  // sign out button
  void signOut() async {
    try {
      //user authservice class to call the sign out
      final authService = Provider.of<AuthService>(context, listen: false);
      await authService.signOut();
    } on FirebaseAuthException catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AuthService().firebaseAuth.currentUser!.email ?? "",
          style: TextStyle(fontSize: 20),
        ),
        actions: [IconButton(onPressed: signOut, icon: Icon(Icons.logout))],
      ),
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
            future: getDocsId(),
            builder: (context, snapshot) {
              return ListView.builder(
                  itemCount: docsId.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: GetDetails(documentId: docsId[index]),
                        tileColor: Colors.grey[200],
                      ),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}
