import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:safeguard_home_assignment/providers/error_provider.dart';
import 'package:safeguard_home_assignment/view/page_loading.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({super.key});

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  void initState() {
    super.initState();
    context.read<ErrorProvider>().initData();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = context.watch<ErrorProvider>().isLoading;
    if (isLoading) return const PageLoading();

    bool serviceEnabled = context.watch<ErrorProvider>().serviceEnabled;
    LocationPermission permission = context.watch<ErrorProvider>().permission!;
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
                Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 48,
                ),
                SizedBox(height: 16),
                Text(
                  "Oops! We have an error!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  !serviceEnabled
                      ? "Please activate the GPS services on your device"
                      : "We encountered an error, please try again later",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                if (permission.name == "denied" ||
                    permission.name == "deniedForever")
                  TextButton(
                      onPressed: () {
                        Geolocator.openLocationSettings();
                      },
                      child: Text("Click here to add permissions")),
                TextButton(
                    onPressed: () {
                      context.push("/");
                    },
                    child: Text("Refresh")),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
