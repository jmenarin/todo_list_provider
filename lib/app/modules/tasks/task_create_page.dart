import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';
import 'package:todo_list_provider/app/core/widget/todo_list_field.dart';
import 'package:todo_list_provider/app/modules/tasks/task_create_controller.dart';
import 'package:todo_list_provider/app/modules/tasks/widget/calendar_button.dart';

class TaskCreatePage extends StatelessWidget {
  TaskCreateController _controller;

  TaskCreatePage({super.key, required TaskCreateController controller})
      : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              )),
        ],
        title: const Text('Task'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: context.primaryColor,
          onPressed: () {},
          label: const Text(
            'Salvar Task',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      body: Form(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text('Criar Nota',
                    style: context.titleStyle.copyWith(
                      fontSize: 20,
                    )),
              ),
              SizedBox(height: 30),
              TodoListField(label: ''),
              SizedBox(height: 20),
              CalendarButton(),
            ],
          ),
        ),
      ),
    );
  }
}
