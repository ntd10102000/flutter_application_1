import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../drawer/widgets/drawer_widget.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      drawer: Drawer(child: DrawerWidget()),
      body: Center(
        child: Text('Home View'),
      ),
    );
  }
}
