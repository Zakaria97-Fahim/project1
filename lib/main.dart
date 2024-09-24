import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Quicksand',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quicksand Font Demo'),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Using Quicksand-Regular
              Text(
                'This is Quicksand Regular',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 20),
              // Using Quicksand-Bold
              Text(
                'This is Quicksand Bold',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold, // Bold weight
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
