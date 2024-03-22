import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:safeguard_home_assignment/providers/weather_provider.dart';
import 'package:weather/weather.dart';

const Padding _customDivider = Padding(
  padding: EdgeInsets.symmetric(vertical: 6),
  child: Divider(
    color: Colors.white70,
  ),
);

class HomePageFooter extends StatelessWidget {
  const HomePageFooter({
    super.key,
  });

  Widget _elementIntoRow(Icon icon, String label, String value) => SizedBox(
        width: 70,
        child: Column(
          children: [
            icon,
            Text(
              value,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700),
            ),
            Text(
              label,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w300),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    Weather weather = context.watch<WeatherProvider>().weather!;
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _customDivider,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _elementIntoRow(
                  Icon(
                    Icons.wb_sunny_outlined,
                    color: Colors.amber[200],
                    size: 30,
                  ),
                  "Sunrise",
                  DateFormat(DateFormat.HOUR24_MINUTE)
                      .format(weather.sunrise!)),
              _elementIntoRow(
                  const Icon(
                    Icons.device_thermostat_outlined,
                    color: Colors.red,
                    size: 30,
                  ),
                  "Max temp",
                  "${weather.tempMax!.celsius!.round()} °C"),
              _elementIntoRow(
                const Icon(
                  Icons.speed_outlined,
                  color: Color.fromARGB(255, 242, 250, 158),
                  size: 30,
                ),
                "Wind",
                "${weather.windSpeed!.round()} km",
              )
            ],
          ),
          _customDivider,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _elementIntoRow(
                  const Icon(
                    Icons.nightlight_outlined,
                    color: Colors.blueAccent,
                    size: 30,
                  ),
                  "Sunset",
                  DateFormat(DateFormat.HOUR24_MINUTE).format(weather.sunset!)),
              _elementIntoRow(
                  const Icon(
                    Icons.device_thermostat_outlined,
                    color: Color.fromARGB(255, 188, 124, 200),
                    size: 30,
                  ),
                  "Min temp",
                  "${weather.tempMin!.celsius!.round()} °C"),
              _elementIntoRow(
                const Icon(
                  Icons.sunny_snowing,
                  color: Color.fromARGB(255, 145, 103, 111),
                  size: 30,
                ),
                "Humidity",
                "${weather.humidity!.round()} km",
              ),
            ],
          ),
          _customDivider,
        ],
      ),
    );
  }
}
