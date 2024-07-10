import 'package:flutter/material.dart';

SnackBar buildErrorFunctions({required String errMessage}) {
  return SnackBar(
    content: Text(errMessage),
    duration: const Duration(seconds: 5),
  );
}
