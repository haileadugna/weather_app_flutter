import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/settings.dart';

const apiKey = 'f8666b652afcf540cca7cc0fa5898c27';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
const openforecast = 'https://api.openweathermap.org/data/2.5/forecast';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');
    NetworkHelper network =
        NetworkHelper('$openforecast?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    var data = await network.getData();
  ;
    return data;
  }

  Future<dynamic> getLocationWeather(String selectedUnit) async {
    Location location = Location();
    await location.getCurrentLocation();
    // print(selectedUnit);
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=$selectedUnit');
    NetworkHelper network =
        NetworkHelper('$openforecast?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    var data = await network.getData();
    // print(data);
    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25 && temp > 25 + 273) {
      return 'It\'s 🍦 time';
    } else if (temp > 20 && temp > 20 + 273) {
      return 'Time for shorts and 👕';
    } else if (temp < 10 && temp < 10 + 273) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  String getImage(int temp) {
    if (temp > 298) {
      return 'image/hot.jpeg';
    } else if (temp > 293) {
      return 'image/sunny.jpeg';
    } else if (temp > 250 && temp < 293) {
      return 'image/cloud.jpeg';
    } else if (temp > 50 && temp < 60) {
      return 'image/cloud.jpeg';
    } else if (temp > 25) {
      return 'image/hot.jpeg';
    } else if (temp > 20) {
      return 'image/sunny.jpeg';
    } else if (temp < 10) {
      return 'image/cold.jpeg';
    } else {
      return 'image/cloud.jpeg';
    }
  }
}
