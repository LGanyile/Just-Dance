
import 'package:flutter/material.dart';
import '/screens/dance%20screens/music_preferences_ui.dart';
import '/screens/dance%20screens/rhythm_preferences_ui.dart';
import '/models/dance/active_rhythm_button.dart';
import 'dart:developer' as developer;

import '../../models/dance/pose.dart';
import '../../models/dance/track.dart';
import 'pose_ui.dart';



// Use Case 3a
class DanceCreationUI extends StatefulWidget{
  
  Track track;
  List<Pose> chosenPoses;
  Map<int, Pose> dance = {}; // Key - rhythm clap time, Value - Corresponding Pose

  DanceCreationUI({
    required this.track,
    this.chosenPoses = const[
      Pose(group: 1, stepNumber: 1),
      Pose(group: 1, stepNumber: 2),
      Pose(group: 1, stepNumber: 3),
      Pose(group: 2, stepNumber: 3),
      Pose(group: 2, stepNumber: 5),
      Pose(group: 3, stepNumber: 1),
      Pose(group: 3, stepNumber: 2),
      Pose(group: 3, stepNumber: 3),
      Pose(group: 3, stepNumber: 4)
    ],
  });

  @override 
  State createState()=> DanceCreationUIState();
}

class DanceCreationUIState extends State<DanceCreationUI>{

  /* No Track, 
     Track Exist, 
     Creating Rhythm, 
     Rhythm Created, 
     Testing Rhythm
  */
  ActiveRhythmButton status = ActiveRhythmButton.noRhythm;
  int rhythmShiftAmount = 0;

  // Each Time A Pose Is Clicked It Is Added To The Dance.
  void addPose(int poseIndex){
    
    if(widget.track.rhythm.findHasNextTimeIndex()){
      int nextTimeIndex = widget.track.rhythm.findNextTimeIndex();
      int tapTime = widget.track.rhythm.times[nextTimeIndex];
      widget.dance.putIfAbsent(tapTime, 
      () => widget.chosenPoses[poseIndex]);
      developer.log('Tap Time : $tapTime \tPose Index : $poseIndex');
    }
    
  }

  // Once A Couple Of Poses Are Added, The Pattern Can Be Repeated.
  void repeatPoseAddition(){

    int poseIndex = 0;
    
    while(widget.track.rhythm.findHasNextTimeIndex()){
      int nextTimeIndex = widget.track.rhythm.findNextTimeIndex();
      widget.dance.putIfAbsent(widget.track.rhythm.times[nextTimeIndex], 
      () => widget.chosenPoses[poseIndex]);
      poseIndex++;
      poseIndex %= widget.chosenPoses.length;
    }
  }

  @override 
  Widget build(BuildContext context){

    return  
      Column(
        children: [
          Expanded(
            child: MusicPreferencesUI(track: widget.track,),
            //child: RhythmPreferencesUI(track: widget.track,),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        // Top Left
                        Expanded(
                          child: Container(
                            child: PoseUI(poseOrderIndex: 0, pose: widget.chosenPoses[0], onPoseAdded: addPose,),
                          ),
                        ),
                        // Top Center
                        Expanded(
                          child: Container(
                            child: PoseUI(poseOrderIndex: 1, pose: widget.chosenPoses[1], onPoseAdded: addPose,),
                          ),
                        ),
                        // Top Right
                        Expanded(
                          child: Container(
                            child: PoseUI(poseOrderIndex: 2, pose: widget.chosenPoses[2], onPoseAdded: addPose,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        // Center Left
                        Expanded(
                          child: Container(
                            child: PoseUI(poseOrderIndex: 3, pose: widget.chosenPoses[3], onPoseAdded: addPose,),
                          ),
                        ),
                        // Center
                        Expanded(
                          child: Container(
                            child: PoseUI(poseOrderIndex: 4, pose: widget.chosenPoses[4], onPoseAdded: addPose,),
                          ),
                        ),
                        // Center Right
                        Expanded(
                          child: Container(
                            child: PoseUI(poseOrderIndex: 5, pose: widget.chosenPoses[5], onPoseAdded: addPose,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        // Bottom Left
                        Expanded(
                          child: Container(
                            child: PoseUI(poseOrderIndex: 6, pose: widget.chosenPoses[6], onPoseAdded: addPose,),
                          ),
                        ),
                        // Bottom Center
                        Expanded(
                          child: Container(
                            child: PoseUI(poseOrderIndex: 7, pose: widget.chosenPoses[7], onPoseAdded: addPose,),
                          ),
                        ),
                        // BottomRight
                        Expanded(
                          child: Container(
                            child: PoseUI(poseOrderIndex: 8, pose: widget.chosenPoses[8], onPoseAdded: addPose,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
              ),
            ),
          ),
          
        ],
    );
  }
}