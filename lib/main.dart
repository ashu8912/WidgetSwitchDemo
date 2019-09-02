import "package:flutter/material.dart";
import "./CustomWidgetSwitch.dart";
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
       home:Scaffold(appBar: AppBar(title:Text("Widget Switch Demo"),
       
       ),
       body:CustomWidgetSwitch()
       ));
  }
  
  
}