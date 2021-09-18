import 'package:fisio_app/app/design_system/snackbars/fisio_snackbars.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
    showToastSucess('em breve');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Favoritos")),
    );
  }
}
