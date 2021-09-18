import 'package:fisio_app/app/design_system/snackbars/fisio_snackbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MyDataScreen extends StatefulWidget {
  @override
  State<MyDataScreen> createState() => _MyDataScreenState();
}

class _MyDataScreenState extends State<MyDataScreen> {
  @override
  void initState() {
    super.initState();
    showToastSucess('em breve');
  }

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
