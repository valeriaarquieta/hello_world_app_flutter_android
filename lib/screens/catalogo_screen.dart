import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'detalle_screen.dart';
import 'admin_screen.dart';

class CatalogoScreen extends StatelessWidget {
  const CatalogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo Pokémon'),
        actions: [
          IconButton(
            icon: const Icon(Icons.admin_panel_settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AdminScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('peliculas')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final peliculas = snapshot.data!.docs;

          return ListView.builder(
            itemCount: peliculas.length,
            itemBuilder: (context, index) {
              final pelicula = peliculas[index];

              return ListTile(
                leading: const Icon(Icons.movie),

                title: Text(
                  pelicula['titulo'],
                ),

                subtitle: Text(
                  pelicula['director'],
                ),

                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () async {
                    bool? eliminar = await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                          'Eliminar película',
                        ),
                        content: Text(
                          '¿Deseas eliminar "${pelicula['titulo']}"?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(
                                context,
                                false,
                              );
                            },
                            child: const Text(
                              'Cancelar',
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(
                                context,
                                true,
                              );
                            },
                            child: const Text(
                              'Eliminar',
                            ),
                          ),
                        ],
                      ),
                    );

                    if (eliminar == true) {
                      await FirebaseFirestore.instance
                          .collection('peliculas')
                          .doc(pelicula.id)
                          .delete();

                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Película eliminada',
                          ),
                        ),
                      );
                    }
                  },
                ),

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetalleScreen(
                        pelicula: pelicula,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}