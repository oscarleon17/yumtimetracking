import 'package:flutter/material.dart';
import '../Pages/home.dart';
final hourDisplay = TextEditingController();
class MyHours extends StatefulWidget{
  final String nameOfTask;
  final int taskIndex;
  @override
  State<StatefulWidget> createState(){
    return MyHoursTile(nameOfTask: nameOfTask, taskIndex: taskIndex);
  }
  //must pass in the name of the task and the array to store the hours in
  MyHours({Key key, @required this.nameOfTask, @required this.taskIndex}) : super (key:key);
}
class MyHoursTile extends State<MyHours>{

  final String nameOfTask;
  int taskIndex =-1;

  MyHoursTile({Key key, @required this.nameOfTask,  @required this.taskIndex});
  @override
  Widget build(BuildContext context){
    hourDisplay.text= '0';
    return Column(
      children:
      <Widget>[
        Ink(
          color: Colors.blueGrey,
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: <Widget>[
              //display the name of the task
              Expanded(
                child: Center(
                  child: Text(nameOfTask,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0),),
                ),
                flex: 6,
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    //functioning as padding
                    Container(
                      height: 8.0,
                      child: null,
                    ),
                    //display the number of hours to be submitted for the task
                    Ink(
                      color: Colors.white,
                      child:
                      Container(
                        height: 20.0,
                        width: 20.0,
                        child: Center(
                          child: Text(
                            hours[taskIndex].toString(),
                            //hourDisplay.text
                          ),
                        ),
                      ),
                    ),
                    //functioning as padding
                    Container(
                      height: 8.0,
                      child: null,
                    ),
                  ],
                ),
                flex: 1,
              ),
            ],
          ),
        ),
        //MyHourSelectionRow(taskIndex: taskIndex),
        Ink(
          color: Colors.blueGrey,
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          //one button for each of the possible selections of hours
          child: Row(
            children: <Widget>[
              Expanded(child: RaisedButton(onPressed: (){setState(() {hours[taskIndex]=0;});}, child: Text('0'),)),
              Expanded(child: RaisedButton(onPressed: (){setState(() {hours[taskIndex]=1;});}, child: Text('1'),)),
              Expanded(child: RaisedButton(onPressed: (){setState(() {hours[taskIndex]=2;});}, child: Text('2'),)),
              Expanded(child: RaisedButton(onPressed: (){setState(() {hours[taskIndex]=3;});}, child: Text('3'),)),
              Expanded(child: RaisedButton(onPressed: (){setState(() {hours[taskIndex]=4;});}, child: Text('4'),)),
              Expanded(child: RaisedButton(onPressed: (){setState(() {hours[taskIndex]=5;});}, child: Text('5'),)),
              Expanded(child: RaisedButton(onPressed: (){setState(() {hours[taskIndex]=6;});}, child: Text('6'),)),
              Expanded(child: RaisedButton(onPressed: (){setState(() {hours[taskIndex]=7;});}, child: Text('7'),)),
              Expanded(child: RaisedButton(onPressed: (){setState(() {hours[taskIndex]=8;});}, child: Text('8'),)),
            ],
          ),
        ),
        Container(
          height: 20.0,
        ),
      ],
    );
  }
}