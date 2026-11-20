import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminScreen extends StatelessWidget {

  AdminScreen({super.key});

  final tituloController =
  TextEditingController();

  final anioController =
  TextEditingController();

  final directorController =
  TextEditingController();

  final generoController =
  TextEditingController();

  final sinopsisController =
  TextEditingController();

  final imagenController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Administración',
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller: tituloController,
              decoration: const InputDecoration(
                  labelText: 'Título'),
            ),

            TextField(
              controller: anioController,
              decoration: const InputDecoration(
                  labelText: 'Año'),
            ),

            TextField(
              controller: directorController,
              decoration: const InputDecoration(
                  labelText: 'Director'),
            ),

            TextField(
              controller: generoController,
              decoration: const InputDecoration(
                  labelText: 'Género'),
            ),

            TextField(
              controller: sinopsisController,
              decoration: const InputDecoration(
                  labelText: 'Sinopsis'),
            ),

            TextField(
              controller: imagenController,
              decoration: const InputDecoration(
                  labelText: 'URL Imagen'),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {

                await FirebaseFirestore.instance
                    .collection('peliculas')
                    .add({

                  'titulo':
                  tituloController.text,

                  'anio':
                  int.parse(
                      anioController.text),

                  'director':
                  directorController.text,

                  'genero':
                  generoController.text,

                  'sinopsis':
                  sinopsisController.text,

                  'imagen':
                  imagenController.text,
                });

                Navigator.pop(context);
              },

              child: const Text(
                'Guardar película',
              ),
            ),
          ],
        ),
      ),
    );
  }
}