import 'package:bloc/bloc.dart';
import 'package:cokut/infrastructure/repositories/user_repo.dart';
import 'package:cokut/models/user.dart';
part 'address_picker_state.dart';

class AddressPickerCubit extends Cubit<AddressPickerState> {
  final UserRepository _userRepository;
  AddressPickerCubit(this._userRepository) : super(AddressPickerInitial()) {
    _userRepository.setAddressSelection(null);
    emit(AddressPickerLoading());
  }

  void selectAddress(Address address) {
    _userRepository.setAddressSelection(address);
    emit(AddressPickerPicked());
  }
}
