import 'package:flutter/material.dart';
import 'package:andromeda/screens/welcome_screen.dart';
import 'package:andromeda/screens/login_screen.dart';
import 'package:andromeda/screens/chat_screen.dart';
import 'package:andromeda/screens/registration_screen.dart';

void main() => runApp(Andromeda());

class Andromeda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
