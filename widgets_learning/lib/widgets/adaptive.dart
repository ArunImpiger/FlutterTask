import 'package:flutter/material.dart';

class AdaptiveWidget extends StatefulWidget {
  const AdaptiveWidget({Key? key}) : super(key: key);

  @override
  State<AdaptiveWidget> createState() => _AdaptiveWidgetState();
}

class _AdaptiveWidgetState extends State<AdaptiveWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adaptive Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Slider.adaptive(
              value: 1,
              onChanged: (double newValue) {},
            ),
            SwitchListTile.adaptive(
              title: const Text('Switch List Tile'),
              value: true,
              onChanged: (bool newValue) {},
            ),
            Switch(
              value: true,
              onChanged: (bool newValue) {},
            ),
            Icon(
              Icons.adaptive.share,
            ),
            const CircularProgressIndicator.adaptive(),
          ],
        ),
      ),
    );
  }
}
