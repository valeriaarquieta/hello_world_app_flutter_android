import 'package:flutter/material.dart';

void main() {
  runApp(const LDSWApp());
}

class LDSWApp extends StatelessWidget {
  const LDSWApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LDSW Actividad 3.4',
      home: Scaffold(
        body: Stack(
          children: [

            // Imagen de fondo
            SizedBox.expand(
              child: Image.asset(
                'fondo.jpeg',
                fit: BoxFit.cover,
              ),
            ),

            // Contenido principal
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.black.withOpacity(0.5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    // Icono
                    const Icon(
                      Icons.flutter_dash,
                      color: Colors.white,
                      size: 80,
                    ),

                    const SizedBox(height: 20),

                    // Nombre de la aplicación
                    const Text(
                      'LDSW Actividad 3.4',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Mensaje de bienvenida
                    const Text(
                      'Welcome to Flutter',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Hello World
                    const Text(
                      'Hello World',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Row
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.star, color: Colors.amber),
                        SizedBox(width: 10),
                        Text(
                          'Flutter',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}