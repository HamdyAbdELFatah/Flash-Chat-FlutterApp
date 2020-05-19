import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/my_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  static String id='login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email,password;
  FirebaseAuth auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',

                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                email=value;
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your email.'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              onChanged: (value) {
                password=value;
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your password.'),
            ),
            SizedBox(
              height: 24.0,
            ),
            MyButton(title: 'Log In', color: loginButtonColor,
              onPressed: () async{
              try {
                showAlertDialog(context);
                final user = await auth.signInWithEmailAndPassword(
                    email: email, password: password);
                Navigator.pop(context);
                if (user != null)
                  Navigator.pushNamed(context, ChatScreen.id);
                else {
                  Navigator.pop(context);
                }
              }catch(e){
                Navigator.pop(context);
                print(e);
              }
              },
            ),
          ],
        ),
      ),
    );
  }
}


