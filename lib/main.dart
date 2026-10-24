import 'package:flutter/material.dart';

void main() {
  runApp(const LDSWApp());
}

class LDSWApp extends StatelessWidget {
  const LDSWApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LDSW Actividad 3.4',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text widget
              const Text(
                'Hello World',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              // Row widget
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('A'),
                  SizedBox(width: 10),
                  Text('B'),
                  SizedBox(width: 10),
                  Text('C'),
                ],
              ),

              const SizedBox(height: 20),

              // Container widget
              Container(
                width: 150,
                height: 100,
                color: Colors.blueAccent,
                child: const Center(
                  child: Text(
                    'Soy un Container',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Stack widget
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    color: Colors.redAccent,
                  ),
                  const Text(
                    'Stack encima',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
