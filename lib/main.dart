import 'package:booklywithcleanarchitecture/core/utils/app_router.dart';
import 'package:booklywithcleanarchitecture/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const BooklyApplication());
}

class BooklyApplication extends StatelessWidget {
  const BooklyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(kPrimaryColor),
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}

