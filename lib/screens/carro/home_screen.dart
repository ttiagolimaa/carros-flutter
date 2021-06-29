import 'package:carros/widgets/drawer_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carros'),
      ),
      drawer: DrawerList(),
      body: Center(
        child: Text('Tiago'),
      ),
    );
  }
}
