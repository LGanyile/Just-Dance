import 'package:flutter/material.dart';
import 'school_ui.dart';

import '../models/community/school.dart';
import '../models/community/township.dart';

class SchoolsUI extends StatefulWidget{

  SchoolsUI();

  @override 
  SchoolsUIState createState()=> SchoolsUIState();
}

class SchoolsUIState extends State<SchoolsUI>{
  int? indexOfOpenedStore;
  
  List<School> schools = [
    School(
      schoolName: "Bonella Secondary School", 
      schoolImage: "../schools/bonella.jpg", 
      township: Township.mayville,
    ),
    School(
      schoolName: "Mayville Secondary School", 
      schoolImage: "../schools/mayville.jpg", 
      township: Township.mayville,
    ),
    School(
      schoolName: "Wiggins Secondary School", 
      schoolImage: "../schools/wiggins.jpg", 
      township: Township.mayville,
    ),
  ];
  

  
  @override 
  Widget build(BuildContext context){

    EdgeInsets storeDataPadding = const EdgeInsets.only(left: 20, right: 20, top:10);

    void keepAtMostOneSchoolOpened(int indexOfOpenedStore){
    setState(() { 
      this.indexOfOpenedStore = indexOfOpenedStore;
      for(int infoIndex = 0; infoIndex < schools.length;infoIndex++){
        if(schools[infoIndex].isOpened && infoIndex!=indexOfOpenedStore){
          schools[infoIndex].isOpened = false;
        }
        else if(infoIndex==indexOfOpenedStore){
          schools[infoIndex].isOpened = true;
        }
      }
    });
  }


    return Container(
    //height: MediaQuery.sizeOf(context).height,
    decoration: const BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30), 
        topRight: Radius.circular(30),
      ),
    ),
    child: Padding(
      padding: storeDataPadding,
      child: ListView.builder(
        itemCount: schools.length,
        itemBuilder: ((context, index) {
          return SchoolUI(
            school: schools[index], 
            infoIndex: index,
            onOpenChanged: keepAtMostOneSchoolOpened,
          );
        })
      ),
    ),
  );
  }
}