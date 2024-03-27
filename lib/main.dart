import 'package:flutter/material.dart';
import 'package:movies_app/home_screen.dart';
import 'package:movies_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'my_theme.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: (context)=> AppConfigProvider() ,
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName ,
      routes: {
        HomeScreen.routeName:(context)=> HomeScreen(),
      },

      theme: MyTheme.theme,
      locale:  Locale(provider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

    );

  }
}
