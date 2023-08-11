import 'package:http/http.dart';
import 'dart:convert';

class Worker {
  String location;

  // Constructor
  Worker({required this.location});

  late String temp;
  late String humidity;
  late String airSpeed;
  late String description;
  late String main;
  late String icon;

  // Method
  Future<void> getData() async {
    try {
      // print("try");
      final Uri url = Uri.parse(
          "http://api.openweathermap.org/data/2.5/weather?q=$location&appid=235cfb8d53d2176b786979329e0c9775");

      Response response = await get(url);
      Map data = jsonDecode(response.body);

      // Getting Temp, Humidity
      Map tempData = data['main'];
      String getHumidity = tempData['humidity'].toString();
      double getTemp = tempData['temp'] - 273.15;

      // Getting airSpeed
      Map wind = data['wind'];
      double getAirSpeed = wind["speed"] / 0.27777777777778;

      // Getting Description
      List weatherData = data['weather'];
      Map weatherMainData = weatherData[0];
      String getMainDes = weatherMainData['main'];
      String getDesc = weatherMainData["description"];
      String iconn = weatherMainData["icon"];

      // Assigning Values
      temp = getTemp.toStringAsFixed(2);
      humidity = getHumidity;
      airSpeed = getAirSpeed.toStringAsFixed(2);
      description = getDesc;
      main = getMainDes;
      icon = iconn;
    } catch (e) {
      temp = "NA";
      humidity = "NA";
      airSpeed = "NA";
      description = "Wrong Spelling";
      main = "NA";
      icon = "01d";
    }
  }
}
