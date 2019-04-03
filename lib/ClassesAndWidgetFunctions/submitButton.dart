import 'package:flutter/material.dart';
import '../Pages/home.dart';


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
          color: Colors.grey.shade600,
          //calls the function defined in main.dart and updates the text displayed via the setState function
          child: Text("Submit ${totalNumberOfHours().toString()} hours",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
          onPressed: (){setState(() {});},
        ),
      ),
      flex: 2,
    );
  }
}