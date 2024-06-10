import 'package:flutter/material.dart';

class HomeUI extends StatefulWidget{

  HomeUI();

  @override 
  HomeUIState createState()=> HomeUIState();
}

class HomeUIState extends State<HomeUI>{

  @override 
  Widget build(BuildContext context){
    return const Center(child: Text('Home Screen'),);
  }
}