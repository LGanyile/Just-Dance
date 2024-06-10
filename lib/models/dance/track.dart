import 'package:just_audio/just_audio.dart';
import 'rhythm.dart';

class Track{

  String? trackURI;
  String? studentId;
  bool? isFullTrack;
  Rhythm rhythm;
  String? path;
  String? name;
  bool? isReady;
  int? startTimeInSeconds;
  int? endTimeInSeconds;

  final rewindOrForwardTimeInSeconds = 1;
  
  // Create a player
  final player = AudioPlayer(); 

  // Has A Map Of A Rhythm.

  Track({
    required this.rhythm,
    this.path = 'C:/Users/Test/Music/Gospel/LUSANDA 2015',
    this.name = 'Track09.mp3',
    this.trackURI,
    this.studentId = "student_abc",
    this.isFullTrack = false,
    this.isReady = false,
    
  });

  // Load Track URL And Return It Duration.
  loadURL() async{
    final duration = await player.setUrl('$path/$name');
    isReady = true;
    return duration;

  }

  // Play while waiting for completion
  void play() async {
    await player.setClip(); // Clear clip region
    await player.play();
  }

  // Pause but remain ready to play
  void pause() async{
    await player.pause(); 
  }

  // Jump to a particular position.
  void seek(Duration duration) async{
    await player.seek(duration);
  }

  // Jump to a particular position.
  void rewind() async{
    await player.seek(
      Duration(
        seconds:player.duration!.inSeconds - rewindOrForwardTimeInSeconds
      )
    );
  }

  // Jump to a particular position.
  void forward() async{
    await player.seek(
      Duration(
        seconds:player.duration!.inSeconds + rewindOrForwardTimeInSeconds
      )
    );
  }

  // 2.0 means play twice as fast
  void setSpeed(double speed) async{
    await player.setSpeed(speed);
  }

  // volume ranges from 0.0 to 1.0.
  void setVolume(double volume) async{
    await player.setVolume(volume);
  }

  // Stop and free resources.
  void stop() async{
    await player.stop();
    isReady = false;
  }

  Duration? findDuration(){
    return player.duration;
  }

  void setStartTime(){
    startTimeInSeconds = player.duration!.inSeconds;
  }

  void setEndTime(){
    endTimeInSeconds = player.duration!.inSeconds;
  }
  // Check return type of the setClip method.
  void playClip()async{
    if(startTimeInSeconds !=null && 
    endTimeInSeconds != null && 
    startTimeInSeconds!<endTimeInSeconds!){
      await player.setClip(
        start: Duration(
          seconds: startTimeInSeconds!
        ), 
        end: Duration(
          seconds: endTimeInSeconds!
        )
      );
      await player.play();
    }
  }

}