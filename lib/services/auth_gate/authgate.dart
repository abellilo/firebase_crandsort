import 'package:firebase_cr_sort/pages/login_page.dart';
import 'package:firebase_cr_sort/services/auth_gate/loginandregister.dart';
import 'package:firebase_cr_sort/services/auth_service/auth_services.dart';
import 'package:flutter/material.dart';

import '../../pages/home_page.dart';
import '../../pages/register_page.dart';

class AuthGate extends StatefulWidget {
  AuthGate({Key? key}) : super(key: key);

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().firebaseAuth.authStateChanges(),
      builder: (context,snapshot){
        if(snapshot.hasData){
          return HomePage();
        }else{
          return LoginAndRegister();
        }
      },
    );
  }
}
