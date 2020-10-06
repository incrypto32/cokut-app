import 'package:bloc/bloc.dart';
import 'package:cokut/infrastructure/repositories/cart_repo.dart';
import 'package:cokut/infrastructure/repositories/user_repo.dart';
import 'package:cokut/models/user.dart';

part 'deliveryaddress_state.dart';

class DeliveryAddressCubit extends Cubit<DeliveryAddressState> {
  final CartRepository _cartRepository;
  final UserRepository _userRepository;
  DeliveryAddressCubit(this._cartRepository, this._userRepository)
      : super(DeliveryAddressInitial()) {
    _cartRepository.deliveryAddress == null
        ? changeDeliveryAddress(_userRepository.addressList[0])
        : print("delivery address already set");
  }

  changeDeliveryAddress(Address address) {
    print("__________________");
    _cartRepository.setDeliveryAddress(address);
    emit(DeliveryAddressChange());
  }
}
