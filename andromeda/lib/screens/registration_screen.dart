import 'package:andromeda/constants.dart';
import 'package:andromeda/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:andromeda/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';

class RegistrationScreen extends StatefulWidget {

  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth=FirebaseAuth.instance;
  String email;
  String password;
  String name;
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
            Hero(
              tag: 'logo',
              child: Container(
                height: 100.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(textAlign: TextAlign.center,
              onChanged: (value) {
                name=value;

                //Do something with the user input.
              },
              decoration: InputDecoration(
                hintText: 'Name',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email=value;
                  //Do something with the user input.
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Your Email')),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
                onChanged: (value) {
                  password=value;
                  //Do something with the user input.
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'New Passkey')),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              title: 'Sign Up',
              colour: Colors.blueAccent,
              onPressed: () async{
                //print(name);
                //print(email);
                //print(password);
                //Navigator.pushNamed(context, RegistrationScreen.id);
              try{ final newUser=  await _auth.createUserWithEmailAndPassword(email: email, password: password)    ;
              if(newUser!=null){Navigator.pushNamed(context, ChatScreen.id);}}
              catch(e){
                print(e);
              }},
            ),
          ],
        ),
      ),
    );
  }
}

