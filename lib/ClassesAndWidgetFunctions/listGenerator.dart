import 'package:flutter/material.dart';
import '../Pages/home.dart';
var items = <String>{"Hardware Support", "Software Support"};
class CompleteList extends StatefulWidget{
  @override
  State createState() => new ListBuilder();
}
class ListBuilder extends State<CompleteList> {
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
                      Expanded(child: RaisedButton(onPressed: (){setState(() {hours[index]=(hours[index]+.5);});}, child:Text('+'),padding: EdgeInsets.all(0),),),
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
                      Expanded(child: RaisedButton(onPressed: (){setState(() {hours[index]=0;});}, child: Text('0'),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))),
                      //Expanded(child: Container(),),
                      Expanded(child: RaisedButton(onPressed: (){setState(() {hours[index]=1;});}, child: Text('1'),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))),
                      //Expanded(child: Container(),),
                      Expanded(child: RaisedButton(onPressed: (){setState(() {hours[index]=2;});}, child: Text('2'),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))),
                      //Expanded(child: Container(),),
                      Expanded(child: RaisedButton(onPressed: (){setState(() {hours[index]=3;});}, child: Text('3'),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))),
                      //Expanded(child: Container(),),
                      Expanded(child: RaisedButton(onPressed: (){setState(() {hours[index]=4;});}, child: Text('4'),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))),
                      //Expanded(child: Container(),),
                      Expanded(child: RaisedButton(onPressed: (){setState(() {hours[index]=5;});}, child: Text('5'),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))),
                      //Expanded(child: Container(),),
                      Expanded(child: RaisedButton(onPressed: (){setState(() {hours[index]=6;});}, child: Text('6'),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))),
                      //Expanded(child: Container(),),
                      Expanded(child: RaisedButton(onPressed: (){setState(() {hours[index]=7;});}, child: Text('7'),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))),
                      //Expanded(child: Container(),),
                      Expanded(child: RaisedButton(onPressed: (){setState(() {hours[index]=8;});}, child: Text('8'),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))),
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








      /*GridView.builder(
        // Let the ListView know how many items it needs to build
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:1),

        // Provide a builder function. This is where the magic happens! We'll
        // convert each item into a Widget based on the type of item it is.
        itemBuilder: (context, index) {
          final item = items.elementAt(index);
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
                        child: Text(item,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0),),
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
                                  hours[index].toString(),
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
                    Expanded(child: RaisedButton(onPressed: (){}, child: Text('0'),)),
                    Expanded(child: RaisedButton(onPressed: (){}, child: Text('1'),)),
                    Expanded(child: RaisedButton(onPressed: (){}, child: Text('2'),)),
                    Expanded(child: RaisedButton(onPressed: (){}, child: Text('3'),)),
                    Expanded(child: RaisedButton(onPressed: (){}, child: Text('4'),)),
                    Expanded(child: RaisedButton(onPressed: (){}, child: Text('5'),)),
                    Expanded(child: RaisedButton(onPressed: (){}, child: Text('6'),)),
                    Expanded(child: RaisedButton(onPressed: (){}, child: Text('7'),)),
                    Expanded(child: RaisedButton(onPressed: (){}, child: Text('8'),)),
                  ],
                ),
              ),

            ],
          );
        },
      ),*/

  }
}