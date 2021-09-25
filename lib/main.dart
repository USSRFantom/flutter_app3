import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
return MaterialApp(
  theme: ThemeData(primaryColor: Colors.deepOrange),
  home: Scaffold(
    appBar: AppBar(
      title: Text('Hello Flutter'),
    centerTitle: true,
    ),
    body:

    /*Container(
        child: Text('Привет'),
        color: Colors.deepOrangeAccent,
        margin: EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 40.0),
        padding: EdgeInsets.all(28.5),
      */

      //Image (image: AssetImage('assets/horizon.jpg'),),
      //Image ( image: NetworkImage('https://get.pxhere.com/photo/horizon-cloud-sky-sunlight-atmosphere-daytime-cumulus-blue-meteorological-phenomenon-atmosphere-of-earth-97488.jpg'),),
      //TextButton.icon(label: Text('Нажми'), onPressed: (){}, icon: Icon(Icons.ac_unit_rounded),),
      //OutlinedButton.icon(label: Text('Нажми'), onPressed: (){}, icon: Icon(Icons.ac_unit_rounded),),
      //ElevatedButton.icon(label: Text('Нажми'), onPressed: (){}, icon: Icon(Icons.ac_unit_rounded),),
      //RaisedButton.icon(onPressed: () {}, icon: Icon(Icons.ac_unit_rounded), label: Text('Setting')),
      //RaisedButton(onPressed: () {}, child: Text('Нажми'), color: Colors.deepOrangeAccent,),
      //FlatButton(onPressed: () {}, child: Text('Нажми на меня'), color: Colors.deepOrangeAccent,),
      //Icon(Icons.warning_amber_outlined, size: 45, color: Colors.red,),
    ),
    floatingActionButton: FloatingActionButton(
      child: Text('Нажми'),
      backgroundColor: Colors.deepOrange,
      onPressed: () {
        print('Clicked');
      },
    ),
  ),
);
  }
}

