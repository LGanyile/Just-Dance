
import 'township.dart';

class School{
  
  String schoolName;
  String schoolImage;
  Township township;
  bool isOpened;
  // Has A Sub Collection Of Students.

  School({
    required this.schoolName,
    required this.schoolImage,
    required this.township,
    this.isOpened = false,
  });

}