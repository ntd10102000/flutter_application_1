import 'package:flutter/material.dart';

import '../../pages/drawer/home_drawer.dart';

class HomeView extends StatefulWidget {
  static final routeName = 'home';
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      drawer: HomeDrawer(),
    );
  }
}
