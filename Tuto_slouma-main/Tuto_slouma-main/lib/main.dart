import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tuto_salim/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 128, 112, 156)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "              SFM SPEED TEST",
          style: TextStyle(color: const Color.fromARGB(255, 55, 61, 132)),
        ),
        backgroundColor: const Color(0xff858E6F),
      ),
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 128, 112, 156), // Fond violet
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 270,
                      child: Image.asset(
                        "assets/speedtest.png",
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  child: const Text("Test DOWNLOAD/UPLOAD"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const HomeScreen(),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
