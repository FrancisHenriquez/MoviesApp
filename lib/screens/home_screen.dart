import 'package:flutter/material.dart';
import 'package:movies/widgets/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Movies in theaters'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
          ],
        ),
        body: Column(
          children: [
            // TODO: CardSwiper

            CardSwiper()

            // Listado Horizontal de Peliculas
          ],
        ));
  }
}
