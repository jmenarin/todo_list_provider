import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/auth/auth_provider.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';
import 'package:todo_list_provider/app/core/ui/todo_list_icons.dart';
import 'package:todo_list_provider/app/modules/home/widget/home_drawer.dart';
import 'package:todo_list_provider/app/modules/home/widget/home_filters.dart';
import 'package:todo_list_provider/app/modules/home/widget/home_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: context.primaryColor),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            PopupMenuButton(
              icon: Icon(
                TodoListIcons.filter,
              ),
              itemBuilder: (_) => [
                PopupMenuItem<bool>(child: Text('Mostrar tarefas concluidas'))
              ],
            )
          ],
        ),
        backgroundColor: Color(0xFFFAFBFE),
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
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: IntrinsicHeight(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeHeader(),
                      HomeFilters(),
                    ],
                  )),
                ),
              ),
            );
          },
        ));
  }
}
