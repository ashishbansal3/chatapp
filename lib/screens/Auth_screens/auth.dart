import 'package:flutter/material.dart';
import './signupwithemail.dart';

import './signin.dart';
import '.././../widgets/Auth_widgets/login.dart';
class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget cardd(
    String s,
  ) {
    return Card(
      elevation: 3,
      child: Row(
        children: <Widget>[
          Icon(Icons.mail_outline),
          Text(s),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            cardd('Sign up with google'),
            cardd('Sign up with facebook'),
            Container(
              height: 35,
              child: GestureDetector(
                child: cardd('sign up with email'),
                onTap: () {
                  Navigator.of(context).pushNamed(SignUpWithEmail.routeName);
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.grey[600], fontSize: 15),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    child: Text(
                      'Sign in.',
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 15,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(SignIn.routeName);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
