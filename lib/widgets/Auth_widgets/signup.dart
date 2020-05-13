//import 'dart:html';

import 'package:flutter/material.dart';
import './selectcity.dart';

class SignUp extends StatefulWidget {
  @override
  SignUp(this.submitFn);
  
  final void Function(
    String email,
    String password,
    String username,
    String city1,
    String city2,
    BuildContext ctx,
  ) submitFn;
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  var _city1 = '';
  var _city2 = '';

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(_userEmail.trim(), _userPassword.trim(), _userName.trim(),
          _city1, _city2, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(10),
        width: width - 100,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 0.10 * height,
                ),
                TextFormField(
                  key: ValueKey('UserName'),
                  decoration: InputDecoration(
                    labelText: 'User Name',
                  ),
                  validator: (value) {
                    if (value.isEmpty || value.length < 4)
                      return 'Length Of UserName Should Be Minimum 4';
                    return null;
                  },
                  onSaved: (value) {
                    _userName = value;
                  },
                ),
                TextFormField(
                  key: ValueKey('Email'),
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value.isEmpty || !value.contains('@'))
                      return 'Email Is Not Valid';
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {
                    _userEmail = value;
                  },
                ),
                TextFormField(
                  key: ValueKey('Password'),
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if (value.isEmpty || value.length < 6)
                      return 'Password Should Be Minimum length 6';
                    return null;
                  },
                  onSaved: (value) {
                    _userPassword = value;
                  },
                ),
                Container(
      
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 100,
                        child: TextFormField(
                          key: ValueKey('city1'),
                          decoration: InputDecoration(labelText: 'City 1'),
                          validator: (value){
                            if(value.isEmpty)
                            return 'enter city1';
                            return null;
                          },
                          onSaved: (value){
                            _city1=value;
                          },
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Text("----->"),
                          Text("<-----"),
                        ],
                      ),
                      Container(
                        width: 100,
                        child: TextFormField(
                          key: ValueKey('city2'),
                          decoration: InputDecoration(labelText: 'City 2'),
                          validator: (value){
                            if(value.isEmpty)
                            return 'enter city2';
                            return null;
                          },
                          onSaved: (value){
                            _city2=value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                RaisedButton(
                  child: Text('Submit'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: _trySubmit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
