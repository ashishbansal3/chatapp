import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:html/parser.dart';

import '.././../widgets/Auth_widgets/signup.dart';

class SignUpWithEmail extends StatefulWidget {
  @override
  static const routeName = '/sign-up';
  _SignUpWithEmailState createState() => _SignUpWithEmailState();
}

class _SignUpWithEmailState extends State<SignUpWithEmail> {
  final _auth = FirebaseAuth.instance;
  

  void _submitAuthForm(
    String email,
    String password,
    String username,
    String city1,
    String city2,
    BuildContext ctx,
  ) async {
    AuthResult authResult;

    try {
    
      authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
       await Firestore.instance.collection('groups').document(city1+city2).setData({
        'username': username,
        'id': authResult.user.uid,
      });
      // int a = int.parse(city1.substring(0, 1));
      // int b = int.parse(city2.substring(0, 1));
      // print(a);
      // print(b);
      
      // String key =
      //     int.parse(city1.substring(0, 1)) > int.parse(city2.substring(0, 1))
      //         ? city2 + city1
      //         : city1 + city2;
      // print(key);        
      // await Firestore.instance.collection('groups').document(key).setData({
      //   'username': username,
      //   'id': authResult.user.uid,
      // });

      await Firestore.instance
          .collection('users')
          .document(authResult.user.uid)
          .setData({
        'username': username,
        'email': email,
        'city1': city1,
        'city2': city2,
      });
    } on PlatformException catch (err) {
      var message = 'An error occurred, pelase check your credentials!';

      if (err.message != null) {
        message = err.message;
      }

      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(ctx).errorColor,
        ),
      );
   
    } catch (err) {
      print(err);
     
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SignUp(
        _submitAuthForm,
  
      ),
    );
  }
}
