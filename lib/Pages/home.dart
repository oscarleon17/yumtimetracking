import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../ClassesAndWidgetFunctions/submitButton.dart';
import 'package:yum_time_tracking/ClassesAndWidgetFunctions/listGenerator.dart';
import '../Setup/signIn.dart';

class Home extends StatefulWidget {
  const Home({
    Key key,
    @required this.user
  }) : super(key: key);
  final FirebaseUser user;
  @override
  _HomeState createState() => _HomeState();
}
var currentDate = DateTime.now();
//array to hold the hours to submit
var hours = [0.0,0.0,0.0];
//var tasks = <String>{"Hardware Support", "Software Support", "Vacation"};
var selectedTasks = <String>{};
List<bool> selectedStates = [false, false, false, false,false];

class _HomeState extends State<Home> {
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
                        onPressed: (){setState(() {currentDate = currentDate.subtract(new Duration(days: 1));});},
                      ),
                    ),
                  ),
                  flex: 5,
                ),
                //mockup for the date display
                Expanded(
                  child: SizedBox.expand(
                    child: GestureDetector(
                      onTap:(){},
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)
                          ),
                          child: Center(child: Text(getYearMonthDayFromDate(currentDate), style: TextStyle(fontSize: 30),),)
                      ),
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
                        onPressed: (){setState(() {currentDate = currentDate.add(new Duration(days: 1));});},
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
                          value: selectedStates[0],
                          title: Text('Hardware Support'),
                          onChanged: (bool value){setState(() {
                            maintainList('Hardware Support', value);
                            //createHoursTile(tasks.elementAt(0),0);
                            selectedStates[0]=value;
                          });},
                        ),
                        CheckboxListTile(
                          value: selectedStates[1],
                          title: Text('Software Support'),
                          onChanged: (bool value){setState(() {
                            maintainList('Software Support', value);
                            //createHoursTile(tasks.elementAt(0),0);
                            selectedStates[1]=value;
                          });},
                        ),
                        CheckboxListTile(
                          value: selectedStates[2],
                          title: Text('Vacation'),
                          onChanged: (bool value){setState(() {
                            maintainList('Vacation', value);
                            //createHoursTile(tasks.elementAt(0),0);
                            selectedStates[2]=value;
                          });},
                        ),
                      ],
                    ),
                    color: Colors.white,
                  ),
                  Container(height: 20,),
                  Container(
                    height: 600.0,
                    child: CompleteList(),
                  ),
                ],
              ),

            ),
            flex: 18,
          ),

          //should send the data from the array of hours, clear the array, and switch to the next day
          //currently just updates the display of the number of hours selected
          MySubmitButton(),
        ],
      ),

      appBar: AppBar(
        title: Text('YUM! Timekeeping'),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: Text("Testing"),
                    accountEmail: Text("testing@testing.com",),
                    currentAccountPicture: new GestureDetector(
                      onTap: (){},
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              flex: 10,
            ),
            Expanded(
              child: SizedBox.expand(
                child: RaisedButton(
                  onPressed: (){
                    setState(() {});
                    Navigator.of(context).pop();
                    Navigator.of(super.context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  color: Colors.grey.shade600,
                  child: Text("Signout",
                    style: TextStyle(
                        color: Colors.white,fontSize: 25.0
                    ),
                  ),
                ),
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
double totalNumberOfHours(){
  double total=0;
  for(int i=0;i<hours.length;i++){
    total+=hours[i];
  }
  return total;
}
void maintainList(var nameOfTask, var selectionState){
  if(selectionState)
    selectedTasks.add(nameOfTask);
  else
    selectedTasks.remove(nameOfTask);
}
String getYearMonthDayFromDate(var date){
  return date.toString().split(" ")[0];
}
