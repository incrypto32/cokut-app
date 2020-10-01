part of 'address_cubit.dart';

abstract class AddressState extends Equatable {
  const AddressState();

  @override
  List<Object> get props => [];
}

class AddressData extends AddressState {
  final List<Address> address;
  AddressData(this.address);
}

class AddressLoading extends AddressState {}

class AddressError extends AddressState {
  final String message;
  AddressError(this.message);
}
