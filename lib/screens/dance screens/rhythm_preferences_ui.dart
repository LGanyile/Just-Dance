import 'package:flutter/material.dart';
import '/models/dance/track.dart';
import '/models/dance/active_rhythm_button.dart';

class RhythmPreferencesUI extends StatefulWidget{

  Track track;

  RhythmPreferencesUI({
    required this.track,
  });

  State createState()=> RhythmPreferencesUIState();
}

class RhythmPreferencesUIState extends State<RhythmPreferencesUI>{

  ActiveRhythmButton status = ActiveRhythmButton.noRhythm; 
  int rhythmShiftAmount = 0;

  String updateCurrentStatus(){
    switch(status){
      case ActiveRhythmButton.noRhythm: return "No Rhythm";
      case ActiveRhythmButton.creatingRhythm: return "Creating Rhythm";
      case ActiveRhythmButton.settingRhythm: return "Adjusting Rhythm";
      case ActiveRhythmButton.testingRhythm: return "Testing Rhythm";
      default: return "Rhythm Created";
    }
  }
  
  RhythmPreferencesUIState();

  @override
  Widget build(BuildContext context)=>Container(
    alignment: Alignment.topCenter,
    padding: const EdgeInsets.only(top: 10, bottom: 10),
    color: Colors.black,
    child: Column(
      children: [
        // Row 1 - Create, Start & Re-Play Buttons.
        Expanded(
          child: Row(
            children: [
              // Create Rhythm Button
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
                                
                    child: const Text('Create',
                      style: TextStyle(
                        fontSize:15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: ()=>{
                    setState(() {
                      
                                  
                    })
                  },
                ),
              ),
              // Start Track Button
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
                    setState(() {
                                
                    })
                  },
                ),
              ),  
              // Clear Button
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
                                
                    child: const Text('Clear',
                      style: TextStyle(
                        fontSize:15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: ()=>{
                    setState(() {
                      
                    })
                  },
                ),
              ),
            ],
          ),
        ),
        // Row 2 - Rhythm Rewind Button,  Rhythm Testing Button, Rhythm Forward Button
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Rhythm Rewind Button
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
                            
                    })
                  },
                ),
              ),
              // Rhythm Status Button
              Expanded(
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 10, left:10),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                                
                    child: Text(updateCurrentStatus(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize:15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: ()=>{
                    setState(() {
                      
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
                      
                    })
                  },
                ),
              ),
            ],
          ),
        ),
        // Row 3 - Test, Repeat & Confirm Buttons
        Expanded(
          child: Row(
            children: [
              // Rhythm Test Button
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
                    setState((){
                        
                    })
                  },
                ),
              ),
              // Rhythm Repeat Button
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
                                
                    child: const Text('Repeat',
                      style: TextStyle(
                        fontSize:15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                onTap: ()=>{
                  setState(() {
                    
                  })
                },
              ),
            ),  
            // Rhythm Confirm Button
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
                    child: const Text('Confirm',
                      style: TextStyle(
                        fontSize:15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: ()=>{
                    setState(() {
                      
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