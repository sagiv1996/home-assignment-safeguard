import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safeguard_home_assignment/view/home_page/home_page.dart';

void main() {
  runApp(const WeatherApp());
}

final GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: '/',
    builder: (context, state) => const HomePage(),
  )
]);

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ));
}
