import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    required this.child,
    this.onPressed,
    super.key,
  });

  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Theme.of(context).colorScheme.primary,
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
