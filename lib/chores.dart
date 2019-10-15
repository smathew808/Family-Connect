//By: Kole Espenschied
//April 8th, 2019

//*********************************************
//This class holds all the Chores Page widgets
//I'm in a process of redesigning this page 9/17/19 -Kole
//Will need to add a floating action button to allow
//the user to add a new list to the page.
//*********************************************


import 'package:family_connect/Utilities/ChoreCRUD.dart';
import 'package:family_connect/coreClasses/ChoreModel.dart';
import 'package:flutter/material.dart';
import './user_select.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'coreClasses/api.dart';
import 'coreClasses/locator.dart';


class ChoresPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChoresState();
}

class _ChoresState extends State<ChoresPage> {

@override
  void initState() {
   locator.registerLazySingleton(() => Api('Chores')); //path that leads to the collection, Users, on fireStore. will need a bunch of these for all the collections
   locator.registerLazySingleton(() => ChoreCRUD());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Chores'),
        backgroundColor: Colors.black,
      ),
      body: drawBody(width),
      backgroundColor: Colors.grey,
    );
  }

  Widget drawBody(double width) {
    final choreProvider = Provider.of<ChoreCRUD>(context);
    List<Chore> choreDocuments;
    List<Widget> chores1 = [rightCardTitleBar(width, Colors.pink[200],'Katie\'s Chores', Icons.build),
                              rightCardListItems(width, 'Do Laundry', true),
                              rightCardListItems(width, 'Wash Dishes', true),
                              rightCardListItems(width, 'Clean Bathroom', false),
                              rightCardListItems(width, 'Clean Bedroom', true),
                              rightCardListItems(width, 'Make Bed', false),
                              rightCardListItems(width, 'Walk Dog', false),
                              rightCardListItems(width, 'Water Plants', false),
                              rightCardListItems(width, 'Take Out Trash', true)];

    List<Widget> chores2 = [rightCardTitleBar(width, Colors.orange,'Josh\'s Chores', Icons.build),
                              rightCardListItems(width, 'Make Bed', true),
                              rightCardListItems(width, 'Clean Bedroom', false),
                              rightCardListItems(width, 'Do Laundry', true),
                              rightCardListItems(width, 'Pick Up Sticks', true),
                              rightCardListItems(width, 'Mow Lawn', false),
                              rightCardListItems(width, 'Trash to Curb', false),
                              rightCardListItems(width, 'Empty Dishwasher', false),
                              rightCardListItems(width, 'Clean Kitchen', true)];
    
    return ListView(
      children: <Widget>[
        UserDrawer(),
        Center(
          child:  Container( //firebase starts here
            child: StreamBuilder( //a widget that fetches the database data from firestore
              stream: choreProvider.fetchChoresAsStream(), //helper function that gets all the users from the "Users" collection in firestore
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if(snapshot.data == null) return CircularProgressIndicator(); //shows a rotating circle while data is getting fetched
              if (snapshot.hasData) {
                choreDocuments = snapshot.data.documents //gets all Users docs from firebase and is stored into a list
                    .map((doc) => Chore.fromMap(doc.data, doc.documentID)).toList();
                     for (Chore chore in choreDocuments) {
                      //  if(chore.user ==  _profileEmail){
                      //    _profileName = profile.name; 
                      //    _imageURL = Uri.decodeFull(profile.userImageURL.toString()); //gets the image from JSON and decodes the image's url in firebase into URI
                      //  }
                     }
            return Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      drawLeftCards(width, Colors.pink[200],'assets/pictures/daughter.jpg', 'Katie', 'April 20th'),
                      drawRightCards(width, chores1),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      drawLeftCards(width, Colors.orange,'assets/pictures/collegekid.jpg', 'Josh', 'April 20th'),
                      drawRightCards(width, chores2),
                    ],
                  ),
                ],
              ),
            );
                }
                else {
                  return Text("fetching data");
                  }
              }),
            ),
          ),
        ],
      );
    } 
  
           
  Widget drawLeftCards(double width, Color accountColor, String image, String account, String date) {
    double leftCardWidth = width / 3;

    return Container(
      width: leftCardWidth,
      height: 360.0,
      child: Card(
        shape: BeveledRectangleBorder(),
        elevation: 5.0,
        margin: EdgeInsets.fromLTRB(2.0, 2.0, 0, 5.0),
        color: accountColor,
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: 30.0,
                ),
                child: CircleAvatar(
                  maxRadius: 60.0,
                  backgroundColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 10.0,
                ),
                child: Text(
                  account,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Finish By:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawRightCards(double width, List<Widget> widgetList) {
    double rightCardWidth = width / 3 * 2;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
      width: rightCardWidth,
      height: 360.0,
      child: Card(
        shape: BeveledRectangleBorder(),
        elevation: 5.0,
        margin: EdgeInsets.fromLTRB(0, 2.0, 2.0, 5.0),
        color: Colors.white70,
        child: ListView(
          children: widgetList
        ),
      ),
    );
  }
}

Widget rightCardTitleBar(double rightCardWidth, Color accountColor, String title, IconData listIcon) {
  return Container(
    width: rightCardWidth,
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

Widget rightCardListItems(double rightCardWidth, String listItem, bool value) {
  return Card(
    elevation: 15.0,
    margin: EdgeInsets.all(1),
    child: CheckboxListTile(
      activeColor: Colors.green,
      title: Text(
        listItem,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      value: value,
      onChanged: (bool val) {},
    ),
  );
}
