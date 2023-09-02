part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class OrderLoading extends OrderState {}

final class FetchOrderSuccess extends OrderState {
  final List<OrderModal> productList;

  FetchOrderSuccess(this.productList);
}

final class OrderError extends OrderState {}
