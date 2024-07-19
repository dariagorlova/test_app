import 'package:flutter/material.dart';

class Utils {
  Utils._();
  static final instance = Utils._();

  Future<bool?> confirmDialog(BuildContext context, VoidCallback? onYes) async {
    return await showDialog<bool>(
        barrierDismissible: false,
        builder: (ctx) => _popup(
              title: 'Log out',
              body: 'Are you sure you want to log out?',
              noTitle: 'Cancel',
              yesTitle: 'Log out',
              onYesPressed: onYes,
            ),
        context: context);
  }

  Widget _popup({
    required String title,
    required String body,
    required String noTitle,
    required String yesTitle,
    VoidCallback? onYesPressed,
  }) {
    return Builder(
      builder: (context) => AlertDialog(
        scrollable: true,
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        surfaceTintColor: Colors.transparent,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        content: Text(
          body,
          style: const TextStyle(fontSize: 14),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text(
                  noTitle,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onSurface),
                ),
                onPressed: () => Navigator.pop(context, false),
              ),
              const SizedBox(width: 5),
              TextButton(
                onPressed: onYesPressed,
                child: Text(
                  yesTitle,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
