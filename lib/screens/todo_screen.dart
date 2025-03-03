import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pmsn2025/database/task_databa.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  TaskDatabase? database;
  TextEditingController conTitle = TextEditingController();
  TextEditingController conDesc = TextEditingController();
  TextEditingController conDate = TextEditingController();
  TextEditingController conStatus= TextEditingController();

  @override
  void initState() {
    super.initState();
    database = TaskDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TODO LIST'),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_task),
        onPressed: ()=>_dialogBuilder(context)
      ),
      body: FutureBuilder(
      future: database!.SELECT(),
      builder: (context, snapshot) {
        if( snapshot.hasError) {
          return const Center(child: Text('Algo ocurrió durante la ejecución'),);
          // Text(snapshot.error.toString());
        }else {
          if( snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var obj = snapshot.data![index];
                return Container(
                  height: 150,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(obj.titleTodo!),
                        subtitle: Text(obj.dateTodo!),
                        trailing: Builder(builder: (context) {
                          if(obj.statusTodo! ){
                            return Icon(Icons.check);
                          }else{
                            return Icon(Icons.close);
                          }
                        }),
                      ),
                      Text(obj.descTodo!)
                    ],
                  ),
                );
              },
            );
          }else {
            return const Center(child: CircularProgressIndicator(),);
          }
        }
      },
    ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(

          title: Text('Add Task'),
          content: Container(
            height: 280,
            width: 300,
            child: ListView(
              shrinkWrap: true,
              children: [
                TextFormField(
                  controller: conTitle,
                  decoration: InputDecoration(hintText: 'Título de la tarea'),
                ),
                TextFormField(
                  controller: conDesc,
                  maxLines: 3,
                  decoration: InputDecoration(hintText: 'Descripción de la tarea'),
                ),
                TextFormField(
                  readOnly: true,
                  controller: conDate,
                  decoration: InputDecoration(hintText: 'Fecha de la tarea'),
                  onTap: () async{
                    DateTime? dateTodo = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100)
                    );

                    if( dateTodo != null) {
                      String formattedDate = DateFormat('yyyy-MM-dd').format(dateTodo);
                      setState(() {
                        conDate.text = formattedDate;
                      });
                    }
                  },
                ),
                TextFormField(
                  controller: conStatus,
                  decoration: InputDecoration(hintText: 'Estatus de la tarea'),
                ),
                Divider(),
                ElevatedButton(
                  onPressed: (){
                    database!.INSERT('todo', {
                      'titleTodo' : conTitle.text,
                      'descTodo' : conDesc.text,
                      'dateTodo' : conDate.text,
                      'statusTodo' : conStatus.text == 1 ? true : false
                    }).then((value) {
                      if( value > 0) {
                        ArtSweetAlert.show(
                          context: context,
                          artDialogArgs: ArtDialogArgs(
                            type: ArtSweetAlertType.success,
                            title: 'Mensaje de la App',
                            text: 'Datos insertados correctamente'
                          )
                        );
                      }
                    },);
                  },
                  child: Text('Guardar'))
              ],
            ),
          ),
        );
      },
    ); 
  }

}
