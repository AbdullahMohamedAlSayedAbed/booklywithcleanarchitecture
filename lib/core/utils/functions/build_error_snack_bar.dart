import 'package:booklywithcleanarchitecture/core/utils/styles.dart';
import 'package:flutter/material.dart';

SnackBar buildErrorFunctions({required String errMessage}) {
  return SnackBar(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsetsDirectional.all(20),
    content: Text(
      errMessage,
      style: Styles.style16,
    ),
    duration: const Duration(seconds: 5),
  );
}
