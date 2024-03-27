import 'package:flutter/material.dart';
import 'package:movies_app/core/api_service.dart';
import 'package:movies_app/features/home/popular_movies.dart';
import 'package:movies_app/features/home/top_rated.dart';
import 'package:movies_app/features/home/upcoming_movies.dart';
import 'package:movies_app/model/NewReleases.dart';
import 'package:movies_app/model/TopRated.dart';
import 'package:movies_app/model/movies.dart';
import 'package:movies_app/my_theme.dart';


class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Scaffold(
          body: FutureBuilder<Movie?>(future: ApiService.getPopularMovies(),
              builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: MyTheme.grayColor,
                    ),
                  );
                }else if(snapshot.hasError){
                  return Column(
                    children: [
                      Text('SomeThing went wrong'),
                      ElevatedButton(onPressed: (){
                        ApiService.getPopularMovies();
                      }, child: Text('Try Again'))
                    ],
                  );
                }
                if(snapshot.data?.success!= 'ok'){
                  return Column(
                    children: [
                      Text(snapshot.data!.statusMessage!),
                      ElevatedButton(onPressed: (){
                        ApiService.getPopularMovies();
                      }, child: Text('Try Again'))
                    ],
                  );
                }
                var moviesList= snapshot.data?.results??[];
                return ListView.builder(itemBuilder: (context, index){
                  return PopularMovies(result: moviesList[index]);
                },
                    itemCount:moviesList.length);
              }),

        ),
        SizedBox(height: 20,),
        Row(
          children: [
            FutureBuilder<NewReleases?>(future: ApiService.getUpComingMovies(),
                builder: (context,snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: MyTheme.grayColor,
                      ),
                    );
                  }else if(snapshot.hasError){
                    return Column(
                      children: [
                        Text('SomeThing went wrong'),
                        ElevatedButton(onPressed: (){
                          ApiService.getUpComingMovies();
                        }, child: Text('Try Again'))
                      ],
                    );
                  }
                  if(snapshot.data?.success!= 'ok'){
                    return Column(
                      children: [
                        Text(snapshot.data!.statusMessage!),
                        ElevatedButton(onPressed: (){
                          ApiService.getUpComingMovies();

                        }, child: Text('Try Again'))
                      ],
                    );
                  }
                  var newMoviesList= snapshot.data?.results??[];
                  return ListView.builder(itemBuilder: (context, index){
                    return UpComingMovies(newMovies: newMoviesList[index]);
                  },
                      itemCount:newMoviesList.length);
                }),

          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            FutureBuilder<TopRated?>(future: ApiService.getTopRatedMovies(),
                builder: (context,snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: MyTheme.grayColor,
                      ),
                    );
                  }else if(snapshot.hasError){
                    return Column(
                      children: [
                        Text('SomeThing went wrong'),
                        ElevatedButton(onPressed: (){
                          ApiService.getUpComingMovies();
                        }, child: Text('Try Again'))
                      ],
                    );
                  }
                  if(snapshot.data?.success!= 'ok'){
                    return Column(
                      children: [
                        Text(snapshot.data!.statusMessage!),
                        ElevatedButton(onPressed: (){
                          ApiService.getUpComingMovies();

                        }, child: Text('Try Again'))
                      ],
                    );
                  }
                  var topMoviesList= snapshot.data?.results??[];
                  return ListView.builder(itemBuilder: (context, index){
                    return TopRatedMovies(topMovies: topMoviesList[index]);
                  },
                      itemCount:topMoviesList.length);
                }),

          ],
        ),
      ],
    );

  }
}