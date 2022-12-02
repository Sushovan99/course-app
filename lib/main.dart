import 'package:course_app/components/sidebar_row.dart';
import 'package:course_app/model/sidebar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: SidebarRow(
            item: items[1],
          ),
        ),
      ),
    );
  }
}
