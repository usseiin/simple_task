import 'package:app/color.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    var name = "John";
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.question_mark_rounded,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Icon(
              Icons.person_outline,
              size: 100,
            ),
            const SizedBox(height: 16),
            Text("Hi $name!"),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                color: faintPurpleBackground,
                child: ListView(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.edit),
                      title: Text("Edit account"),
                    ),
                    ListTile(
                      leading: Icon(Icons.auto_graph),
                      title: Text("My statistic"),
                    ),
                    ListTile(
                      leading: Icon(Icons.calendar_month),
                      title: Text("Calender"),
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text("Settings"),
                    ),
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text("Exit"),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
