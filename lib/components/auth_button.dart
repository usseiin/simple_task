import 'package:flutter/material.dart';

import '../color.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    this.title = "Continue",
    required this.callback,
  });

  final String title;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: callback,
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(faintPurpleBackground),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: customBorder(8),
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(color: theme.colorScheme.onPrimary),
        ),
      ),
    );
  }
}

BorderRadius customBorder(int radius) {
  return const BorderRadius.only(
    topRight: Radius.circular(8),
    bottomLeft: Radius.circular(8),
    bottomRight: Radius.circular(8),
  );
}
