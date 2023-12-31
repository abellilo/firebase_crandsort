import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cr_sort/components/my_button.dart';
import 'package:firebase_cr_sort/components/my_textfeild.dart';
import 'package:firebase_cr_sort/services/auth_service/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  LoginPage({Key? key, required this.onTap}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void signIn() async{
    if(_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty){
      try{
        //initialize the auth service
        final authService = Provider.of<AuthService>(context, listen: false);
        await authService.signIn(_emailController.text, _passwordController.text);
      } on FirebaseAuthException catch(e){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.code.toString()))
        );
      }
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Fill all fields"))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  //icon image
                  Icon(
                    Icons.ac_unit,
                    size: 100,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //hello again text
                  Text(
                    "HELLO AGAIN",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //welcome back text
                  Text(
                    "Welcome back, you've been missed",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //email textfield
                  MyTextField(
                      controller: _emailController,
                      hintText: "Email",
                      obsucreText: false),
                  const SizedBox(
                    height: 10,
                  ),
                  //password textfield
                  MyTextField(
                      controller: _passwordController,
                      hintText: "Password",
                      obsucreText: true),
                  const SizedBox(
                    height: 20,
                  ),
                  //sign in button
                  MyButton(text: "Sign In", onTap: signIn),
                  const SizedBox(
                    height: 30,
                  ),
                  //not a member register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Not a member?",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14
                      ),),
                      const SizedBox(width: 5,),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text("Register now",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 14
                        ),),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
