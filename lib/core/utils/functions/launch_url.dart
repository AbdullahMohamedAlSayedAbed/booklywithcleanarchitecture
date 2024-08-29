import 'package:booklywithcleanarchitecture/core/utils/functions/build_error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUr(context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(
            
            buildErrorFunctions(errMessage: 'Cannot launch $url'));
    }
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(buildErrorFunctions(errMessage: 'Url is null $url'));
    print('Url is null');
  }
}
