import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../ClassesAndWidgetFunctions/hoursTile.dart';
import '../ClassesAndWidgetFunctions/submitButton.dart';

class Home extends StatefulWidget {
  const Home({
    Key key,
    @required this.user
  }) : super(key: key);
  final FirebaseUser user;
  @override
  _HomeState createState() => _HomeState();
}
//array to hold the hours to submit
var hours = [0,0,0];
class _HomeState extends State<Home> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        children: <Widget>[
          Expanded(
            //top bar of the home screen with date and right left arrows
            child: Row(
              children: <Widget>[
                //mockup for going to previous date
                Expanded(
                  child: SizedBox.expand(
                    child:
                    Ink(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_left),
                        color: Colors.white,
                        onPressed: (){},
                      ),
                    ),
                  ),
                  flex: 5,
                ),
                //mockup for the date display
                Expanded(
                  child: SizedBox.expand(
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)
                        ),
                        child: Center(child: Text("3/7/19", style: TextStyle(fontSize: 30),),)
                    ),
                  ),
                  flex: 20,
                ),
                //mockup for going to next date
                Expanded(
                  child: SizedBox.expand(
                    child:
                    Ink(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_right),
                        color: Colors.white,
                        onPressed: (){},
                      ),
                    ),
                  ),
                  flex: 5,
                ),
              ],
            ),
            flex: 2,
          ),
          Expanded(
            child: Ink(
              color: Colors.black87,
              //mockup for list of projects the user has been assigned to
              //Needs checkbox functionality implemented
              child: ListView(
                children: <Widget>[
                  Ink(
                    child: ExpansionTile(
                      title: Text("Projects"),
                      children: <Widget>[
                        CheckboxListTile(
                          value: true,
                          title: Text('Hardware Support'),
                          onChanged: (bool value){},
                        ),
                        CheckboxListTile(
                          value: true,
                          title: Text('Software Support'),
                          onChanged: (bool value){},
                        ),
                        CheckboxListTile(
                          value: false,
                          title: Text('Vacation'),
                          onChanged: (bool value){},
                        ),
                      ],
                    ),
                    color: Colors.white,
                  ),
                  Container(
                    height: 20.0,
                  ),
                  //how to create a task object
                  //these should be created based on the status of the checkboxes
                  MyHours(nameOfTask: "Hardware Support", taskIndex: 0,),
                  MyHours(nameOfTask: "Software Support", taskIndex: 1,),

                  //MyHours(nameOfTask: "Vacation", numHours: hours[2],),
                ],
              ),
            ),
            flex: 14,
          ),
          /*Expanded(
              child: SizedBox.expand(
                child: RaisedButton(
                  color: Colors.grey.shade600,
                  child: Text("Sumbit ${totalNumberOfHours().toString()} hours",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                  onPressed: (){},
                ),
              ),
              flex: 2,
            ),*/
          //should send the data from the array of hours, clear the array, and switch to the next day
          //currently just updates the display of the number of hours selected
          MySubmitButton(),
        ],
      ),

      appBar: AppBar(
        title: Text('YUM! Timekeeping'),
        actions: <Widget>[
          /*IconButton(
            icon: Icon(Icons.shopping_cart),
            tooltip: 'Open shopping cart',
            onPressed: () {
              // ...
            },
          ),*/
        ],
      ),
      drawer: Drawer(),
    );
  }
}
int totalNumberOfHours(){
  int total=0;
  for(int i=0;i<hours.length;i++){
    total+=hours[i];
  }
  return total;
}