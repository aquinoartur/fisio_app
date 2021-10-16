import 'package:fisio_app/app/core/core.dart';
import 'package:fisio_app/app/fisio_design_system/fisio_design_system.dart';
import 'package:fisio_app/app/modules/auth/bloc/auth_bloc.dart';
import 'package:fisio_app/app/modules/auth/bloc/auth_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final bloc = Modular.get<AuthBloc>();
  final themeController = Modular.get<FisioThemeController>();
  @override
  void initState() {
    super.initState();
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
              icon: Icon(Icons.logout, color: FisioColors.red),
            ),
            Switch(
              activeColor: FisioColors.primaryLightColor,
              value: themeController.theme.value,
              onChanged: (_) async {
                await themeController.setThemeMode();
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
