import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/models/todo.dart';
import 'package:to_do_app/provider/todo_provider.dart';
import 'package:to_do_app/widgets/todo_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoProvider = context.read<TodoProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo"),
        backgroundColor: Colors.amber.shade300,
        actions: [
          IconButton(
            onPressed: () => GoRouter.of(context).push('/add'),
            icon: const Icon(
              Icons.add_box_outlined,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(child:
          Consumer<TodoProvider>(builder: (context, todoProvider, child) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: todoProvider.todoList.length,
            itemBuilder: (BuildContext context, int index) {
              return TodoTile(todo: todoProvider.todoList[index]);
            });
      })),
    );
  }
}
