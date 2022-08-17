import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Center(
            child: Text('SE CONNECTER',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
              textAlign: TextAlign.center,)
        ),
      ),

      body: Padding(
          padding: const EdgeInsets.all(8),
          child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Container(
              margin: const EdgeInsets.only(left:10, top: 10, right: 10, bottom: 0),
              child: const TextField(

              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nom d utilisateur',
                  labelStyle: TextStyle(color: Colors.purple)
              ),
            ),
            ),


            Container(
              margin: const EdgeInsets.only(left:10, top: 10, right: 10, bottom: 0),
              child:const TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mot de passe',
                  labelStyle: TextStyle(color: Colors.purple)
              ),
            ),
            ),
            Container(
              margin: const EdgeInsets.only(left:10, top: 10, right: 10, bottom: 0),
              child:const Text('Mot de passe oublie?',
              style: TextStyle(
                  color: Colors.purple,
                  decoration: TextDecoration.underline ),
            ),
            ),


            Container(
              margin: const EdgeInsets.only(left:10, top: 10, right: 10, bottom: 0),
              child:const Card(
              color: Colors.purple,
              child: Center(
                  child: Text(
                      'CONNEXION', style: TextStyle(color: Colors.white))
              ),
            ),
            ),
            Container(
                margin: const EdgeInsets.only(left:10, top: 10, right: 10, bottom: 0),
                child:const Center(
                child:Text('creer un compte',
              style: TextStyle(
                  color: Colors.purple,
                  decoration: TextDecoration.underline,
                  ),
            )
            )
            ),


          ]),
      )



    );
  }

}