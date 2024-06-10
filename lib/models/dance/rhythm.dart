import 'dart:developer' as developer;

class Rhythm{

  String studentId;
  List<int> originalTimes = [];
  List<int> times = [];
  List<bool> isActionable = [];
  int nextTimeIndex;
  bool hasNextTime;
  bool rhythmFit;
  int repeatAfter;
  DateTime? creationDate = DateTime.now();
  int startTime;
  int endTime;

  Rhythm({
    required this.studentId,
    this.hasNextTime = true,
    this.nextTimeIndex = 0,
    this.rhythmFit = true,
    this.repeatAfter = 2000,
    this.creationDate,
    this.startTime = 1000,
    this.endTime = 30000,
  });

  void createDefaultRhythm(){
    addTime(1000, true);
    addTime(2000, true);
    addTime(3000, true);
  }

  void addTime(int time, bool isActionable) {
		times.add(time);
    this.isActionable.add(isActionable);
	}

  void repeatPattern(){

    int initialTime = times[times.length-1]+repeatAfter;
    int maxPeriod = endTime;

    if(times.isEmpty){
      developer.log("Error : Tap at least twice.");
    }
    // Copy Inserted Times Into OriginalTiems List.
    for(int i = 0; i < times.length; i++){
      originalTimes.add(times[i]);
    }

    List<bool> originalIsActionable = [];
    // Copy Inserted decisions Into originalIsActionables List.
    for(int i = 0; i < isActionable.length; i++){
      originalIsActionable.add(isActionable[i]);
    }

    int constantTime = initialTime-times[0];
    int currentTime = maxPeriod;
    int iterationIndex = 1;

    do{  
      for(int i = 0; i < originalTimes.length;i++){
        currentTime = constantTime*iterationIndex+originalTimes[i];
        if(currentTime<=maxPeriod){
          addTime(currentTime, originalIsActionable[i]);
        }
          
        else{
          break;
        }
          
      }
      iterationIndex++;
    }while(currentTime<=maxPeriod);

    originalTimes.clear();
    // Copy Inserted Times Into OriginalTiems List.
    for(int i = 0; i < times.length; i++){
      originalTimes.add(times[i]);
    }
  
  }

  void displayRhythm(){
    for(int i = 0; i < times.length;i++){
      developer.log('${times[i]}');
    }
  }

  int findNextTimeIndex(){
    int timeIndex = nextTimeIndex;
    nextTimeIndex = nextTimeIndex + 1;
    nextTimeIndex = nextTimeIndex%times.length;

    return timeIndex;
  }

  bool findHasNextTimeIndex(){
    return nextTimeIndex + 1 < times.length;
  }
}