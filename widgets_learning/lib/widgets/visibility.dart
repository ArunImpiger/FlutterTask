import 'package:flutter/material.dart';

class VisibilityWidget extends StatefulWidget {
  const VisibilityWidget({Key? key}) : super(key: key);

  @override
  State<VisibilityWidget> createState() => _VisibilityWidgetState();
}

class _VisibilityWidgetState extends State<VisibilityWidget> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visibility Widget'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _isVisible = !_isVisible;
              });
            },
            child: const Text(
              'Switch',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.monetization_on,
                size: 50,
              ),
              Visibility(
                visible: _isVisible,
                child: Icon(
                  Icons.currency_rupee,
                  size: 50,
                ),
              ),
              Icon(
                Icons.monetization_on,
                size: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
