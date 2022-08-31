import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ludokin_agent/ui/screens/chat_screen.dart';
import 'package:ludokin_agent/ui/screens/profile_screen.dart';
import 'package:ludokin_agent/ui/screens/settings_screen.dart';
import 'package:ludokin_agent/ui/screens/splash_screen.dart';

import 'command_screen.dart';
import 'home_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget{
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=> _BottomNavigationBarScreenState();

}
class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen>{

  int selectedItem = 0;

  List<Widget> screens =const [HomeScreen(),ChatScreen(),CommandScreen(),SettingsScreen(),ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedItem],
      bottomNavigationBar:BottomNavigationBar(

        selectedItemColor: Colors.deepPurple,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset('assets/images/home-3-line.svg', color: Colors.deepPurple,) ,
                label:"home".tr(),
                icon: SvgPicture.asset('assets/images/home-3-line.svg',color: Color(0xff818181),)

            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset('assets/images/chat-3-line.svg', color: Colors.deepPurple),
                label: "chat".tr(),
                icon: SvgPicture.asset('assets/images/chat-3-line.svg',color: Color(0xff818181),),

            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset('assets/images/todo-line.svg', color: Colors.deepPurple) ,
                label: "command".tr(),
                icon: SvgPicture.asset('assets/images/todo-line.svg',color: Color(0xff818181),),

            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset('assets/images/settings-line.svg', color: Colors.deepPurple,),
                label: "settings".tr(),
                icon: SvgPicture.asset('assets/images/settings-line.svg',color: Color(0xff818181),),

            ),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset('assets/images/user-line.svg', color: Colors.deepPurple,),
                label: "account".tr(),
                icon: SvgPicture.asset('assets/images/user-line.svg',color: Color(0xff818181),),


            )

          ],
              currentIndex: selectedItem,
              onTap: (int index){

            setState(() {
              selectedItem = index;
            });
        },
      ),
    );
  }

}