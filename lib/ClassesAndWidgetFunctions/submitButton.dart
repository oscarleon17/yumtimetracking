import 'package:flutter/material.dart';
import '../Pages/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

///No LONGER USED
///NOW incorporated into home.dart
class MySubmitButton extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return MySubmitButtonState();
  }
}
class MySubmitButtonState extends State<MySubmitButton>{
  Widget build(BuildContext context){
    return Expanded(
      child: SizedBox.expand(
        child: RaisedButton(
          color: Colors.black,
          //calls the function defined in main.dart and updates the text displayed via the setState function
          child: Text("Submit ${totalNumberOfHours().toString()} hours",
            
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 17,
                color: Colors.white
            ),
          ),
          onPressed: sendData,
        ),
      ),
      flex: 2,
    );
  }
}

