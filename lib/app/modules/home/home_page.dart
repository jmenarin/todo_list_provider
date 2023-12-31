import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/auth/auth_provider.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';
import 'package:todo_list_provider/app/core/ui/todo_list_icons.dart';
import 'package:todo_list_provider/app/modules/home/widget/home_drawer.dart';
import 'package:todo_list_provider/app/modules/home/widget/home_filters.dart';
import 'package:todo_list_provider/app/modules/home/widget/home_header.dart';
import 'package:todo_list_provider/app/modules/home/widget/home_tasks.dart';
import 'package:todo_list_provider/app/modules/home/widget/home_week_filter.dart';
import 'package:todo_list_provider/app/modules/tasks/task_create_page.dart';
import 'package:todo_list_provider/app/modules/tasks/tasks_module.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _goToCreateTask(BuildContext context) {
    //Navigator.of(context).pushNamed('/task/create');
    Navigator.of(context).push(PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        transitionsBuilder: (context, animation, secondaryaAnimation, child) {
          animation =
              CurvedAnimation(parent: animation, curve: Curves.easeInQuad);
          return ScaleTransition(
              scale: animation, alignment: Alignment.bottomRight, child: child);
        },
        pageBuilder: (context, animation, secondaryaAnimation) {
          return TasksModule().getPage('/task/create', context);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: context.primaryColor),
          backgroundColor: const Color(0xFFFAFBFE),
          elevation: 0,
          actions: [
            PopupMenuButton(
              icon: const Icon(
                TodoListIcons.filter,
              ),
              itemBuilder: (_) => [
                const PopupMenuItem<bool>(
                    child: Text('Mostrar tarefas concluidas'))
              ],
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: context.primaryColor,
          onPressed: () {
            _goToCreateTask(context);
          },
          child: const Icon(Icons.add),
        ),
        backgroundColor: const Color(0xFFFAFBFE),
        drawer: HomeDrawer(),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  minWidth: constraints.maxWidth,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const IntrinsicHeight(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeHeader(),
                      HomeFilters(),
                      HomeWeekFilter(),
                      HomeTasks(),
                    ],
                  )),
                ),
              ),
            );
          },
        ));
  }
}
