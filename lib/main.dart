import 'package:booklywithcleanarchitecture/Features/splash/presention/views/splash_view.dart';
import 'package:booklywithcleanarchitecture/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

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
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashView();
      },
    ),
  ],
);
