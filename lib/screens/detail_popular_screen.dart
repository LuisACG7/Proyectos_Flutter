import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:pmsn2025/models/popular_model.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class DetailPopularScreen extends StatefulWidget {
  DetailPopularScreen({super.key, this.popularModel});

  PopularModel? popularModel;

  @override
  State<DetailPopularScreen> createState() => _DetailPopularScreenState();
}

class _DetailPopularScreenState extends State<DetailPopularScreen> {

  YoutubePlayerController? _controller;

  @override
  void initState(){
    _controller = YoutubePlayerController.fromVideoId(
      videoId: 'bM892ldskQ4',
      autoPlay: true
    );
  }

  @override
  Widget build(BuildContext context) {

    final popular = ModalRoute.of(context)!.settings.arguments as PopularModel;
    const space = SizedBox(height: 10,);

    return Scaffold(
      //appBar: AppBar(title: Text(widget.popularModel!.title),),
      appBar: AppBar(title: Text(popular.title),),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.black
            ])
          /*image: DecorationImage(
            opacity: .5,
            fit: BoxFit.cover,
            image: NetworkImage('https://image.tmdb.org/t/p/w500/${popular.posterPath}')
          )*/
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              height: 230,
              child: YoutubePlayer(
                controller: _controller!,
                aspectRatio: 16/9,
              )
            ),
            space,
            Container(
              padding: EdgeInsets.only(left: 10),
              height: 200,
              child: Row(
                children: [
                  Hero(
                    tag: 'https://image.tmdb.org/t/p/w500/${popular.posterPath}',
                    child: Image.network('https://image.tmdb.org/t/p/w500/${popular.posterPath}',)
                  ),
                  const SizedBox(width: 10,),
                  Container(
                      child: Text(popular.overview, textAlign: TextAlign.justify,), 
                      width: MediaQuery.of(context).size.width * .62,
                    )
                  ],
                ),
              ),
              space,
              Container(
                height: 120,
                child: StarRating(
                  rating: popular.voteAverage / 2,
                ),
              )
            ],
          ),
        ),
    );
  }
}