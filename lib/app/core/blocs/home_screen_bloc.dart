import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_bloc_event.dart';
import 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeBlocEvent, HomeBlocSate> {
  final FirebaseFirestore firebase;
  HomeScreenBloc({required this.firebase}) : super(InitialHomeCategoriesState()) {
    on<GetHomeCategoriesEvent>(
      getHomeCategoriesEvent,
    );
  }

  Future<void> getHomeCategoriesEvent(
    GetHomeCategoriesEvent event,
    Emitter<HomeBlocSate> emit,
  ) async {
    emit(state.loading());

    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await firebase.collection('categorias').get();

      if (snapshot.docs.toList().isNotEmpty) {
        emit(
          state.loaded(
            documents: snapshot.docs.toList(),
          ),
        );
      } else {
        emit(
          state.empty(),
        );
      }
    } catch (e) {
      emit(
        state.error(
          message: e.toString(),
        ),
      );
    }
  }
}
