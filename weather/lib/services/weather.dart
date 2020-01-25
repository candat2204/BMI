import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';
const apiKey = 'dd5b49880c5a73343a2d36955d75cb32';
const openWeatherMapUrl ='https://api.openweathermap.org/data/2.5/weather';


class WeatherModel {

  Future<dynamic> getCityWeather(String cityname) async {
    NetWorkHelper netWorkHelper = NetWorkHelper('$openWeatherMapUrl?q=$cityname&appid=$apiKey&units=metric');
    var weatherData = await netWorkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
  Location location = Location();
  await location.getCurrentLocation();
  NetWorkHelper netWorkHelper = NetWorkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

  var weatherData = await netWorkHelper.getData();
  return weatherData;
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
      return '🌞';
    } else if (condition <= 804) {
      return '🌞️';
    } else {
      return '🤷‍';
    }
  }

  String getWeatherBg(int condition) {

    if (condition < 300) {
      return 'images/bg9.jpeg';
    }  else if (condition < 600) {
      return 'images/bg10.jpeg';
    }  else if (condition < 800) {
      return 'images/bg8.jpeg';
    } else if (condition == 800) {
      return 'images/bg7.jpeg️';
    } else if (condition <= 804) {
      return 'images/bg6.jpeg';
    } else {
      return 'images/bg2.jpeg‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'Nong thay ba';
    } else if (temp > 20) {
      return 'Mat that su';
    } else if (temp < 10) {
      return 'Lanh binh thuong';
    } else {
      return 'Lanh vai lol';
    }
  }
}
