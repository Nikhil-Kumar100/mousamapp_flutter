import 'package:flutter/material.dart';
import 'package:mausam/Work/work.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late String temp;
  late String hum;
  // ignore: non_constant_identifier_names
  late String air_speed;
  late String des;
  late String main;
  late String loc;
  late String icon;
  String city = "Bihar";
  void startApp(String city) async {
    Worker instance = Worker(location: city);
    await instance.getData();

    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.airSpeed;
    des = instance.description;
    main = instance.main;
    loc = instance.location;
    icon = instance.icon;
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_value": temp,
        "hum_value": hum,
        "air_speed_value": air_speed,
        "des_value": des,
        "main_value": main,
        "loc_value": loc,
        "icon_value": icon,
        "city_value": city,
      });
    });
    // print(main);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve the search text from the route settings arguments
    Map? searchtext = ModalRoute.of(context)?.settings.arguments as Map?;

    if (searchtext != null && searchtext.isNotEmpty) {
      city = searchtext["search"] as String;
      // print(city);
    }
    startApp(city);
    // Call the startApp function

    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              // stops: [0.1, 0.5],
              colors: [
                Color.fromARGB(255, 6, 134, 238),
                Color.fromARGB(255, 119, 127, 133)
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "asset/image/mlogo.png",
                height: 240,
                width: 240,
              ),
              const Text(
                "Mausam App",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Made By Nikhil",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              const SpinKitWave(
                color: Colors.white,
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
