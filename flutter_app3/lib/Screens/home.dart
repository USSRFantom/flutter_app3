import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
List todoList = [];
String _userToDo = "";




@override
  void initState() {
    super.initState();
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
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index){
            return Dismissible(
                key: Key(todoList[index]),
                child: Card(
                  child: ListTile(
                      title: Text(todoList[index]),
                    trailing: IconButton(
                      icon: Icon(
                          Icons.delete,
                          color: Colors.deepOrangeAccent,
                    ),
                    onPressed: (){
                      setState(() {
                        todoList.removeAt(index);
                      });
                    },
                  ),
                ),
                ),

                onDismissed: (direction){
                  //if (direction == DismissDirection.)
                  setState(() {
                    todoList.removeAt(index);
                  });
            },
            );
          }
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
                  setState(() {
                    todoList.add(_userToDo);
                  });
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
