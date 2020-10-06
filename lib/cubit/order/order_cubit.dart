import 'package:bloc/bloc.dart';
import 'package:cokut/infrastructure/repositories/auth_repo.dart';
import 'package:cokut/infrastructure/repositories/cart_repo.dart';
import 'package:cokut/models/order.dart';
import 'package:cokut/utils/logger.dart';
import 'package:equatable/equatable.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final CartRepository _cartRepository;
  final AuthenticationRepository _authenticationRepository;
  OrderCubit(this._cartRepository, this._authenticationRepository)
      : super(OrderInitial()) {}

  Future<void> placeOrder(Function callback) async {
    try {
      emit(OrderLoading());

      if (_cartRepository.cart.length == 0) {
        emit(OrderError());
      }
      var order = await _cartRepository
          .order((await _authenticationRepository.getToken()));

      // await Future.delayed(Duration(seconds: 2));

      // var order = Order.fromJson({
      //   "id": "5f7c496fa5e6b67bbb42d639",
      //   "rid": "5f6307c925f7fd7485853558",
      //   "uid": "TEST_USER",
      //   "address": {
      //     "title": "HOME2",
      //     "zone": "KATTE CHILLAYITHIle",
      //     "adl1": "Vazhappully House",
      //     "adl2": "LINE 2",
      //     "adl3": "LINE 3"
      //   },
      //   "items": {"5f6307ea25f7fd7485853559": 2},
      //   "summary": [
      //     {
      //       "meal": {
      //         "isVeg": true,
      //         "spicey": true,
      //         "id": "5f6307ea25f7fd7485853559",
      //         "rid": "5f6307c925f7fd7485853558",
      //         "name": "Chicken 365",
      //         "price": 85,
      //         "display_price": 75
      //       },
      //       "count": 2,
      //       "price": 170
      //     }
      //   ],
      //   "time": "2020-10-06T16:09:43.05+05:30",
      //   "price": 170,
      //   "total": 190,
      //   "delivery_charge": 20
      // });

      callback();
      emit(OrderSuccessful(order));
    } catch (e) {
      logger.e(e);
      emit(OrderError());
    }
  }
}
