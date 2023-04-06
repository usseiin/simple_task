import 'dart:math';

import 'package:app/color.dart';
import 'package:flutter/material.dart';

class CalenderPage extends StatelessWidget {
  const CalenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    const months = [
      "january",
      "Febuary",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "Decemnber"
    ];
    var getMonth = DateTime.now().month - 1;
    var month = months[getMonth];
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text(month),
            const Divider(),
            CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime.now().subtract(const Duration(days: 50)),
              lastDate: DateTime.now().add(const Duration(days: 1000)),
              onDateChanged: (value) {},
              onDisplayedMonthChanged: (value) {
                month = months[value.month];
              },
            ),
            Expanded(
              child: Container(
                color: faintPurpleBackground,
                child: ListView(
                  children: [
                    ...List.generate(
                      Random().nextInt(7) + 1,
                      (index) => ListTile(
                        leading: Container(
                          color: darkColor,
                          width: 4,
                          height: 25,
                        ),
                        title: Text("Feed a cat $index"),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: white,
        onPressed: () {},
        shape: const StadiumBorder(),
        child: const Icon(
          Icons.add,
          color: faintPurpleBackground,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
