import 'package:flutter/material.dart';

class DetalleScreen extends StatelessWidget {

  final dynamic pelicula;

  const DetalleScreen({
    super.key,
    required this.pelicula,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          pelicula['titulo'],
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              Image.network(
                pelicula['imagen'],
              ),

              const SizedBox(height: 20),

              Text(
                pelicula['titulo'],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                'Año: ${pelicula['anio']}',
              ),

              Text(
                'Director: ${pelicula['director']}',
              ),

              Text(
                'Género: ${pelicula['genero']}',
              ),

              const SizedBox(height: 20),

              Text(
                pelicula['sinopsis'],
              ),
            ],
          ),
        ),
      ),
    );
  }
}