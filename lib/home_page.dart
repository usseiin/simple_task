import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'color.dart';
import 'components/folder_box.dart';
import 'models/folder.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.push("/account");
          },
          icon: const Icon(Icons.menu),
        ),
        title: Container(
          height: 45,
          alignment: Alignment.bottomCenter,
          child: const Text("Menu"),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.push("/calender");
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: _buildHomeBody(context, theme),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const StadiumBorder(),
        backgroundColor: mainColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}

Widget _buildHomeBody(BuildContext context, TextTheme theme) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
          ),
          children: [
            ...folders.map((folder) => FolderBox(folder: folder)),
            Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                border: Border.all(color: greyColor),
              ),
              child: Icon(
                Icons.add,
                size: MediaQuery.of(context).size.width / 6,
                color: greyColor,
              ),
            ),
          ],
        ),
      ),
    );
