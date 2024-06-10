import 'pose.dart';

class AvaiblePoses{

  Map<int, Pose> availablePoses = const{};
  static int poseNumber = 1;

  AvaiblePoses();

  void addPose(Pose pose){
    availablePoses.putIfAbsent(poseNumber++, () => pose);
  }

}