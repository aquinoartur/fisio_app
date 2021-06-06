import 'dart:async';
import 'dart:ui';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreenBloc implements BlocBase {


  final FirebaseFirestore firebase = FirebaseFirestore.instance;


  final _listCategory = StreamController<List<DocumentSnapshot>>();
  Stream<List<DocumentSnapshot>> get outList => _listCategory.stream;
  Sink get inputList => _listCategory.sink;

  List<DocumentSnapshot>? docs;

  HomeScreenBloc(){
    _toList();
  }

  void _toList() async {
      QuerySnapshot<Map<String, dynamic>> snapshot = await firebase.collection("categorias").get();
      docs = snapshot.docs.toList();
      inputList.add(docs);
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