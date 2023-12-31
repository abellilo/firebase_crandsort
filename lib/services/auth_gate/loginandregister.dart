import 'package:flutter/material.dart';

import '../../pages/login_page.dart';
import '../../pages/register_page.dart';

class LoginAndRegister extends StatefulWidget {
  const LoginAndRegister({Key? key}) : super(key: key);

  @override
  _LoginAndRegisterState createState() => _LoginAndRegisterState();
}

class _LoginAndRegisterState extends State<LoginAndRegister> {
  bool loginpage = true;

  //toggle function
  void toggle(){
    setState(() {
      loginpage = !loginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(loginpage){
      return LoginPage(onTap: toggle);
    }
    else{
      return RegisterPage(onTap: toggle,);
    }
  }
}
