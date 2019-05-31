import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yum_time_tracking/ClassesAndWidgetFunctions/listGenerator.dart';
import '../Setup/signIn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  const Home({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _HomeState createState() => _HomeState();
}

//fetch the current date for inputting time
var currentDate = DateTime.now();
//array to hold the hours to submit
//hard coded to save time
var hours = [0.0, 0.0, 0.0];
var selectedTasks = <String>{};
//used to manage the state of which project/task is selected
List<bool> selectedStates = [false, false, false, false, false];

class _HomeState extends State<Home> {
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            //top bar of the home screen with date and right left arrows
            child: Row(
              children: <Widget>[
                //button to switch the date to the previous day
                Expanded(
                  child: SizedBox.expand(
                    child: Ink(
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_left),
                        color: Colors.white,
                        //go back one day
                        onPressed: () {
                          setState(() {
                            currentDate =
                                currentDate.subtract(new Duration(days: 1));
                          });
                        },
                      ),
                    ),
                  ),
                  flex: 5,
                ),
                //display the current date
                Expanded(
                  child: SizedBox.expand(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                          child: Text(
                            //custom function to pull the date out of the DateTime object
                            getYearMonthDayFromDate(currentDate),
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  flex: 20,
                ),
                //button to switch date to the next day
                Expanded(
                  child: SizedBox.expand(
                    child: Ink(
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_right),
                        color: Colors.white,
                        //go forward one day
                        onPressed: () {
                          setState(() {
                            currentDate =
                                currentDate.add(new Duration(days: 1));
                          });
                        },
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
              color: Colors.white,
              //checkbox list for selecting tasks
              //most of the functionality is hard coded
              //For instance, the text for the checkboxes cannot be dynamically assigned
              //also, the indices are hard coded. These should be assigned and managed by a function
              child: ListView(
                children: <Widget>[
                  Ink(
                    child: ExpansionTile(
                      title: Text(
                        "Projects",
                        style: TextStyle(color: Colors.white),
                      ),
                      children: <Widget>[
                        CheckboxListTile(
                          value: selectedStates[0],
                          title: Text(
                            'Hardware Support',
                            style: TextStyle(color: Colors.white),
                          ),
                          onChanged: (bool value) {
                            setState(() {
                              maintainList('Hardware Support', value);
                              //update the state of the checkbox to reflect selection
                              selectedStates[0] = value;
                              //remove the hour value from the array if the checkbox becomes deselected
                              if (!value) {
                                hours[0] = 0;
                              }
                            });
                          },
                        ),
                        CheckboxListTile(
                          value: selectedStates[1],
                          title: Text(
                            'Software Support',
                            style: TextStyle(color: Colors.white),
                          ),
                          onChanged: (bool value) {
                            setState(() {
                              maintainList('Software Support', value);
                              //
                              selectedStates[1] = value;
                              //remove the hour value from the array if the checkbox becomes deselected
                              if (!value) {
                                hours[1] = 0;
                              }
                            });
                          },
                        ),
                        CheckboxListTile(
                          value: selectedStates[2],
                          title: Text(
                            'Vacation',
                            style: TextStyle(color: Colors.white),
                          ),
                          onChanged: (bool value) {
                            setState(() {
                              maintainList('Vacation', value);
                              //
                              selectedStates[2] = value;
                              //remove the hour value from the array if the checkbox becomes deselected
                              if (!value) {
                                hours[2] = 0;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    color: Colors.red,
                  ),
                  Container(
                    height: 20,
                  ),
                  //shows the currently selected task input blocks
                  Container(
                    height: 600.0,
                    child: CompleteList(notifyParent: refresh),
                  ),
                ],
              ),
            ),
            flex: 18,
          ),

          //send the data from the array of hours, clear the array, and switch to the next day
          Expanded(
            child: SizedBox.expand(
              child: RaisedButton(
                color: Colors.black,
                //calls the function defined in main.dart and updates the text displayed via the setState function
                child: Text(
                  "Submit ${totalNumberOfHours().toString()} hours",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 17,
                      color: Colors.white),
                ),
                //onPressed:sendData,
                onPressed: () {
                  sendData();
                },
              ),
            ),
            flex: 2,
          ),
        ],
      ),
      appBar: AppBar(
        title: Text('YUM! Timetracking'),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: Text("Testing"),
                    accountEmail: Text(
                      "testing@testing.com",
                    ),
                    currentAccountPicture: new GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage('https://i.imgur.com/E8co0WJ.jpg'),
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
                  onPressed: () {
                    setState(() {});
                    Navigator.of(context).pop();
                    Navigator.of(super.context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  color: Colors.black,
                  child: Text(
                    "Signout",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w300),
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

//add up the hours from all the inputs into the tiles
double totalNumberOfHours() {
  double total = 0;
  for (int i = 0; i < hours.length; i++) {
    total += hours[i];
  }
  return total;
}

void maintainList(var nameOfTask, var selectionState) {
  if (selectionState)
    selectedTasks.add(nameOfTask);
  else {
    selectedTasks.remove(nameOfTask);
  }
}

//pull the date out of the returned toString, cut off the year, and add the day of the week
String getYearMonthDayFromDate(var date) {
  var returnedDate = date.toString().split(" ")[0].substring(5);
  var dayOfTheWeek = intWeekdayToString(date.weekday);
  return '$returnedDate $dayOfTheWeek';
}

//convert integer weekday to string
String intWeekdayToString(var weekdayInt) {
  switch (weekdayInt) {
    case 1:
      {
        return 'Mon';
      }
      break;

    case 2:
      {
        return 'Tues';
      }
      break;

    case 3:
      {
        return 'Wed';
      }
      break;

    case 4:
      {
        return 'Thur';
      }
      break;

    case 5:
      {
        return 'Fri';
      }
      break;

    case 6:
      {
        return 'Sat';
      }
      break;

    case 7:
      {
        return 'Sun';
      }
      break;

    default:
      {
        return 'error';
      }
      break;
  }
}

//send the hours info to the firebase database and show a toast message
void sendData() {
  String date = getYearMonthDayFromDate(currentDate);
  String totalHours = totalNumberOfHours().toString();

  Firestore.instance
      .collection('time')
      .document(date)
      .setData({'Total Hours': totalHours});

  Fluttertoast.showToast(
      msg: "Time submitted!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      backgroundColor: Colors.red,
      textColor: Colors.black,
      fontSize: 14.0);
}
