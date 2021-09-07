import 'dart:async';
import 'dart:ui';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fisio_app/app/modules/bottom_pages/favorites_screen.dart';
import 'package:fisio_app/app/modules/bottom_pages/my_data_screen.dart';
import 'package:fisio_app/app/modules/bottom_pages/references_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class HomeScreenBloc implements BlocBase {
  final FirebaseFirestore firebase = FirebaseFirestore.instance;
  final _listCategory = BehaviorSubject<List<DocumentSnapshot>>();
  Stream<List<DocumentSnapshot>> get outList => _listCategory.stream;
  Sink<List<DocumentSnapshot>> get inputList => _listCategory.sink;
  List<DocumentSnapshot>? docs;

  HomeScreenBloc() {
    _toList();
    toListWidgets();
  }

  List<Widget> toListWidgets() {
    List<Widget> widgetOptions = <Widget>[
      Container(),
      FavoritesScreen(),
      ReferencesScreen(),
      MyDataScreen(),
    ];
    return widgetOptions;
  }

  void _toList() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await Future.delayed(Duration(seconds: 1))
            .then((_) => firebase.collection("categorias").get());
    docs = snapshot.docs.toList();
    inputList.add(docs!);
  }

  @override
  void dispose() {
    _listCategory.close();
  }

  //todo changes
  @override
  void addListener(VoidCallback listener) {}
  @override
  bool get hasListeners => throw UnimplementedError();
  @override
  void notifyListeners() {}
  @override
  void removeListener(VoidCallback listener) {}
}
