part of 'address_cubit.dart';

abstract class AddressState {
  const AddressState();
}

abstract class AddressDataState extends AddressPickerState {}

abstract class AddressPickerState extends AddressState {}

class AddressPickerInitial extends AddressPickerState {}

class AddressPickerLoading extends AddressPickerState {}

class AddressPickerPicked extends AddressPickerState {}

class AddressDataChange extends AddressDataState {
  final int operation;
  AddressDataChange({this.operation});
}

class AddressDataLoading extends AddressDataState {}

class AddressUpdateError extends AddressDataState {
  final String message;
  AddressUpdateError(this.message);
}
