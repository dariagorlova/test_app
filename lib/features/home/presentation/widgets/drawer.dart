import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/index.dart';
import 'package:test_app/features/auth/index.dart';
import 'package:test_app/features/home/index.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = (context.read<SignInBloc>().state as SignInSuccess).data;

    return Drawer(
      width: 268,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Container(
                padding: const EdgeInsets.only(left: 16),
                height: 56,
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )),
            UserInfo(data: data),
            const Spacer(),
            InkWell(
              onTap: () => _logOut(context),
              child: Container(
                  padding: const EdgeInsets.only(left: 16),
                  height: 56,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Icon(Icons.logout, size: 24),
                        SizedBox(width: 12),
                        Text(
                          'Log out',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  void _logOut(BuildContext context) {
    Utils.instance.confirmDialog(context, () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AuthScreen(),
        ),
      );
    });
  }
}
