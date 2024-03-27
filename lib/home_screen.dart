import 'package:flutter/material.dart';
import 'package:movies_app/features/browse/browse_tab.dart';
import 'package:movies_app/features/home/home_tab.dart';
import 'package:movies_app/features/search/search_tab.dart';
import 'package:movies_app/features/watch_list/watchlist_tab.dart';
import 'package:movies_app/my_theme.dart';
import 'package:movies_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen ';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex= 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(

        child:Scaffold(

          appBar: AppBar(
            title: Text('Movies',
              style: Theme.of(context).textTheme.titleLarge,),

          ),












          bottomNavigationBar: Theme(data: Theme.of(context).copyWith(
              canvasColor: MyTheme.blackColor),

            child: BottomNavigationBar(
                currentIndex: selectedindex ,
                onTap: (index){
                  selectedindex = index ;
                  setState(() {

                  });
                },
                items:[
                  BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/Home icon.png')),
                      label:  AppLocalizations.of(context)!.home),
                  BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/Search.png')),
                      label:  AppLocalizations.of(context)!.search),

                  BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/Downloads.png')),
                      label:  AppLocalizations.of(context)!.browse ),
                  BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/Icon ionic-md-bookmarks.png')),
                      label:  AppLocalizations.of(context)!.watchlist ),


                ]
            ),),
          body: tabs[selectedindex],
        )
    );
  }
  List<Widget> tabs = [
    HomeTab(),SearchTab(),BrowseTab(),WatchlistTab(),
  ];
}