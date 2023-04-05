import 'package:app/account_page.dart';
import 'package:app/login_page_password.dart';
import 'package:app/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'calender_page.dart';
import 'home_page.dart';
import 'login_page.dart';

part 'theme.dart';
part 'route.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Simple Task",
      theme: _appTheme,
      routerConfig: _router,
    );
  }
}
