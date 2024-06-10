import 'package:flutter/material.dart';

import '../models/community/school.dart';
import '../models/community/student.dart';

typedef OnOpenChanged = Function(int indexOfOpenedStore);
class SchoolUI extends StatefulWidget{

  School school;
  Student? currentStudent;
  bool hasJoined;
  int infoIndex;
  OnOpenChanged? onOpenChanged;

  SchoolUI({
    required this.school,
    this.currentStudent,
    this.hasJoined = false,
    required this.infoIndex,
    this.onOpenChanged,
  });

  @override 
  SchoolUIState createState()=> SchoolUIState();
}

class SchoolUIState extends State<SchoolUI>{

  EdgeInsets schoolHeadingPadding = const EdgeInsets.only(top: 5, bottom: 5, left:5);
  EdgeInsets schoolHeadingMargin = const EdgeInsets.only(right: 10, bottom:5);

  EdgeInsets schoolOpenCloseButtonPadding = const EdgeInsets.symmetric(vertical: 5);
  EdgeInsets schoolOpenCloseButtonMargin = const EdgeInsets.only(right: 10, bottom:5);

  EdgeInsets schoolJoinLeaveButtonPadding = const EdgeInsets.symmetric(vertical: 5);
  EdgeInsets schoolJoinLeaveButtonMargin = const EdgeInsets.only(right: 10, bottom:5);

  double headingCircleRadius = 5;
  double headingTextFontSize = 15;

  
  bool isOpened = false;

  @override 
  Widget build(BuildContext context){
    return Column(
    children: [
      // The 3 Elements Namely Store Name, Open/Close Button And The Join/Leave Button.
      Row(
        children: [
          // The Name Of A Store To Be Viewed.
          Expanded(
            flex: 2,
            child: Container(
              width: MediaQuery.of(context).size.width*0.7,
              padding: schoolHeadingPadding,
              margin: schoolHeadingMargin,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(headingCircleRadius)),
                  color: Colors.white,
                ),
              child: Text(widget.school.schoolName,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: headingTextFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.none
                ),
              ),
            ),
          ),
          // The Button Responsible For Either Openning Or Closing The Store.
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () { 
                if(widget.school.isOpened==false){
                  widget.onOpenChanged!(widget.infoIndex);
                }
                else{
                  setState(() =>widget.school.isOpened = false);
                }
              },
            
              child: Container(
                width: MediaQuery.of(context).size.width*0.45,
                alignment: Alignment.center,
                padding: schoolOpenCloseButtonPadding,
                margin: schoolOpenCloseButtonMargin,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(headingCircleRadius)),
                  color: Colors.white,
                ),
                child: Text(widget.school.isOpened?'Close':'Open',
                  style: TextStyle(
                    fontSize: headingTextFontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decoration: TextDecoration.none
                  ),
                ),
              ),
            ),
          ),
          // The Button Responsible For Joining Or Leaving The Current Store.
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (() {
                // Take The User To The Login Page If He Or She Has Not Logged In.
                if(widget.currentStudent==null){
                  /*Navigator.of(context).push(
                    CustomPageRoute(
                      child: const EntranceWidget(
                        toPage: ToPage.postsWidget,
                      ),
                    ),
                  );*/
                }
                // Assuming The User Has Logged In.
                else{
                  // Remove The User From This Store.
                  if(widget.hasJoined){
                    /*
                    MyApplication.sampleForTesting.leaveStore(widget.store.storeId!, MyApplication.currentUser!.cellNumber);
                    setState(() {
                      hasJoined = !hasJoined;
                    });*/
                  }
                  // Add The User From This Store.
                  else{
                    /*MyApplication.sampleForTesting.joinStore(widget.store.storeId!, MyApplication.currentUser!.cellNumber);
                    setState(() {
                      hasJoined = !hasJoined;
                    });*/
                  }
                }
              }),
              child: Container(
                width: MediaQuery.of(context).size.width*0.45,
                alignment: Alignment.center,
                padding: schoolJoinLeaveButtonPadding,
                margin: schoolJoinLeaveButtonMargin,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(headingCircleRadius)),
                  color: Colors.white,
                ),
                child: Text(widget.hasJoined?'Leave':'Join',
                  style: TextStyle(
                    fontSize: headingTextFontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decoration: TextDecoration.none
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      widget.school.isOpened?const Center(child: Text('School Opened'),):const SizedBox.shrink(),
    ]);
  }
}