import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:to_do_app/Task_model.dart';
import 'package:to_do_app/Widgets/task_list_item.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Task> _allTasks;
  @override
  void initState() {
    super.initState();
    _allTasks = <Task>[];
    _allTasks.add(Task.olustur(name: "Deneme", CreatedAt: DateTime.now()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(backgroundColor: Colors.blueGrey,
        title: GestureDetector(
          onTap: (){
            _showAddTaskBottomSheet(context);
          },
            child: Text("ToDo App")),
        elevation: 0.0,
        actions: [
          IconButton(onPressed: (){
          }, icon: Icon(Icons.search)),
          IconButton(onPressed: (){
            _showAddTaskBottomSheet(context);
          }, icon: Icon(Icons.add))
        ],
      ),
      body: _allTasks.isNotEmpty ? ListView.builder(itemBuilder: (context, index){
        var _oankilisteElemani = _allTasks[index];
        return Dismissible(
          background: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.remove_circle),
              SizedBox(width: 8),
              Text("Gorev silindi"),
            ],
          ) ,
          key: Key(_oankilisteElemani.id),
          onDismissed: (Direction){
            _allTasks.removeAt(index);
            setState(() {

            });
          },
          child: TaskItem(task: _oankilisteElemani),
        );
      }, itemCount: _allTasks.length, ): Center(child: Text("Hadi görev ekle!"),)
    );
  }

  void _showAddTaskBottomSheet(BuildContext context) {
    showModalBottomSheet(context: context, builder: (context) {
      return Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        width: MediaQuery.of(context).size.width,
        child:  ListTile(
          title: TextField(
            decoration: InputDecoration(hintText: "Görev Ekle...",border: InputBorder.none, ),
            onSubmitted: (value) {
              Navigator.of(context).pop();
              if(value.length > 3){
              DatePicker.showTimePicker(context, showSecondsColumn: false, onConfirm: (time){
                var yeniEklenecekGorev = Task.olustur( name: value, CreatedAt: time);

                _allTasks.add(yeniEklenecekGorev);
                setState(() {

                });
              });
              }
            },
          ),
        ),
      );
    });
  }
}
