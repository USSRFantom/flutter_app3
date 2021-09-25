import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: UserPanel(),
));

class  UserPanel extends StatefulWidget {
  const UserPanel({Key? key}) : super(key: key);

  @override
  State<UserPanel> createState() => _UserPanelState();
}

class _UserPanelState extends State<UserPanel> {
  int _count = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      appBar: AppBar(
        title: Text('Flutter_app2'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
             Padding(padding: EdgeInsets.only(top: 30),),
                Text('John Cena',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white
                  ),),
                Padding(padding: EdgeInsets.only(top: 10),),
                CircleAvatar(
                  backgroundImage: NetworkImage("https://yt3.ggpht.com/a/AATXAJzPvASNOCBnEvAy2Q09vk2LF_cYNKuhhVGlbDIedA=s900-c-k-c0xffffffff-no-rj-mo") ,
                  radius: 50,
                ),
                Padding(padding: EdgeInsets.only(top: 10),),
                Row(
                  children: [
                    Icon(Icons.mail_outline, size: 25,),
                    Padding(padding: EdgeInsets.only(left: 10),),
                    Text('JS@gmail.com', style: TextStyle(color: Colors.white),)
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10),),
                Text('Count $_count', style: TextStyle(color: Colors.white),)
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit_outlined),
        backgroundColor: Colors.amberAccent,
        onPressed: (){
          setState(() {
            _count++;
          });
        },
      ),
    );
  }
}



