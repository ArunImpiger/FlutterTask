import 'package:flutter/material.dart';

class WrapWidget extends StatefulWidget {
  const WrapWidget({Key? key}) : super(key: key);

  @override
  State<WrapWidget> createState() => _WrapWidgetState();
}

class _WrapWidgetState extends State<WrapWidget> {
  @override
  Widget build(BuildContext context) {
    //image
    Widget _image = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        'assets/universe.jpg',
        height: 100,
        width: 100,
        fit: BoxFit.cover,
      ),
    );
    List<Widget> _list = [_image, _image, _image, _image];
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap Widget'),
      ),
      body: Center(
        child: Wrap(
          // direction: Axis.vertical,
          // runSpacing: 50,
          // spacing: 10,
          children: _list,
        ),
      ),
    );
  }
}
