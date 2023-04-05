import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'components/components.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Expanded(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/app_icon.png",
                    width: 35,
                    height: 35,
                  ),
                ],
              ),
            ),
            Text(
              "Hey!\nYou are new here?\nSignup!",
              style: theme.textTheme.titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const InputBox(hintText: "email"),
            const SizedBox(height: 10),
            const InputBox(hintText: "password"),
            const SizedBox(height: 60),
            const SocialAuth(),
            const SizedBox(height: 50),
            AuthButton(callback: () {}),
            SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: theme.textTheme.titleSmall,
                  ),
                  TextButton(
                    onPressed: () {
                      context.go("/login");
                    },
                    child: const Text(
                      "Log in",
                      style: TextStyle(
                        decorationStyle: TextDecorationStyle.dashed,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
