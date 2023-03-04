import 'dart:math';

import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Cambiar luego por una instancia de movie
    final movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(),
        SliverList(delegate: SliverChildListDelegate([_PosterAndTitle()]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      backgroundColor: Color.fromARGB(255, 11, 227, 227),
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: SizedBox(
          width: double.infinity,
          child: Text(
            'Movie.title',
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: AssetImage('assets/prueba.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/loading.gif'),
                image: AssetImage('assets/no-image.jpg'),
                height: 150,
              )),
          const SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Text('movie.title',
                  style: textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2),
              Text('movie.originalTitle',
                  style: textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(
                    Icons.star_border_outlined,
                    size: 15,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  // ignore: deprecated_member_use
                  Text('movie.voteAverage', style: textTheme.caption)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
