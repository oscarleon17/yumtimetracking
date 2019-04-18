import 'package:flutter/material.dart';
import '../Pages/home.dart';
var items = <String>{"Hardware Support", "Software Support"};
class CompleteList extends StatefulWidget{
  final Function() notifyParent;
  CompleteList({Key key, @required this.notifyParent}): super(key:key);
  @override
  State createState() => new ListBuilder(notifyParent: notifyParent);
}
class ListBuilder extends State<CompleteList> {
  final Function() notifyParent;
  ListBuilder({Key key, @required this.notifyParent});
  @override
  Widget build(BuildContext context) {
    return

      GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this would produce 2 rows.
        crossAxisCount: 1,
        childAspectRatio: (4/1),
        // Generate 100 Widgets that display their index in the List
        children: List.generate(selectedTasks.length, (index) {
          return
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),

              child: Column(
              children:
              <Widget>[
                Ink(
                  color: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: <Widget>[
                      //display the name of the task
                      Expanded(
                        child: Center(
                          child: Text(
                            selectedTasks.elementAt(index),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 18.0
                            ),
                          ),
                        ),
                        flex: 14,
                      ),
                      Expanded(child: RaisedButton(onPressed: (){setState(() {
                        if(hours[index] >= .5){
                        hours[index]=(hours[index]-.5);
                        notifyParent();
                        } else {
                          hours[index] =0;
                        }
                      }
                        );
                      }, child: Text('-'),
                          padding: EdgeInsets.all(0)
                      ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            //functioning as padding

                            //display the number of hours to be submitted for the task
                            Ink(
                              color: Colors.white,
                              child:
                              Container(
                                height: 36.0,
                                width: 41.0,
                                child: Center(
                                  child: Text(
                                    hours[index].toString(),
                                  ),
                                ),
                              ),
                            ),
                            //functioning as padding

                          ],
                        ),
                        flex: 2,
                      ),
                      Expanded(child: RaisedButton(onPressed: (){setState(() {hours[index]=(hours[index]+.5);notifyParent();});}, child:Text('+'),padding: EdgeInsets.all(0),),),
                    ],
                  ),
                ),
                //MyHourSelectionRow(taskIndex: taskIndex),
                Ink(
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 6.0),
                  //one button for each of the possible selections of hours
                  child: Row(
                    children: <Widget>[
                      Expanded(child: RaisedButton(onPressed: (){setState(() {hours[index]=0;});notifyParent();}, child: Text('0'),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))),
                      //Expanded(child: Container(),),
                      Expanded(child: RaisedButton(onPressed: (){setState(() {hours[index]=1;});notifyParent();}, child: Text('1'),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))),
                      //Expanded(child: Container(),),
                      Expanded(child: RaisedButton(onPressed: (){setState(() {hours[index]=2;});notifyParent();}, child: Text('2'),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))),
                      //Expanded(child: Container(),),
                      Expanded(child: RaisedButton(onPressed: (){setState(() {hours[index]=3;});notifyParent();}, child: Text('3'),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))),
                      //Expanded(child: Container(),),
                      Expanded(child: RaisedButton(onPressed: (){setState(() {hours[index]=4;});notifyParent();}, child: Text('4'),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))),
                      //Expanded(child: Container(),),
                      Expanded(child: RaisedButton(onPressed: (){setState(() {hours[index]=5;});notifyParent();}, child: Text('5'),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))),
                      //Expanded(child: Container(),),
                      Expanded(child: RaisedButton(onPressed: (){setState(() {hours[index]=6;});notifyParent();}, child: Text('6'),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))),
                      //Expanded(child: Container(),),
                      Expanded(child: RaisedButton(onPressed: (){setState(() {hours[index]=7;});notifyParent();}, child: Text('7'),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))),
                      //Expanded(child: Container(),),
                      Expanded(child: RaisedButton(onPressed: (){setState(() {hours[index]=8;});notifyParent();}, child: Text('8'),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))),
                    ],
                  ),
                ),
                /*Container(
                  height: 20.0,
                ),*/
              ],
          ),
            );
        }),
      );





  }
}