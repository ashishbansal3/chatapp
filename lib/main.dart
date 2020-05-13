import 'package:flutter/material.dart';
import './screens/Auth_screens/auth.dart';
import './screens/Auth_screens/signupwithemail.dart';
import './screens/Auth_screens/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './screens/chat_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  const MyApp({Key key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<FirebaseUser>(
          stream: FirebaseAuth.instance.onAuthStateChanged.distinct(),
          builder: (BuildContext context, snapshot) {
            print("onAuthStateChanged ${snapshot.hasData}");
            return !snapshot.hasData ? Auth() : ChatScreen();
          }),
      routes: {
        SignUpWithEmail.routeName: (ctx) => SignUpWithEmail(),
        SignIn.routeName: (ctx) => SignIn(),
      },
    );
  }
}
