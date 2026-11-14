import 'package:flutter/material.dart';
import 'pokemon_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        title: const Text('PokéAPI + Firebase'),
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Text(
                    pokemon['name']
                        .toString()
                        .toUpperCase(),
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
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),

                  Text(
                    'Peso: ${pokemon['weight']}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 30),

                  ElevatedButton(
                    onPressed: () async {
                      await FirebaseFirestore.instance
                          .collection('pokemon')
                          .add({
                        'nombre': pokemon['name'],
                        'altura': pokemon['height'],
                        'peso': pokemon['weight'],
                        'fecha':
                        DateTime.now().toString(),
                      });

                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Datos guardados en Firebase',
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Guardar en Firebase',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}