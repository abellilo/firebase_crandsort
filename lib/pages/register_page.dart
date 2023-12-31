import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cr_sort/services/auth_service/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_button.dart';
import '../components/my_textfeild.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  RegisterPage({Key? key, required this.onTap}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _ageController = TextEditingController();

  //sign out
  void signUp() async {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _confirmpasswordController.text.isNotEmpty) {
      if (_passwordController.text == _confirmpasswordController.text) {
        try {
          //initialiaze the firebase auth
          final authService = Provider.of<AuthService>(context, listen: false);
          //call the register function
          await authService.registerUser(
              _emailController.text, _passwordController.text);
          await authService.addUser(
              _firstnameController.text, _lastnameController.text,
              _emailController.text, int.parse(_ageController.text));
        } on FirebaseAuthException catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(e.code))
          );
        }
      }
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
                  //hello again text
                  Text(
                    "HELLO DEAR",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //welcome back text
                  Text(
                    "Register below with your details",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //firstname
                  MyTextField(
                      controller: _firstnameController,
                      hintText: "First Name",
                      obsucreText: false),
                  const SizedBox(
                    height: 10,
                  ),
                  //lastname
                  MyTextField(
                      controller: _lastnameController,
                      hintText: "Last Name",
                      obsucreText: false),
                  const SizedBox(
                    height: 10,
                  ),
                  //age
                  MyTextField(
                      controller: _ageController,
                      hintText: "Age",
                      obsucreText: false),
                  const SizedBox(
                    height: 10,
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
                    height: 10,
                  ),
                  //password textfield
                  MyTextField(
                      controller: _confirmpasswordController,
                      hintText: "Confirm Password",
                      obsucreText: true),
                  const SizedBox(
                    height: 20,
                  ),
                  //sign in button
                  MyButton(text: "Sign Up", onTap: signUp),
                  const SizedBox(
                    height: 30,
                  ),
                  //not a member register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already a member?",
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
