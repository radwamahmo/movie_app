import 'package:flutter/material.dart';
import 'package:movies_app/model/NewReleases.dart';

import '../../model/movies.dart';

class PopularMovies extends StatelessWidget {
 Result result  ;
PopularMovies({required this.result});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
            ),
            child: Image.network(result.posterPath??'') ,
          )
        ],
      ),
    );
  }
}
