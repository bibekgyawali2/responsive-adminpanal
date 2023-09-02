import 'package:bloc/bloc.dart';
import 'package:ecommerce_admin/data/models/ordermodal.dart';
import 'package:meta/meta.dart';

import '../../data/datasources/fetchorder/fetchorder.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final FetchOrder fetchOrder;
  OrderCubit(this.fetchOrder) : super(OrderInitial());

  void fetchOrders() async {
    try {
      emit(OrderLoading());

      final orderList = await fetchOrder.fetchData();

      emit(FetchOrderSuccess(orderList));
    } catch (e) {
      emit(OrderError());
    }
  }
}
