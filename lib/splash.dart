import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'TestAPI.dart';
import 'package:flutter/cupertino.dart';
import 'main.dart';

class WidgetOne extends StatefulWidget {
  const WidgetOne ({Key key})  : super(key:key);

  @override
  _WidgetOne createState() {

    return _WidgetOne();
  }
}
class _WidgetOne extends State<WidgetOne>{
  ListData data1;
  @override
  initState(){
    super.initState();
    function1().then((onValue){
      if(onValue){
        Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (BuildContext context)=>Screen(data2:data1)));
      }
        });
}

  Future<bool> function1() async{
    data1 = await JsonAPI().fetchData();
    if(data1.data != null)
      return true;
    else
      return false;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(child: Image.asset("assets/loader.png"));
  }
}
