import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

abstract class HomeBlocSate extends Equatable {
  final List<DocumentSnapshot> documents;

  const HomeBlocSate({
    this.documents = const [],
  });

  HomeBlocSate loading() {
    return LoadingHomeCategoriesState();
  }

  HomeBlocSate loaded({required List<DocumentSnapshot> documents}) {
    return LoadedCategoriesState(documents: documents);
  }

  HomeBlocSate empty() {
    return EmptyCategoriesState();
  }

  HomeBlocSate error({required String message}) {
    return ErrorHomeCategoriesState(message: message);
  }

  @override
  List<Object?> get props => [documents];
}

class InitialHomeCategoriesState extends HomeBlocSate {}

class EmptyCategoriesState extends HomeBlocSate {}

class LoadingHomeCategoriesState extends HomeBlocSate {}

class LoadedCategoriesState extends HomeBlocSate {
  const LoadedCategoriesState({required List<DocumentSnapshot> documents}) : super(documents: documents);
}

class ErrorHomeCategoriesState extends HomeBlocSate {
  final String message;

  const ErrorHomeCategoriesState({
    required this.message,
  });

  @override
  List<Object?> get props => [...super.props, message];
}
