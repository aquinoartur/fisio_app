import 'package:fisio_app/app/design_system/snackbars/fisio_snackbars.dart';
import 'package:flutter/material.dart';

class ReferencesScreen extends StatefulWidget {
  @override
  State<ReferencesScreen> createState() => _ReferencesScreenState();
}

class _ReferencesScreenState extends State<ReferencesScreen> {
  @override
  void initState() {
    super.initState();
    showToastSucess('em breve');
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Referencias"));
  }
}
