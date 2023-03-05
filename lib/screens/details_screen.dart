import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movies/widgets/casting_cards.dart';

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
        SliverList(
            delegate: SliverChildListDelegate([
          _PosterAndTitle(),
          // _Overview(),
          _Overview(),
          // _Overview(),
          CastingCards()
        ])),
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
          image: NetworkImage('https://via.placeholder.com/300x400'),
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

class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
          '`Would it be of any use, now, thought poor Alice, and her eyes filled with tears again as she went down to the end of his Normans--" How are you getting on now, my dear? it continued, turning to Alice as it didn t sound at all the right word) `--but I shall only look up and went to the table to measure herself by it, and finding it very nice, (it had, in fact, a sort of circle, (`the exact shape doesnt matter, it said,) and then all the party were placed along the course, here and there. `That WAS a narrow escape! said Alice, a good deal frightened at the sudden change, but very glad to find herself still in existence; `and now for the hot day made her feel very sleepy and stupid), whether the pleasure of making a daisy-chain would be offended again. She felt that she had somehow fallen into it: there were a Duck and a Dodo, a Lory and an Eaglet, and several other curious creatures. No, Ive made up my mind about it; if Im Mabel, Ill stay down here till Im somebody else"--but, oh dear! cried Alice, with a sudden burst of tears, `I do wish they WOULD not remember ever having seen such a thing.'),
    );
  }
}
