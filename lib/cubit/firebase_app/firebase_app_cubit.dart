import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';

part 'firebase_app_state.dart';

class FirebaseAppCubit extends Cubit<FirebaseAppState> {
  FirebaseAppCubit() : super(FirebaseAppInitial()) {
    Firebase.initializeApp().then((app) {
      emit(FirebaseAppLoaded(app));
    });
  }
}
