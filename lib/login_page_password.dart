import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'components/components.dart';

class LoginPagePassword extends StatelessWidget {
  const LoginPagePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
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
                "Hey, John!\nWelcome back!",
                style: theme.textTheme.titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text("Enter your password"),
              const SizedBox(height: 4),
              const InputBox(hintText: "password"),
              const SizedBox(height: 60),
              const SocialAuth(),
              const SizedBox(height: 50),
              AuthButton(callback: () => context.go("/")),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
