import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ludokin_agent/ui/widgets/gap.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('login').tr(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: SafeArea(
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Nom d utilisateur',
                      ),
                    ),
                    const Gap(),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Mot de passe',
                      ),
                    ),
                    const Gap(),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Mot de passe oublie?',
                        style: TextStyle(
                            color: Colors.purple,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    const Gap(),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'login',
                        style: TextStyle(color: Colors.white),
                      ).tr(),
                    ),
                    const Gap(size: 20.0),
                    const Text(
                      'create_an_account',
                      style: TextStyle(
                        color: Colors.purple,
                        decoration: TextDecoration.underline,
                      ),
                    ).tr(),
                  ]),
            ),
          ),
        ));
  }
}
