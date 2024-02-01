import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_json/provider/data.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, value, child) {
        Map city = context.watch<DataProvider>().map;
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('search');
                  },
                  icon: const Icon(Icons.search))
            ],
            title: const Text('WeatherPage'),
          ),
          body: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 120,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.3), BlendMode.modulate),
                        fit: BoxFit.fill,
                        image: const NetworkImage(
                            'https://i.pinimg.com/736x/c1/64/5e/c1645e0627093fd4539c5e9992b65659.jpg'),
                        opacity: 5,
                      ),
                    ),
                    child: Center(
                        child: Text(
                      city['name'],
                      style: const TextStyle(fontSize: 35),
                    )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 70,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                          color: Colors.cyanAccent,
                          border: Border.all(width: 2)),
                      child: Center(
                        child: Text(
                          '${city["temperature"].toString()}°C',
                          style: const TextStyle(fontSize: 35),
                        ),
                      ),
                    ),
                    Container(
                      height: 70,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.pinkAccent,
                          border: Border.all(width: 2)),
                      child: Center(
                        child: Text(
                          'AQI= ${city['aqi'].toString()}',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.deepOrange,
                        border: Border.all(width: 2)),
                    child: Column(
                      children: [
                        const Icon(Icons.air, size: 40),
                        Text(
                          '${city['wind_speed'].toString()} Km/h',
                          style: const TextStyle(fontSize: 25),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.deepPurple,
                        border: Border.all(width: 2)),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.water_drop_outlined,
                          size: 40,
                        ),
                        Text(
                          '${city['humidity'].toString()} %',
                          style: const TextStyle(fontSize: 25),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.limeAccent,
                        border: Border.all(width: 2)),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.visibility,
                          size: 40,
                        ),
                        Text(
                          '${city['visibility'].toString()} Km',
                          style: const TextStyle(fontSize: 25),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 120,
                      width: 330,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.deepOrange,
                          border: Border.all(width: 2)),
                      child: Column(
                        children: [
                          Text(
                            '${city['sun']['sunrise']}',
                            style: const TextStyle(fontSize: 25),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
