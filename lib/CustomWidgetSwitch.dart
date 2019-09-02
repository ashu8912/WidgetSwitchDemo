import "package:flutter/material.dart";
class CustomWidgetSwitch extends StatefulWidget {
  @override
  _CustomWidgetSwitchState createState() => _CustomWidgetSwitchState();
}
enum WidgetMarker{
  graph,
  stats,
  info
}
class _CustomWidgetSwitchState extends State<CustomWidgetSwitch> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  Animation<double> _fadeInAnimation;
  @override
  void initState(){
    super.initState();
        _controller=AnimationController(vsync: this,duration: Duration(seconds: 2)); 
       _fadeInAnimation=Tween(begin: 0.0,end:1.0).animate(_controller);
       print("inside init state");
  }
  WidgetMarker selectedWidgetMarker=WidgetMarker.graph;

  Widget getCustomContainer(){
         if(selectedWidgetMarker==WidgetMarker.graph)
         {
           return getGraphContainer();
         }else if(selectedWidgetMarker==WidgetMarker.stats)
         {
           return getStatsContainer();
         }

         return getInfoContainer();
  }
  Widget getGraphContainer(){
       return FadeTransition(opacity:_fadeInAnimation,child:Container(color:Colors.red,height:400));
  }
  Widget getStatsContainer(){
        
         return FadeTransition(
           opacity: _fadeInAnimation,
           child: Container(color:Colors.green,height:200));
         
  }
  Widget getInfoContainer(){
          return FadeTransition(opacity:_fadeInAnimation,child:Container(color:Colors.lightBlue,height:200));
  }
  _playAnimation(){
    _controller.reset();
    _controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Column(children:[Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
      FlatButton(child: Text("Graph",style: TextStyle(color: (selectedWidgetMarker==WidgetMarker.graph)?Colors.black:Colors.black12),),onPressed: (){
        setState((){
          selectedWidgetMarker=WidgetMarker.graph;
        });
      },),
      FlatButton(child: Text("Stats",style: TextStyle(color: (selectedWidgetMarker==WidgetMarker.stats)?Colors.black:Colors.black12)),onPressed: (){
        setState((){
          selectedWidgetMarker=WidgetMarker.stats;
        });
      },),
      FlatButton(child: Text("Info",style: TextStyle(color: (selectedWidgetMarker==WidgetMarker.info)?Colors.black:Colors.black12)),onPressed: (){
        setState((){
          selectedWidgetMarker=WidgetMarker.info;
        });
      },)
    ],),
    FutureBuilder(future:_playAnimation(),builder:(BuildContext ctx,AsyncSnapshot snapshot){return getCustomContainer();})
    ]);
  }
}