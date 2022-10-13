import 'package:flutter/material.dart';

class ExpantionWidget extends StatefulWidget {
  const ExpantionWidget({Key? key}) : super(key: key);

  @override
  State<ExpantionWidget> createState() => _ExpantionWidgetState();
}

class _ExpantionWidgetState extends State<ExpantionWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expantion tile Widget'),
      ),
      body: const ExpansionTile(
        title: Text('See more'),
        // backgroundColor: Colors.red,
        leading: Icon(
          Icons.face,
          size: 20,
        ),
        children: [
          ListTile(
            title: Text('First'),
          ),
          ListTile(
            title: Text('Second'),
          ),
          ListTile(
            title: Text('Third'),
          ),
        ],
      ),
    );
  }
}
