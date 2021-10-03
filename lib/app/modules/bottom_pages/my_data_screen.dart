import 'package:fisio_app/app/blocs/auth_bloc.dart';
import 'package:fisio_app/app/modules/auth/bloc/auth_events.dart';

import '../../design_system/snackbars/fisio_snackbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MyDataScreen extends StatefulWidget {
  const MyDataScreen({Key? key}) : super(key: key);

  @override
  State<MyDataScreen> createState() => _MyDataScreenState();
}

class _MyDataScreenState extends State<MyDataScreen> {
  final bloc = Modular.get<AuthBloc>();
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
            onPressed: () => bloc.add(LogoutEvent()),
            icon: const Icon(Icons.logout),
          ),
        ],
      )),
    );
  }
}
