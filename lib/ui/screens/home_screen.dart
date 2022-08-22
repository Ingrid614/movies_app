import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("transaction").tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Card(
              child: Text(
                "balance",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                decoration: TextDecoration.underline,
              ),
              ).tr(),

            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: (){},
                    child: Text(
                      "buy",
                      style: TextStyle(color: Colors.white),
                    ).tr()
                ),
                ElevatedButton(
                    onPressed: (){},
                    child: Text(
                      "sell",
                      style: TextStyle(color: Colors.white),
                    ).tr()
                )
              ],
            ),
            Row(

              children: [
                Icon(Icons.home_filled),
                Icon(Icons.chat_bubble),
                Icon(Icons.task),
                Icon(Icons.settings),
                Icon(Icons.account_circle_outlined),
              ],
            )
          ],
        )
      )
    );
  }

}