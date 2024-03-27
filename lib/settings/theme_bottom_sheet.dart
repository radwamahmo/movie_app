import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies_app/my_theme.dart';

import 'package:provider/provider.dart';

import '../providers/app_config_provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      color: provider.isDarkMode()?
          MyTheme.goldColor

          :MyTheme.grayColor,
      //margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

      InkWell(
        onTap: (){
         provider.changeTheme(ThemeMode.dark);
        },
        child: provider.isDarkMode() ?
            getSelectedItemWidget(AppLocalizations.of(context)!.dark)
          :
            getUnSelectedItemWidget(AppLocalizations.of(context)!.dark)
      ),
              SizedBox(height: 15,),
             InkWell(
               onTap: (){
                 provider.changeTheme(ThemeMode.light);
               },
              child: provider.appTheme == ThemeMode.light ?
                  getSelectedItemWidget(AppLocalizations.of(context)!.light)
                  :
                  getUnSelectedItemWidget(AppLocalizations.of(context)!.light
                  )
              )
            ],
          ),



    );
  }

  Widget getSelectedItemWidget(String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold
            )),
        Icon(Icons.check, size: 30,color: Theme.of(context).primaryColor),
      ],
    );
  }
  Widget getUnSelectedItemWidget(String text){
    return Text(text,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
