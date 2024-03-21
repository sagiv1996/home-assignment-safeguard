import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:safeguard_home_assignment/providers/weather_provider.dart';
import 'package:weather/weather.dart';

class HomePageFooter extends StatelessWidget {
  const HomePageFooter({
    super.key,
  });

  Row _elementIntoRow(Icon icon, String label, String value) => Row(
        children: [
          icon,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w300),
              ),
              Text(
                value,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700),
              )
            ],
          ),
        ],
      );

  Padding _customDivider() => const Padding(
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 50),
        child: Divider(
          color: Colors.grey,
        ),
      );
  @override
  Widget build(BuildContext context) {
    Weather weather = context.watch<WeatherProvider>().weather!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
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
                DateFormat(DateFormat.HOUR24_MINUTE).format(weather.sunrise!)),
            _elementIntoRow(
                const Icon(
                  Icons.nightlight_outlined,
                  color: Colors.blueAccent,
                  size: 30,
                ),
                "sunset",
                DateFormat(DateFormat.HOUR24_MINUTE).format(weather.sunset!)),
          ],
        ),
        _customDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
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
                  Icons.device_thermostat_outlined,
                  color: Color.fromARGB(255, 188, 124, 200),
                  size: 30,
                ),
                "Min temp",
                "${weather.tempMin!.celsius!.round()} °C"),
          ],
        ),
        _customDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _elementIntoRow(
              const Icon(
                Icons.speed_outlined,
                color: Color.fromARGB(255, 242, 250, 158),
                size: 30,
              ),
              "Wind speed",
              "${weather.windSpeed!.round()} km",
            ),
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
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
