import 'package:flutter/material.dart';

import 'package:app/color.dart';
import 'package:app/components/auth_button.dart';
import 'package:app/models/folder.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key, required this.folder});

  final Folder folder;

  @override
  Widget build(BuildContext context) {
    buildCompleteTask() {
      return Container(
        margin: const EdgeInsets.only(bottom: 12),
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(
                Icons.done,
                color: Colors.white,
              ),
            ],
          ),
        ),
      );
    }

    buildRemoveTask() {
      return Container(
        margin: const EdgeInsets.only(bottom: 12),
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ],
          ),
        ),
      );
    }

    var date = DateTime.now();
    var theme = Theme.of(context);
    var months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];

    var weekdays = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ];
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 45,
          alignment: Alignment.bottomCenter,
          child: const Text("Today"),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const StadiumBorder(),
        backgroundColor: mainColor,
        child: const Icon(
          Icons.add,
          color: white,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "${months[date.month]}, ${date.year}",
                  style: theme.textTheme.titleMedium,
                )),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                7,
                (index) {
                  final num = date.weekday - 1;
                  return (index == date.weekday - 1)
                      ? CircleAvatar(
                          backgroundColor: mainColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${weekdays[index].substring(0, 3)}\n${date.subtract(Duration(days: num - index)).day}",
                                style: const TextStyle(
                                  fontSize: 8,
                                  color: white,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${weekdays[index].substring(0, 3)}\n${date.subtract(Duration(days: num - index)).day}",
                              style: const TextStyle(fontSize: 8),
                              textAlign: TextAlign.center,
                            )
                          ],
                        );
                },
              ),
            ),
            const Divider(),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: ListView(children: [
                  Text(
                    "Tasks",
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  ...folder.tasks
                      .map(
                        (e) => Dismissible(
                          key: Key(e.title),
                          background: buildCompleteTask(),
                          secondaryBackground: buildRemoveTask(),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(color: mainColor),
                              borderRadius: customBorder(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.title,
                                  style: theme.textTheme.titleMedium,
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(e.description),
                                    Text(
                                      "${date.hour}:${date.minute} ${date.hour > 12 ? "pm" : "am"}",
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
