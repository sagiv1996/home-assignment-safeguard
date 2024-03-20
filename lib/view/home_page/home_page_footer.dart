import 'package:flutter/material.dart';

class HomePageFooter extends StatelessWidget {
  const HomePageFooter({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.sunny,
                    color: Colors.yellow,
                    size: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sunrise",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "5:34",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.nightlight,
                    color: Colors.blueAccent,
                    size: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "sunset",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "18:32",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 7, horizontal: 50),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.device_thermostat,
                    color: Colors.red,
                    size: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Max temp",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "33°C",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.device_thermostat,
                    color: Color.fromARGB(255, 188, 124, 200),
                    size: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Min temp",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "11°C",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      );
}
