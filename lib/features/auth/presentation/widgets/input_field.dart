import 'package:flutter/material.dart';
import 'package:test_app/core/index.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final bool enabled;

  const InputField({
    super.key,
    required this.enabled,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.obscureText,
    required this.keyboardType,
    this.validator,
    this.focusNode,
  });

  @override
  State<InputField> createState() => _InputFieldState();

  factory InputField.email({
    required TextEditingController controller,
    required bool disabled,
  }) =>
      InputField(
        controller: controller,
        labelText: 'Email',
        hintText: 'Enter your email',
        obscureText: false,
        keyboardType: TextInputType.emailAddress,
        enabled: !disabled,
        validator: (val) {
          if (val!.isEmpty) {
            return 'Email cannot be empty';
          } else if (!RegExp(emailValidator).hasMatch(val)) {
            return 'Email is incorrect';
          }
          return null;
        },
      );

  factory InputField.password({
    required TextEditingController controller,
    required bool disabled,
  }) =>
      InputField(
        controller: controller,
        labelText: 'Password',
        hintText: 'Enter your password',
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        enabled: !disabled,
        validator: (val) {
          if (val!.isEmpty) {
            return 'Password cannot be empty';
          } else if (!RegExp(passwordValidator).hasMatch(val)) {
            return 'Password should be between 6 and 10 characters\n(Uppercase, Lowercase, Number required)';
          }
          return null;
        },
      );
}

class _InputFieldState extends State<InputField> {
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (value) {
        if (!value) {
          setState(() {
            errorMessage = widget.validator?.call(widget.controller.text);
          });
        } else {
          setState(() {
            errorMessage = null;
          });
        }
      },
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        focusNode: widget.focusNode,
        enabled: widget.enabled,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: widget.labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          disabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.outline),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.outline),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
              width: 2,
            ),
          ),
          hintText: widget.hintText,
          errorText: errorMessage,
        ),
      ),
    );
  }
}
