part of 'firebase_app_cubit.dart';

abstract class FirebaseAppState extends Equatable {
  const FirebaseAppState();

  @override
  List<Object> get props => [];
}

class FirebaseAppInitial extends FirebaseAppState {}

class FirebaseAppLoaded extends FirebaseAppState {
  final FirebaseApp app;
  const FirebaseAppLoaded(this.app);
}
