import 'package:flutter/material.dart';

class FittedBoxWidget extends StatefulWidget {
  const FittedBoxWidget({Key? key}) : super(key: key);

  @override
  State<FittedBoxWidget> createState() => _FittedBoxWidgetState();
}

class _FittedBoxWidgetState extends State<FittedBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fitted Box'),
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 100,
          color: Colors.red,
          child: const FittedBox(
            //used to fit in the give size of the box
            child: Text(
              'Flutter Fitted Box',
              style: TextStyle(
                fontSize: 100,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
