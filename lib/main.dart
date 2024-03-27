import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:safeguard_home_assignment/providers/error_provider.dart';
import 'package:safeguard_home_assignment/providers/map_provider.dart';
import 'package:safeguard_home_assignment/providers/weather_static_data.dart';
import 'package:safeguard_home_assignment/providers/weather_factory_provider.dart';
import 'package:safeguard_home_assignment/view/pages/static_page.dart';
import 'package:safeguard_home_assignment/view/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:safeguard_home_assignment/view/pages/search_page.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const WeatherApp());
}

final GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: '/',
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: '/search',
    builder: (context, state) => const SearchPage(),
  ),
  GoRoute(
    path: '/static',
    builder: (context, state) => const StaticPage(),
  ),
]);

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WeatherStaticData()),
        ChangeNotifierProvider(create: (context) => WeatherProvider()),
        ChangeNotifierProvider(create: (context) => MapProvider()),
        ChangeNotifierProvider(create: (context) => ErrorProvider()),
      ],
      child: MaterialApp.router(
          routerConfig: router,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          )),
    );
  }
}
