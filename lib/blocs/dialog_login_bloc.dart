import 'dart:async';
import 'dart:ui';
import 'package:bloc_pattern/bloc_pattern.dart';

class DialogLoginBloc implements BlocBase {

  final  _loadController = StreamController<bool>();
  Stream<bool> get output => _loadController.stream;
  Sink<bool> get input => _loadController.sink;

  void isLoad () async {
    bool isLoading = true;
    input.add(isLoading);
  }

  @override
  void dispose() {
    _loadController.close();
  }
  //todo settings
  @override
  bool get hasListeners => throw UnimplementedError();
  @override
  void notifyListeners() {}
  @override
  void removeListener(VoidCallback listener) {}
  @override
  void addListener(VoidCallback listener) {}
}