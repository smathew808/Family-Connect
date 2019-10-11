//By: Kole Espenschied
//April 8th, 2019

//***********************************************
//This class holds all the Homework Page widgets
//In the process of redesigning this page 9/17/19 -Kole
//Will need to add a floating action button to allow the
//user to create a new homework list.
//***********************************************

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './drawer.dart';

class HomeworkPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomeworkPage();
}

class _HomeworkPage extends State<HomeworkPage> {

  @override
void initState(){
  super.initState();
  SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
  ]);
}

//when done with the page set it to portrait mode
@override
dispose(){
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  super.dispose();
}
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Homework'),
        //backgroundColor: Colors.black,
      ),
<<<<<<< HEAD
      body: ListView(
      children: <Widget>[
        //UserDrawer(key: userKey),
        UserDrawer(),
        Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),                  
                ),
                //titleBar(Colors.green, (userKey.currentState != null) ? userKey.currentState.currentUser : "RELOAD", Icons.create),
                titleBar(Colors.green, 'NAME', Icons.create),
                listItems('Math', 'Problems 1-10\nDue: 04/19', 0),
                listItems('History', 'Read Chapter 3\nDue: 04/20', 1),
                listItems('History', 'Do Ch. 3 Problems\nDue: 04/22', 2),
                listItems('English', 'Do Grammar Assignment\nDue: 04/23', 3),
                listItems('Art', 'Finish Poster\nDue: 04/23', 4),
                listItems('History', 'Read Chapter 3\nDue: 04/20', 5),
                listItems('History', 'Do Ch. 3 Problems\nDue: 04/22', 6),
                listItems('English', 'Do Grammar Assignment\nDue: 04/23', 7),
                listItems('Art', 'Finish Poster\nDue: 04/23', 8),
              ],
            ),
          ),
        ),
      ],
    ),
      backgroundColor: Colors.grey,
    );
  }

  /* Widget userChanged() {
    

    return ValueListenableBuilder(valueListenable: data, builder: (BuildContext context, String value, Widget child) {
      return titleBar(Colors.red, value, Icons.create);
    });
  } */

  /* Future testFuture() async {
    return titleBar(Colors.green, (userKey.currentState != null) ? "WORKED" : "FAILED", Icons.create);
  } */

  Widget titleBar(
      Color accountColor, String title, IconData listIcon) {
    return Container(
      height: 55.0,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black),
        ),
      ),
      child: Card(
        shape: BeveledRectangleBorder(),
        elevation: 5.0,
        color: accountColor,
        margin: EdgeInsets.all(0),
        child: ListTile(
          leading: Icon(
            listIcon,
            size: 30.0,
            color: Colors.black,
          ),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Icon(
            Icons.more_vert,
            size: 30.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget listItems(String listItem, String info, int index) {
    return Card(
      elevation: 15.0,
      margin: EdgeInsets.all(1),
      child: CheckboxListTile(
        activeColor: Colors.green,
        isThreeLine: true,
        title: Text(
          listItem,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
        subtitle: Text(
          info,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        value: isItChecked[index],
        onChanged: (bool val) {
          setState(() {
            isItChecked[index] = val;
          });
        },
      ),
    );
  }
}
=======
      endDrawer: MyDrawer(),
        body: ListView(children: <Widget>[ //this column be made up of several rows, where each row will have several containers
        Row( children: <Widget>[

          Card(child:Container(
            margin: const EdgeInsets.all(30.0),

           child: SizedBox(
          //width: 80.0,
         // height: 20.0,
           child:Text(
              'Days',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 25,
                color: Colors.orange,
                //background: Paint()..color = Colors.white12,
              ),
            ),
           ),
          ),
          ),
         HomeworkContainerTitle('Mon'),
         HomeworkContainerTitle('Tue'),
         HomeworkContainerTitle('Wed'),
         HomeworkContainerTitle('Thu'),
         HomeworkContainerTitle('Fri'),
         HomeworkContainerTitle('Sat'),
         HomeworkContainerTitle('Sun')
        
        ],

        ), //Chores, and Days of week end here

        //start a new row

        Row( children: <Widget>[
          Card(child:Container(

            margin: const EdgeInsets.all(18.0),
           // width: 40.0,

           child: SizedBox(
          width: 80.0,
          height: 20.0,
           child:Text(
              'Math',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 25,
                //background: Paint()..color = Colors.white12,
              ),
            ),
           ),
          ),
          ),

          StarButtonIcon(Icons.star, 42, Colors.green),
          StarButtonIcon(Icons.star, 42, Colors.green),
          StarButtonIcon(Icons.star, 42, Colors.green),
          StarButtonIcon(Icons.star, 42, Colors.green),
          StarButtonIcon(Icons.star, 42, Colors.green),
          StarButtonIcon(Icons.star, 42, Colors.green),
          StarButtonIcon(Icons.star, 42, Colors.green),

        ],

        ),

        Row( children: <Widget>[
         Card(child:Container(

            margin: const EdgeInsets.all(18.0),
           // width: 40.0,
           child: SizedBox(
          width: 80.0,
          height: 20.0,
           child:Text(
              'Read',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 25,
                //background: Paint()..color = Colors.white12,
              ),
            ),
           ),
          ),
          ),

         StarButtonIcon(Icons.star, 42, Colors.green),
         StarButtonIcon(Icons.star, 42, Colors.green),
         StarButtonIcon(Icons.star, 42, Colors.green),
         StarButtonIcon(Icons.star, 42, Colors.green),
          StarButtonIcon(Icons.star, 42, Colors.green),
          StarButtonIcon(Icons.star, 42, Colors.green),
          StarButtonIcon(Icons.star, 42, Colors.green),

        ],

        ),

        Row( children: <Widget>[
         Card(child:Container(

            margin: const EdgeInsets.all(18.0),
           // width: 40.0,
           child: SizedBox(
          width: 80.0,
          height: 20.0,
           child:Text(
              'Sci',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 25,
                //background: Paint()..color = Colors.white12,
              ),
            ),
           ),
          ),
          ),

         StarButtonIcon(Icons.star, 42, Colors.green),
         StarButtonIcon(Icons.star, 42, Colors.green),
         StarButtonIcon(Icons.star, 42, Colors.green),
         StarButtonIcon(Icons.star, 42, Colors.green),
          StarButtonIcon(Icons.star, 42, Colors.green),
          StarButtonIcon(Icons.star, 42, Colors.green),
          StarButtonIcon(Icons.star, 42, Colors.green),

        ],

        ),

        Row( children: <Widget>[
         Card(child:Container(

            margin: const EdgeInsets.all(18.0),
           // width: 40.0,
           child: SizedBox(
          width: 80.0,
          height: 20.0,
           child:Text(
              'History',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 25,
                //background: Paint()..color = Colors.white12,
              ),
            ),
           ),
          ),
          ),

         StarButtonIcon(Icons.star, 42, Colors.green),
         StarButtonIcon(Icons.star, 42, Colors.green),
         StarButtonIcon(Icons.star, 42, Colors.green),
         StarButtonIcon(Icons.star, 42, Colors.green),
          StarButtonIcon(Icons.star, 42, Colors.green),
          StarButtonIcon(Icons.star, 42, Colors.green),
          StarButtonIcon(Icons.star, 42, Colors.green),

        ],

        )
      ],),

    );
  }
}


class HomeworkContainerTitle extends StatelessWidget {

  final String titleText;

  //use 
  HomeworkContainerTitle(this.titleText);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
          width: 50.0,
          height: 50.0,
           child:Card(
             child: Center(
           child:Text(
              titleText,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 20,
                color: Colors.green,
                //background: Paint()..color = Colors.white12,
              ),
            ),
           ),
          )
         );
  }
}

class StarButtonIcon extends StatelessWidget{

final IconData image;
final int size;
final Color color;

StarButtonIcon(this.image, this.size, this.color);


@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
              child: Icon(
                Icons.star, size: 42, color: Colors.green,)
          );
  }
}
>>>>>>> cd8b6d45db20f4bd5609488f46d69184b8491f01
