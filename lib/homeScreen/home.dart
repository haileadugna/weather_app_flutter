import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/screen/city_screen.dart';
import 'package:clima/screen/weather_details_screen.dart';
import 'package:clima/services/settings.dart';
import '../services/contactus.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<LocationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  WeatherModel weather = WeatherModel();

  late int temperature;
  late String weatherIcon;
  late String cityName;
  late String weatherMessage;
  late String humidity;
  late String speed;
  late String direction;
  late String backimage;
  List<dynamic> forecastData = [];

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    print(weatherData);
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather data';
        cityName = '';
        backimage = "image/hot.jpeg";
        humidity = '';
        speed = '';
        direction = '';
        return;
      }

      var currentWeather = weatherData["list"][0];
      temperature = currentWeather['main']['temp'].toInt();
      var condition = currentWeather['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      weatherMessage = weather.getMessage(temperature);
      cityName = weatherData['city']['name'];
      var humidit = currentWeather['main']['humidity'];
      humidity = humidit.toString();
      var speeded = currentWeather['wind']['speed'];
      speed = speeded.toString();
      var directions = currentWeather['wind']['deg'];
      direction = directions.toString();
      backimage = weather.getImage(temperature);

      forecastData = weatherData["list"].sublist(1, 15);
    });
  }

  void navigateToDetailsScreen({
    required int temperature,
    required String humidity,
    required String weatherIcon,
    required String cityName,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WeatherDetailsScreen(
          temperature: temperature,
          humidity: humidity,
          weatherIcon: weatherIcon,
          cityName: cityName,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Center(child: Text('Weather App')),
        actions: [
          IconButton(
            onPressed: () async {
              var typedName = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CityScreen();
                  },
                ),
              );
              if (typedName != null) {
                var weatherData = await weather.getCityWeather(typedName);
                updateUI(weatherData);
              }
            },
            icon: Icon(
              Icons.location_city,
              size: 30.0,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(backimage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        '$temperature',
                        style: TextStyle(
                          fontSize: 44.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        '$cityName',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    weatherMessage,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.blue,
              ),
              title: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              onTap: () async {
                // Handle settings tap
                var typedName = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return UnitChangePage();
                    },
                  ),
                );

                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(
                Icons.info,
                color: Colors.blue,
              ),
              title: Text('About'),
              onTap: () {
                Navigator.pop(context);
                showAboutDialog(
                  context: context,
                  applicationName: 'Weather App',
                  applicationVersion: '1.0.0',
                  children: [
                    Text('Created by: Haile and His Team'),
                  ],
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.email,
                color: Colors.blue,
              ),
              title: Text('Contact Us'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactUsPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backimage),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.details,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        navigateToDetailsScreen(
                          temperature: temperature,
                          humidity: humidity,
                          weatherIcon: weatherIcon,
                          cityName: cityName,
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '$cityName',
                      style: kCityNameTextStyle,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    // color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ListView.builder(
                      itemCount: forecastData.length,
                      itemBuilder: (context, index) {
                        var forecastItem = forecastData[index];
                        var forecastTemperature = forecastItem['main']['temp'].toInt();
                        var forecastCondition = forecastItem['weather'][0]['id'];
                        var forecastIcon = weather.getWeatherIcon(forecastCondition);
                        var forecastTime = DateTime.fromMillisecondsSinceEpoch(forecastItem['dt'] * 1000);
                        var formattedTime = DateFormat('E, h a').format(forecastTime);

                        return Card(
                          elevation: 5.0,
                          color: Colors.white.withOpacity(0.7),
                          child: ListTile(
                            onTap: () {
                              navigateToDetailsScreen(
                                temperature: forecastTemperature,
                                humidity: humidity,
                                weatherIcon: forecastIcon,
                                cityName: cityName,
                              );
                            },
                            leading: Text(
                              '$formattedTime',
                              style: kForecastTimeTextStyle,
                            ),
                            title: Text(
                              '$forecastTemperature°',
                              style: kForecastTemperatureTextStyle,
                            ),
                            trailing: Text(
                              forecastIcon,
                              style: kForecastIconTextStyle,
                            ),
                          ),
                        );
                      },
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
