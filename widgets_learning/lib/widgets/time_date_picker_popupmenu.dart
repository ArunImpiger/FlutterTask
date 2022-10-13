import 'package:flutter/material.dart';

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({Key? key}) : super(key: key);

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  TimeOfDay? _time = const TimeOfDay(hour: 12, minute: 12);
  DateTime _dateTime = DateTime(2022);

  String firstPage = 'Time Picker';
  String secondPage = 'Date Picker';
  String thirdPage = 'Pop Up Menu';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(firstPage),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(firstPage),
                value: firstPage,
              ),
              PopupMenuItem(
                child: Text(secondPage),
                value: secondPage,
              ),
              PopupMenuItem(
                child: Text(thirdPage),
                value: thirdPage,
              ),
            ],
            onSelected: (String newValue) {
              setState(() {
                firstPage = newValue;
              });
            },
          ),
        ],
      ),
      body: Column(
        // mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${_time!.hour.toString()}:${_time!.minute.toString()}',
            style: TextStyle(fontSize: 40),
          ),
          ElevatedButton(
            child: Icon(Icons.access_time_outlined),
            onPressed: () async {
              TimeOfDay? _newTime =
                  await showTimePicker(context: context, initialTime: _time!);
              if (_newTime != null) {
                setState(() {
                  _time = _newTime;
                });
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '${_dateTime.day.toString()}-${_dateTime.month.toString()}-${_dateTime.year.toString()}',
            style: TextStyle(fontSize: 40),
          ),
          ElevatedButton(
            child: Icon(Icons.date_range_outlined),
            onPressed: () async {
              DateTime? _newDate = await showDatePicker(
                context: context,
                initialDate: _dateTime,
                firstDate: DateTime(1800),
                lastDate: DateTime(2300),
              );
              if (_newDate != null) {
                setState(() {
                  _dateTime = _newDate;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
