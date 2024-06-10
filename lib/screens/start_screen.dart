import 'package:flutter/material.dart';
import '../models/community/school.dart';
import './dance%20screens/publish_ui.dart';

import '../models/community/township.dart';
import '../models/dance/rhythm.dart';
import '../models/dance/track.dart';
import 'dance screens/dance_creation_ui.dart';
import 'school_ui.dart';
import 'schools_ui.dart';


class StartScreen extends StatefulWidget {


  StartScreen();

  @override
  _StartScreenState createState()=> _StartScreenState();
}

class _StartScreenState extends State<StartScreen> with SingleTickerProviderStateMixin{

  int currentIndex = 0;
  List<String> titles = ['Dance', 'Publish', 'Schools'];
  Color iconColor= Colors.white;

  _StartScreenState();
  

  void updateCurrentIndex(int index){

    setState(() => currentIndex = index);
    
  }

  late TabController _tabController;

   @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, 
    
    vsync: this,);
  }

  @override
 void dispose() {
   _tabController.dispose();
   super.dispose();
 }
 
  @override 
  Widget build(BuildContext context){

    Rhythm rhythm = Rhythm(studentId: "student_abc");
    rhythm.createDefaultRhythm();
    rhythm.repeatPattern();

    Track track = Track(rhythm: rhythm);
    
    return Scaffold(
    backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          iconSize: 30,
          color: Colors.white,
          onPressed: (() {
            
          }),
        ),
        title: Text(titles[currentIndex], 
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        actions: [
          // Not Needed
          IconButton(
            icon: const Icon(Icons.search),
            iconSize: 30,
            color: Colors.white,
            onPressed: (() {
              
            }),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            iconSize: 30,
            color: Colors.white,
            onPressed: (() {
              
            }),
          ),
        ],
        /*flexibleSpace: Container(
          decoration: BoxDecoration(
            color: MyApplication.scaffoldColor,
          ),
        ),*/
        bottom: TabBar(
          onTap: updateCurrentIndex,
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 5,
          indicatorPadding: const EdgeInsets.only(bottom: 8),
          tabs: [
            Tab(
              icon:Icon(
                Icons.accessibility,
                color: iconColor,
              ),
              text: 'Dance',
            ),
            Tab(
              icon:Icon(
                Icons.video_camera_back,
                color: iconColor,
              ),
              text: 'Publish',
            ),
            Tab(
              icon:Icon(
                Icons.school,
                color: iconColor,
              ),
              text: 'Schools',
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.black,
        ),
        child: TabBarView(
          controller: _tabController,
          children: [
            
            DanceCreationUI(track: track,),
            PublishUI(),
            SchoolsUI(),
            /*SchoolUI(
              school:School(
                schoolName: "Bonella Secondary School", 
                schoolImage: "../schools/bonella.jpg", 
                township: Township.mayville,
              ),
              infoIndex: 0,
            ),*/
          ]
        ),
      ),
    );
  }
}        