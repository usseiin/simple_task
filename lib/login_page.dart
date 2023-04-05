import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'components/components.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
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
              const Center(
                child: Icon(
                  Icons.person_outline,
                  size: 100,
                ),
              ),
              const SizedBox(height: 20),
              const Text("Enter your name"),
              const SizedBox(height: 4),
              const InputBox(hintText: "name"),
              const SizedBox(height: 60),
              const SocialAuth(),
              const SizedBox(height: 50),
              AuthButton(callback: () => context.go("/login/password")),
              SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: theme.textTheme.titleSmall,
                    ),
                    TextButton(
                      onPressed: () => context.go("/registration"),
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          decorationStyle: TextDecorationStyle.dashed,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
