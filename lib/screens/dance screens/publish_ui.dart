import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class PublishUI extends StatefulWidget{

  PublishUI();

  @override 
  State createState()=> PublishUIState();

}

class PublishUIState extends State<PublishUI>{

  @override 
  Widget build(BuildContext context){
    return Center(child: Text('Publish'),);
  }
}