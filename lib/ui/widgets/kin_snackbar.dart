import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

void showErrorSnack(context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      content: Text(message).tr(),
      duration: const Duration(seconds: 2),
    ),
  );
}

void showSuccessSnack(context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.green,
      content: Text(message).tr(),
      duration: const Duration(seconds: 2),
    ),
  );
}
