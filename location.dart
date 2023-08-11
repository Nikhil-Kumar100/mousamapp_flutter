import 'package:flutter/material.dart';

// ignore: camel_case_types
class location extends StatefulWidget {
  const location({super.key});

  @override
  State<location> createState() => _locationState();
}

// ignore: camel_case_types
class _locationState extends State<location> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("location"),
    );
  }
}
