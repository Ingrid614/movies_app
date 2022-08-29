import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/gap.dart';
class SettingsScreen extends StatefulWidget{
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=>SettingsScreenState();

}

class SettingsScreenState extends State<SettingsScreen>{


  var itemsLanguages =["french".tr(),"english".tr()];
  var itemsThemes =["clear".tr(),"dark".tr()];
 String dropDownValueTheme="clear".tr();
 String dropDownValueLanguage="french".tr();
 TextEditingController themeController=TextEditingController();
 TextEditingController languageController=TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("settings").tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
                children:[
              Icon(Icons.translate_sharp, color: Colors.deepPurple,),
               Gap(),

               Expanded(
                 child: DropdownButton(
                 isExpanded: true,
                 value: dropDownValueLanguage,
                  icon: Icon(Icons.keyboard_arrow_down_rounded,color: Colors.deepPurple,),
                  elevation: 0,
                  items: itemsLanguages.map((String items){
                    return DropdownMenuItem(
                      value: items,
                        child: Text(items, style: TextStyle(color: Colors.deepPurple),)
                    );
                  }).toList(),
                  onChanged: (String? newValue){
                    setState(() {
                      dropDownValueLanguage=newValue!;

                    });
                  }
              ),
      )
            ]),


            Gap(),
              Row(
                children:[
                  Icon(Icons.contrast, color: Colors.deepPurple,),
               Gap(),
               Expanded
                 (child:DropdownButton(
                isExpanded: true,
                value: dropDownValueTheme,
                 icon: const Icon(Icons.keyboard_arrow_down_rounded,color: Colors.deepPurple,),
                elevation: 0,
                items: itemsThemes.map((String items){
                return DropdownMenuItem(
                value: items,
                child: Text(items, style: TextStyle(color: Colors.deepPurple),)
            );
          }).toList(),
          onChanged: (String? newValue){
            setState(() {
              dropDownValueTheme=newValue!;

            });
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