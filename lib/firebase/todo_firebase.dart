import 'package:cloud_firestore/cloud_firestore.dart';

class TodoFirebase {
  final firebase = FirebaseFirestore.instance;
  CollectionReference? collection;

  TodoFirebase() {
    collection = firebase.collection('task');
  }

  // Sirve para recuperar las tareas de la colección
  Stream<QuerySnapshot> selectTask() {
    return collection!.snapshots();
  }

  // Sirve para agregar una tarea a la colección
  Future<void> addTask(Map<String, dynamic> task) async {
    await collection!.doc().set(task);
  }

  // Sirve para actualizar una tarea a la colección
  //!!! el id esta un nivel mayor que la información de la tarea
  Future<void> updateTask(Map<String, dynamic> task, String id) async {
    await collection!.doc(id).update(task);
  }

  // Sirve para eliminar una tarea a la colección
  Future<void> deleteTask(String id) async {
    await collection!.doc(id).delete();
  }
}