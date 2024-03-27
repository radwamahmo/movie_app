import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/model/TopRated.dart';
import 'package:movies_app/my_theme.dart';

import '../../model/NewReleases.dart';
import '../../model/movies.dart';

class UpComingMovies extends StatelessWidget {
 NewMovies newMovies ;
UpComingMovies({required this.newMovies});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: newMovies.posterPath??'',
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.28,
              fit: BoxFit.fill,
              placeholder: (context, url) =>Center(child:CircularProgressIndicator(
                color: MyTheme.darkGray,
              ), ) ,
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          // Container(
          //  clipBehavior: Clip.antiAlias,
          //  decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(20)
          //  ),
          // child: Image.network(news.urlToImage??''),
          //  )


        ],
      ),
    );
  }
}
