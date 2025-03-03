class TodoModel {
  int? idTodo;
  String? titleTodo;
  String? descTodo;
  String? dateTodo;
  bool? statusTodo;

  TodoModel({this.idTodo,this.titleTodo,this.descTodo,this.dateTodo,this.statusTodo});

  factory TodoModel.fromMap(Map<String,dynamic> map){
    return TodoModel(
      idTodo: map['idTodo'],
      titleTodo: map['titleTodo'],
      descTodo: map['descTodo'],
      dateTodo: map['dateTodo'],
      statusTodo: map['statusTodo']
    );
  }
}