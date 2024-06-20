import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business/cubit/locale_cubit.dart';
import '../../business/cubit/theme_cubit.dart';
import '../widgets/gap.dart';
class SettingsScreen extends StatefulWidget{
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=>SettingsScreenState();

}

class SettingsScreenState extends State<SettingsScreen>{


  var itemsLanguages =["fr","en"];
  var itemsThemes =["clear".tr(),"dark".tr()];
  String dropDownValueTheme = "clear".tr();
 late String dropDownValueLanguage=context.locale.languageCode;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("settings_title").tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
                children:[
              const Icon(Icons.translate_sharp,),
               const Gap(),
                  Expanded(
                 child: DropdownButton(
                 isExpanded: true,
                 value: dropDownValueLanguage,
                  icon: const Icon(Icons.keyboard_arrow_down_rounded,),
                  elevation: 0,
                  items: itemsLanguages.map((String items){
                    return DropdownMenuItem(
                      value: items,
                        child: Text(items,)
                    );
                  }).toList(),
                  onChanged: (String? newValue){
                    setState(() {
                      dropDownValueLanguage=newValue!;
                      context.read<LocaleCubit>().changeLocale(newValue, context);
                    });
                  }
              ),
      )
            ]),
              const Gap(),
              Row(
                children:[
                  const Icon(Icons.contrast,),
               const Gap(),
              Expanded(
                     child:DropdownButton(
                        isExpanded: true,
                        value: dropDownValueTheme,
                         icon: const Icon(Icons.keyboard_arrow_down_rounded,),
                        elevation: 0,
                        items: itemsThemes.map((String items){
                        return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                    );
                        }).toList(),
                        onChanged: (String? newValue){
                          bool change = dropDownValueTheme != newValue!;
                          change?
                          setState(() {
                            dropDownValueTheme=newValue!;
                            context.read<ThemeCubit>().toggleTheme(context);
                          })
                          : dropDownValueTheme = newValue!;
          }
      ),
    )


              ])

          ],
        )
      ),
    );
  }

}