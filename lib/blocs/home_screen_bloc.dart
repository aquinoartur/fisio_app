import 'dart:async';
import 'dart:ui';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreenBloc implements BlocBase {


  final FirebaseFirestore firebase = FirebaseFirestore.instance;


  final StreamController _listCategory = StreamController();
  Stream get outList => _listCategory.stream;
  Sink get inputList => _listCategory.sink;


  List<DocumentSnapshot> docs = [];


  void _toList() async {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection("categorias").get();
      docs = snapshot.docs.toList();
      print(docs);
  }

  @override
  void dispose() {
    _listCategory.close();
  }

  @override
  void addListener(VoidCallback listener) {}
  @override
  bool get hasListeners => throw UnimplementedError();
  @override
  void notifyListeners() {}
  @override
  void removeListener(VoidCallback listener) {}

  

}