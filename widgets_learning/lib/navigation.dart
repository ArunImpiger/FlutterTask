import 'package:flutter/material.dart';
import 'package:widgets_learning/widgets/adaptive.dart';
import 'package:widgets_learning/widgets/expantiontile.dart';
import 'package:widgets_learning/widgets/fittedbox.dart';
import 'package:widgets_learning/widgets/rangeslider.dart';
import 'package:widgets_learning/widgets/searchbar.dart';
import 'package:widgets_learning/widgets/stepper.dart';
import 'package:widgets_learning/widgets/streambuilder.dart';
import 'package:widgets_learning/widgets/time_date_picker_popupmenu.dart';
import 'package:widgets_learning/widgets/visibility.dart';
import 'package:widgets_learning/widgets/wrap.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Top 35 Flutter widgets '),
        ),
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StepperWidget()));
                },
                child: const Text('Stepper Widget'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FittedBoxWidget()));
                },
                child: const Text('FittedBox Widget'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchBar()));
                },
                child: const Text('Search Bar Widget'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AdaptiveWidget()));
                },
                child: const Text('Adaptive Widget'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StreamBuilderWidget()));
                },
                child: const Text('StreamBuilder Widget'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WrapWidget()));
                },
                child: const Text('Wrap Widget'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ExpantionWidget()));
                },
                child: const Text('Expantion Tile Widget'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TimePickerWidget()));
                },
                child: const Text('Time / Data Picker and PopUpMenu Widget'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RangeSliderWidget()));
                },
                child: const Text('Range Slider Widget'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VisibilityWidget()));
                },
                child: const Text('Visibility Widget'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
