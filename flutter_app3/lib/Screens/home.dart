import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
List todoList = [];
String _userToDo = "";


//Firebase начало
void initFirebase() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}
//Firebase конец



@override
  void initState() {
    super.initState();
    initFirebase();
    todoList.addAll(['Купить молоко', 'Сьесть арбуз', 'Проверить почту']);
  }

  void _menuOpen(){
  Navigator.of(context).push(
    MaterialPageRoute(builder: (BuildContext context){
      return Scaffold(
        appBar: AppBar(title: Text('Меню'),),
        body: Row(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            }, child: Text('На главную')),
            Padding(padding: EdgeInsets.all(15)),
            Text('Простое меню'),
          ],
        )
      );
    })
  );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('список дел'),
            centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.menu_outlined),
            onPressed: _menuOpen,
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('items').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData) return Text('Нет записей');
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index){
                return Dismissible(
                  key: Key(snapshot.data!.docs[index].id),
                  child: Card(
                    child: ListTile(
                      title: Text(snapshot.data!.docs[index].get('item')),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.deepOrangeAccent,
                        ),
                        onPressed: (){
                          FirebaseFirestore.instance.collection('items').doc(snapshot.data!.docs[index].id).delete();

                        },
                      ),
                    ),
                  ),

                  onDismissed: (direction){
                    FirebaseFirestore.instance.collection('items').doc(snapshot.data!.docs[index].id).delete();


                  },
                );
              }
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              title: Text('Добавить эдемент'),
              content: TextField(
                onChanged: (String value){
                    _userToDo = value;
                },
              ),
              actions: [
                ElevatedButton(onPressed: () {
                  FirebaseFirestore.instance.collection('items').add({'item': _userToDo});


                  Navigator.of(context).pop();
                }, child: Text('Добавить'))
              ],
            );
          });
      },
        child: Icon(
          Icons.add_box,
          color: Colors.white
        ),
      ),
    );
  }
}
