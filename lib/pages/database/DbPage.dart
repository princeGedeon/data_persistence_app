import 'package:flutter/material.dart';

class DBPage extends StatefulWidget {
  DBPage({Key? key,required this.title}) : super(key: key);
  final String title;
  @override
  State<DBPage> createState() => _DBPageState();
}

class _DBPageState extends State<DBPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("DB"),
      ),
    );
  }
}
