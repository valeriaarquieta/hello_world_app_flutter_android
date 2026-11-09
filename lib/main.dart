import 'package:flutter/material.dart';
import 'pokemon_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PokemonPage(),
    );
  }
}

class PokemonPage extends StatelessWidget {
  const PokemonPage({super.key});

  @override
  Widget build(BuildContext context) {

    final servicio = PokemonService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('PokéAPI'),
      ),

      body: FutureBuilder<Map<String, dynamic>>(
        future: servicio.obtenerPokemon(),

        builder: (context, snapshot) {

          if (snapshot.connectionState ==
              ConnectionState.waiting) {

            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {

            return Center(
              child: Text(
                'Error: ${snapshot.error}',
              ),
            );
          }

          final pokemon = snapshot.data!;

          return Center(
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [

                Text(
                  pokemon['name'].toString().toUpperCase(),
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                Image.network(
                  pokemon['sprites']['front_default'],
                  width: 200,
                ),

                const SizedBox(height: 20),

                Text(
                  'Altura: ${pokemon['height']}',
                  style: const TextStyle(fontSize: 18),
                ),

                Text(
                  'Peso: ${pokemon['weight']}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}