import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchControlar = TextEditingController();
  Map<String, dynamic> info = {}; // Initialize an empty map
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    // print("this is set state");
  }

  @override
  Widget build(BuildContext context) {
    // Access the 'info' map from ModalRoute settings arguments
    info = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    String icon1 = (info["icon_value"]);
    String hum = (info["hum_value"]);
    String airSpeed = ((info["air_speed_value"]).toString());
    String temp1 = ((info["temp_value"]).toString());
    if (temp1 == "NA") {
      // print("NA");
    } else {
      temp1 = ((info["temp_value"]).toString().substring(0, 4));
      airSpeed = ((info["air_speed_value"]).toString().substring(0, 4));
    }
    String des = (info["des_value"]);

    String loc = (info["loc_value"]);
    // String city1 = (info["city_value"]);
    // String main = (info["main_value"]);
    // print(temp1);
    // print(icon1);
    var cityName = [
      "Mumbai",
      "Delhi",
      "Bangalore",
      "Chennai",
      "Kolkata",
      "Hyderabad",
      "Pune",
      "Ahmedabad",
      "Jaipur",
      "Surat",
      "Lucknow",
      "Kanpur",
      "Nagpur",
      "Indore",
      "Thane",
      "Bhopal",
      "Visakhapatnam",
      "Pimpri-Chinchwad",
      "Patna",
      "Vadodara",
      "Ghaziabad",
      "Ludhiana",
      "Coimbatore",
      "Agra",
      "Madurai",
      "Nashik",
      "Faridabad",
      "Meerut",
      "Rajkot",
      "Varanasi",
      "Srinagar",
      "Aurangabad",
      "Dhanbad",
      "Amritsar",
      "Navi Mumbai",
      "Allahabad",
      "Howrah",
      "Gwalior",
      "Jabalpur",
      "Vijayawada",
      "Jodhpur",
      "Raipur",
      "Kota",
      "Guwahati",
      "Chandigarh",
      "Solapur",
      "Hubli-Dharwad",
      "Bareilly",
      "Moradabad",
      "Mysore",
      "Gurgaon",
      "Aligarh",
      "Jalandhar",
      "Tiruchirappalli",
      "Bhubaneswar",
      "Salem",
      "Mira-Bhayandar",
      "Warangal",
      "Thiruvananthapuram",
      "Bhiwandi",
      "Saharanpur",
      "Guntur",
      "Amravati",
      "Bikaner",
      "Noida",
      "Jamshedpur",
      "Bhilai",
      "Cuttack",
      "Firozabad",
      "Kochi",
      "Nellore",
      "Bhavnagar",
      "Dehradun",
      "Durgapur",
      "Asansol",
      "Rourkela",
      "Nanded",
      "Kolhapur",
      "Ajmer",
      "Akola",
      "Gulbarga",
      "Jamnagar",
      "Ujjain",
      "Loni",
      "Siliguri",
      "Jhansi",
      "Ulhasnagar",
      "Jammu",
      "Sangli-Miraj & Kupwad",
      "Mangalore",
      "Erode",
      "Belgaum",
      "Ambattur",
      "Tirunelveli",
      "Malegaon",
      "Gaya",
      "Jalgaon",
      "Udaipur",
      "Maheshtala",
      "Davanagere",
      "Kozhikode",
      "Akbarpur",
      "North Dumdum",
      "Majra",
      "Latur",
      "Imphal",
      "Karimnagar",
      "Muzaffarpur",
      "Rampur",
      "Shahjahanpur",
      "Jhunjhunun",
      "Mandya",
      "Shivamogga",
      "Muzaffarnagar",
      "Noida Extension",
      "Bharatpur",
      "Farrukhabad",
      "Sri Ganganagar",
      "Bhilwara",
      "Kaithal",
      "Nagaur",
      "Vellore",
      "Machilipatnam",
      "Titagarh",
      "Rae Bareli",
      "Agartala",
      "Gandhinagar",
      "Korba",
      "Karnal",
      "Hajipur",
      "Sikar",
      "Thoothukudi",
      "Ratlam",
      "Hapur",
      "Anantapur",
      "Rajpur Sonarpur",
      "Bardhaman",
      "Sambalpur",
      "Ambala",
      "Singrauli",
      "Kurnool",
      "Gurgaon",
      "Raebareli",
      "Morvi",
      "Durg",
      "Shimla",
      "Chandrapur",
      "Junagadh",
      "Thanjavur",
      "Bardhaman",
      "Guna",
      "Ahmednagar",
      "Nadiad",
      "Baranagar",
      "Yamunanagar",
      "Pali",
      "Satna",
      "Serampore",
      "Secunderabad",
      "Kadapa",
      "Alleppey",
      "Alwar",
      "Arrah",
      "Panvel",
      "Bathinda",
      "Kharagpur",
      "Dindigul",
      "Mirzapur",
      "Nanded",
      "Mangalore",
      "Hindupur",
      "Karawal Nagar",
      "Jabalpur",
      "Bally",
      "Karnal",
      "Ichalkaranji",
      "Tiruvottiyur",
      "Gurgaon",
      "Bihar Sharif",
      "Panipat",
      "Darbhanga",
      "Bally",
      "Naihati",
      "Shillong",
      "Delhi",
      "New Delhi",
      "Karimnagar",
      "Bhilwara",
      "Gurgaon",
      "Kollam",
      "Ratlam",
      "Imphal",
      "Etawah",
      "Kollam",
      "Amravati",
      "Agra",
      "Gwalior",
      "Jalgaon",
      "Nellore",
      "Agartala",
      "Bhagalpur",
      "Muzaffarnagar",
      "Bhatpara",
      "Panihati",
      "Latur",
      "Dhule",
      "Tirupati",
      "Khandwa",
      "Chittoor",
      "Jammu",
      "Udaipur",
      "Bellary",
      "Gulbarga",
      "Gaya",
      "Jalgaon",
      "Udaipur",
      "Gaya",
      "Jalgaon",
      "Udaipur",
      "Gaya",
      "Jalgaon",
      "Udaipur",
      "Pallavaram",
      "Nizamabad",
      "Tumkur",
      "Rajpur Sonarpur",
      "South Dumdum",
      "Avadi",
      "Jamnagar",
      "Udupi",
      "Ulhasnagar",
      "Nalgonda",
      "Kollam",
      "Sangli-Miraj & Kupwad",
      "Erode",
      "Sangli-Miraj & Kupwad",
      "Raurkela Industrial"
    ];
    final random = Random();
    var city = cityName[random.nextInt(cityName.length)];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(backgroundColor: const Color.fromARGB(255, 26, 117, 201)),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
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
              children: <Widget>[
                Container(
                  //Search wala Cantenar
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),

                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          if ((searchControlar.text).replaceAll(" ", "") ==
                              "") {
                            // ignore: avoid_print
                            print("Empty Search");
                          } else {
                            Navigator.pushReplacementNamed(context, "/loding",
                                arguments: {
                                  "search": searchControlar.text,
                                });
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(4, 0, 10, 0),
                          child: const Icon(
                            Icons.search,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchControlar,
                          decoration: InputDecoration(
                              hintText: "Search $city",
                              border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.6),
                        ),
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            Image.network(
                              "https://openweathermap.org/img/wn/$icon1@2x.png",
                              height: 100,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text(
                                  des,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  loc, //yah loketion variyebal hai
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.6),
                        ),
                        padding: const EdgeInsets.all(26),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(FontAwesomeIcons.temperatureHalf),
                            const SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  temp1, //yeeh temprecher veriyebal hai
                                  style: const TextStyle(
                                    fontSize: 80,
                                  ),
                                ),
                                const Text(
                                  "C",
                                  style: TextStyle(
                                    fontSize: 40,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.6),
                        ),
                        padding: const EdgeInsets.all(26),
                        margin: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(FontAwesomeIcons.wind),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              airSpeed, //yeh air  speed veriyebl hai
                              style: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            const Text("km/hr"),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.6),
                        ),
                        padding: const EdgeInsets.all(26),
                        margin: const EdgeInsets.fromLTRB(10, 0, 24, 0),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(FontAwesomeIcons.droplet),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              hum,
                              style: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            const Text("%Percent"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(30),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Made by Nikhil Kumar"),
                      Text("Data provided by openweathermap.org"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
