import 'package:flutter/material.dart';


class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

class TodosScreen extends StatelessWidget {
  TodosScreen({Key key, @required this.todos}) : super(key: key);

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('todos'),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                todos[index].title,
              ),
              leading: Icon(Icons.title),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailScreen(
                              todo: todos[index],
                            )));
              },
            );
          }),
    );
  }
}

class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo
  final Todo todo;

  // In the constructor, require a Todo
  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create our UI
    return Scaffold(
      appBar: AppBar(
        title: Text("${todo.title}"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('${todo.description}'),
      ),
    );
  }
}
