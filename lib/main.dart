import 'package:flutter/material.dart';
import 'splash.dart';
import 'TestAPI.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ), home: WidgetOne(),

    );
  }
}

class Screen extends StatelessWidget{
  final ListData data2;

  const Screen({Key key, this.data2}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: data2.data.length,
        separatorBuilder: (context, index){
          return Divider(
            thickness: 1.9,
          );
        },
        itemBuilder: (context, index){
          return ListTile(
            leading: Text('${data2.data[index].name}'),
            onTap: (){
              Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (BuildContext context)=>Screen2(data3:data2, index: index)));
            },
            trailing: Image.network('${JsonAPI.imageURL}${data2.data[index].graphic}',
            height: 64, width: 64,
            ),
          );
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}

class Screen2 extends StatelessWidget{
  final ListData data3;
  final int index;
  const Screen2({Key key, this.data3, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: PageView.builder(
          controller: PageController(
            initialPage: index,
          ),
          itemBuilder: (context, i){
            return Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${data3.data[i].name}',style: TextStyle(fontSize: 28),),
                    ),
                    Image.network('${JsonAPI.imageURL}${data3.data[i].graphic}', width: 250, height: 250, fit: BoxFit.fill,),
                    Text('helptext=${data3.data[i].helptext}',style: TextStyle(fontSize: 17),),
                    Text('flags=${data3.data[i].flags}',style: TextStyle(fontSize: 17),),
                    Text('req1=${data3.data[i].req1}',style: TextStyle(fontSize: 17),),
                    Text('req2=${data3.data[i].req2}' ,style: TextStyle(fontSize: 17),),
                  ],
                )
              ),

            );
          },
          itemCount: data3.data.length,

      ),

      backgroundColor: Colors.white70,
    );

  }
}
