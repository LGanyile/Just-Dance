import 'package:flutter/material.dart';


import '../../models/dance/pose.dart';

typedef PoseConcatenation = Function(int selectedPoseIndex);

class PoseUI extends StatefulWidget{

  Pose pose;
  int poseOrderIndex; // Relative To The Chosen Ones.
  final PoseConcatenation onPoseAdded;

  PoseUI({
    required this.pose,
    required this.onPoseAdded,
    required this.poseOrderIndex,
  });

  @override
  State createState()=>PoseUIState();

}

class PoseUIState extends State<PoseUI>{

  EdgeInsets findPoseMargin(){

    switch(widget.poseOrderIndex){
      case 0: return const EdgeInsets.only(left:8,right: 4, top: 8, bottom: 4);
      case 1: return const EdgeInsets.only(left:4,right: 4, top: 8, bottom: 4);
      case 2: return const EdgeInsets.only(left:4,right: 8, top: 8, bottom: 4);

      case 3: return const EdgeInsets.only(left:8,right: 4, top: 4, bottom: 4);
      case 4: return const EdgeInsets.only(left:4,right: 4, top: 4, bottom: 4);
      case 5: return const EdgeInsets.only(left:4,right: 8, top: 4, bottom: 4);

      case 6: return const EdgeInsets.only(left:8,right: 4, top: 4, bottom: 8);
      case 7: return const EdgeInsets.only(left:4,right: 4, top: 4, bottom: 8);
      default: return const EdgeInsets.only(left:4,right: 8, top: 4, bottom: 8);
      
    }
  }

  @override 
  Widget build(BuildContext context)=>GestureDetector(
    child: Container(
      margin: findPoseMargin(),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/images/step ${widget.pose.group}/${widget.pose.stepNumber%10}.png'),
        ),
      ),
    ),
    onTap: ()=>widget.onPoseAdded(widget.poseOrderIndex),
  );
}