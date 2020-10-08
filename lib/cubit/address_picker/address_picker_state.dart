part of 'address_picker_cubit.dart';

abstract class AddressPickerState {
  const AddressPickerState();

  @override
  List<Object> get props => [];
}

class AddressPickerInitial extends AddressPickerState {}

class AddressPickerLoading extends AddressPickerState {}

class AddressPickerPicked extends AddressPickerState {}
