import 'package:flutter/material.dart';
import 'package:movies/widgets/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 11, 227, 227),
          title: Text('Movies in theaters'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: const [
            // * CardSwiper

            CardSwiper(),

            //* Listado Horizontal de Peliculas
            MovieSlieder(),
          ],
        )));
  }
}
