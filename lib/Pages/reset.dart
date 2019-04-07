import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Reset extends StatefulWidget {
  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {

  String _email, _errorMessage;
  bool _isIos;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
        centerTitle: true,
      ),
        body: Stack(
          children: <Widget>[
            _showBody(),
          ],
        )
    );
  }

  Widget _showBody(){
    return new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          key: _formKey,
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              _showEmailInput(),
              _showPrimaryButton(),
             // _showErrorMessage(),
            ],
          ),
        ));
  }

  Widget _showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Email',
            icon: new Icon(
              Icons.mail,
              color: Colors.red,
            )),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value,
      ),
    );
  }

  //TODO: Change page formatting, make it prettier.

  Widget _showPrimaryButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: SizedBox(
          height: 40.0,
          child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.red,
            child: new Text(
                'Reset Password', style: new TextStyle(fontSize: 20.0, color: Colors.white)),
            onPressed: resetPassword,
          ),
        ));
  }

//  Widget _showErrorMessage() {
//    if (_errorMessage.length > 0 && _errorMessage != null) {
//      return new Text(
//        _errorMessage,
//        style: TextStyle(
//            fontSize: 13.0,
//            color: Colors.red,
//            height: 1.0,
//            fontWeight: FontWeight.w300),
//      );
//    } else {
//      return new Container(
//        height: 0.0,
//      );
//    }
//  }

  void resetPassword( ) async {

    final formState = _formKey.currentState;
    setState(() {
      _errorMessage = "";
    });

    if(formState.validate()){
      formState.save();
      try{
        FirebaseAuth.instance.sendPasswordResetEmail(email: _email);

      }catch(e){
        print('Error: $e');
        //TODO: Finish error implementation for reset password
//        setState(() {
//          if(_isIos){
//            _errorMessage = e.details;
//
//          } else{
//            _errorMessage = e.message;
//          }
//        });
      }
    }
  }

}
