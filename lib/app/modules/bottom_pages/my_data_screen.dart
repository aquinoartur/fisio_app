import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MyDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () => Modular.to.pushNamed('/profile/favorites'),
            icon: Icon(Icons.add),
          ),
          Text('Aperte em + para testar a transição de tela')
        ],
      )),
    );
  }
}
