import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/homeScreen/home.dart';
import 'package:clima/services/weather.dart';

class WeatherDetailsScreen extends StatefulWidget {
  final int temperature;
  final String humidity;
  final String weatherIcon;
  final String cityName;

  WeatherDetailsScreen({
    required this.temperature,
    required this.humidity,
    required this.weatherIcon,
    required this.cityName,
  });

  @override
  _WeatherDetailsScreenState createState() => _WeatherDetailsScreenState();
}

class _WeatherDetailsScreenState extends State<WeatherDetailsScreen> {
  WeatherModel weather = WeatherModel();
  String speed = "";
  String direction = "";
  String backimage = "image/cloud.jpeg";

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  void updateUI() {
    // Fetch weather data using the cityName or any other method
    // and update the speed, direction, and backimage variables accordingly
    // For demonstration purposes, we'll use a placeholder value here

    // Placeholder weather data
    dynamic weatherData = {
      'wind': {'speed': 10.5, 'deg': 180}
    };

    setState(() {
      var speeded = weatherData['wind']['speed'];
      speed = speeded.toString();
      var directions = weatherData['wind']['deg'];
      direction = directions.toString();
      backimage = weather.getImage(widget.temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Details'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF2196F3), // Light Blue
              Color(0xFF0D47A1), // Dark Blue
            ],
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.0),
                      Text(
                        widget.cityName,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${widget.temperature}°',
                            style: TextStyle(
                              fontSize: 80.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.weatherIcon,
                            style: TextStyle(
                              fontSize: 80.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 20.0),
                        ListTile(
                          leading: Icon(
                            Icons.water_drop,
                            size: 30.0,
                            color: Colors.blueAccent,
                          ),
                          title: Text(
                            'Humidity',
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          
                          subtitle: Text(
                            widget.humidity,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 40.0),
                        ListTile(
                          leading: Icon(
                            Icons.air,
                            size: 30.0,
                            color: Colors.blueAccent,
                          ),
                          title: Text(
                            'Wind Speed',
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            speed,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 40.0),
                        ListTile(
                          leading: Icon(
                            Icons.navigation,
                            size: 30.0,
                            color: Colors.blueAccent,
                          ),
                          title: Text(
                            'Wind Direction',
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            direction,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        // Add more weather details here as needed
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
