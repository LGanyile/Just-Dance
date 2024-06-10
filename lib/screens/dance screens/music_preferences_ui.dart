import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import '/models/dance/active_music_button.dart';
import '/models/dance/track.dart';

class MusicPreferencesUI extends StatefulWidget{

  Track track;
   
   MusicPreferencesUI({
    required this.track,
   });

   @override 
   State createState()=> MusicPreferencesUIState();
}

class MusicPreferencesUIState extends State<MusicPreferencesUI>{

  ActiveMusicButton status = ActiveMusicButton.notUploaded; 

  MusicPreferencesUIState();

  String updateCurrentStatus(){
    switch(status){
      case ActiveMusicButton.notUploaded: return "No Track Uploaded";
      case ActiveMusicButton.uploaded: return "Track Uploaded";
      case ActiveMusicButton.playing: return "Track Playing";
      
      case ActiveMusicButton.stopped: return "Track Stopped";
      case ActiveMusicButton.settingStartTime: return "Setting Track Start Time";
      case ActiveMusicButton.settingEndTime: return "Setting Track End Time";

      default: return "Done";
    }
  }

  @override
  Widget build(BuildContext context)=>Container(
    alignment: Alignment.topCenter,
    padding: const EdgeInsets.only(top: 10, bottom: 10),
    color: Colors.black,
    child: Column(
      children: [
        // Row 1 - Play, Upload & Re-Play Buttons.
        Expanded(
          child: Row(
            children: [
              // Play Music Button
              Expanded(
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 10, left:10),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                                
                    child: const Text('Play',
                      style: TextStyle(
                        fontSize:15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: ()=>{
                    setState(() {
                      if(status==ActiveMusicButton.uploaded){
                        widget.track.play();
                        developer.log('Track Playing...');
                        status = ActiveMusicButton.playing;
                      }
                                  
                    })
                  },
                ),
              ),
              // Upload Track Button
              Expanded(
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 10, left:10),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                                
                    child: const Text('Upload',
                      style: TextStyle(
                        fontSize:15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: ()=>{
                    setState(() {
                      if(status==ActiveMusicButton.notUploaded){
                        // Use File Picker Instead.
                        widget.track.path = 'assets/audio';
                        widget.track.name = 'TrackNo09.mp3';
                        widget.track.loadURL();
                        developer.log('Track Loaded');
                        status = ActiveMusicButton.uploaded;
                      }           
                    })
                  },
                ),
              ),  
              // Replay Music Button
              Expanded(
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 10, left:10),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                                
                    child: const Text('Re-Play',
                      style: TextStyle(
                        fontSize:15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: ()=>{
                    setState(() {
                      if(widget.track.isReady!){
                        widget.track.seek(const Duration(seconds: 0));
                      }
                    })
                  },
                ),
              ),
            ],
          ),
        ),
        // Row 2 - Music Rewind Button,  Music Testing Button, Music Forward Button
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Rewind Music Button
              Expanded(
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 10, left:10),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                              
                    child: const Text('<<<',
                      style: TextStyle(
                        fontSize:15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: ()=>{
                    setState(() {
                      if(status == ActiveMusicButton.playing ||
                      status == ActiveMusicButton.settingStartTime ||
                      status == ActiveMusicButton.settingEndTime){
                        widget.track.rewind();
                      }          
                    })
                  },
                ),
              ),
              // Testing Music Button
              Expanded(
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 10, left:10),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                                
                    child: const Text('Test',
                      style: TextStyle(
                        fontSize:15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: ()=>{
                    setState(() {
                      if(status==ActiveMusicButton.testing){
                        widget.track.playClip(); 
                      }
                    })
                  },
                ),
              ),
              // Forward Music Button
              Expanded(
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: const Text('>>>',
                      style: TextStyle(
                        fontSize:15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: ()=>{
                    setState(() {
                      if(status == ActiveMusicButton.playing ||
                      status == ActiveMusicButton.settingStartTime ||
                      status == ActiveMusicButton.settingEndTime){ 
                        widget.track.forward();
                      }
                    })
                  },
                ),
              ),
            ],
          ),
        ),
        // Row 3 - Start, Done & End Buttons
        Expanded(
          child: Row(
            children: [
              // Track Start Button
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(right: 10, left:10),
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),  
                      child: const Text('Start',
                        style: TextStyle(
                          fontSize:15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onTap: ()=>{
                      setState((){
                        if(status==ActiveMusicButton.playing ||
                        status==ActiveMusicButton.settingStartTime){
                          widget.track.setStartTime();
                        }
                      })
                    },
                  ),
                ),
              // Submit Track Button
              Expanded(
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 10, left:10),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                                
                    child: const Text('Submit',
                      style: TextStyle(
                        fontSize:15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                onTap: ()=>{
                  setState(() {
                    if(status==ActiveMusicButton.testing){
                      // Track Clip Created, Now Create A Rhythm.
                    }
                  })
                },
              ),
            ),  
            // End Music Button
            Expanded(
              child: GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 10, left:10),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),          
                    child: const Text('End',
                      style: TextStyle(
                        fontSize:15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: ()=>{
                    setState(() {
                      if(status==ActiveMusicButton.settingEndTime){
                        widget.track.setEndTime();
                      }
                    })
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}