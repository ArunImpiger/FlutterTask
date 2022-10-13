import 'package:flutter/material.dart';

class StreamBuilderWidget extends StatefulWidget {
  const StreamBuilderWidget({Key? key}) : super(key: key);

  @override
  State<StreamBuilderWidget> createState() => _StreamBuilderWidgetState();
}

//Fake firebase stream
Stream<int> generateStream = (() async* {
  await Future<void>.delayed(const Duration(seconds: 2));
  yield 1;
  await Future<void>.delayed(const Duration(seconds: 2));
  yield 2;
  // throw 'An error';
  await Future<void>.delayed(const Duration(seconds: 1));
  yield 3;
})();

class _StreamBuilderWidgetState extends State<StreamBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Buider Widget'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: generateStream,
          initialData: 0,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return const Text('Error');
            } else {
              return Text(
                snapshot.data.toString(),
                style: const TextStyle(fontSize: 40),
              );
            }
          },
        ),
      ),
    );
  }
}
