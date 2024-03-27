import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:safeguard_home_assignment/providers/error_provider.dart';
import 'package:safeguard_home_assignment/providers/weather_factory_provider.dart';
import 'package:safeguard_home_assignment/view/loading_page.dart';

const _globalTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w300,
);

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    ErrorProvider errorProvider = context.watch<ErrorProvider>();
    bool isLoading = errorProvider.isLoading;
    if (isLoading) return const LoadingPage();

    bool serviceEnabled = errorProvider.serviceEnabled;
    bool permissionIsDenied =
        context.watch<ErrorProvider>().permission!.name.contains("denied");

    return Scaffold(
        body: Center(
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 48,
                ),
                const SizedBox(height: 16),
                const Text(
                  "Oops! We have an error!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Builder(
                  builder: (context) {
                    if (!serviceEnabled) {
                      return const Text(
                        "Please activate the GPS services on your device",
                        style: _globalTextStyle,
                        textAlign: TextAlign.center,
                      );
                    }
                    if (permissionIsDenied) {
                      return Column(
                        children: [
                          const Text(
                            "Permission is required to access the location of the device.",
                            textAlign: TextAlign.center,
                            style: _globalTextStyle,
                          ),
                          TextButton(
                              onPressed: () =>
                                  Geolocator.openLocationSettings(),
                              child:
                                  const Text("Click here to add permissions"))
                        ],
                      );
                    }
                    return const Text(
                        "We encountered an error, please try again later",
                        textAlign: TextAlign.center,
                        style: _globalTextStyle);
                  },
                ),
                TextButton(
                    onPressed: () {
                      context
                          .read<WeatherProvider>()
                          .fetchWeatherByCurrentPosition();
                      context.replace("/");
                    },
                    child: const Text("Refresh")),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
