part of 'fetch_product_cubit.dart';

@immutable
abstract class FetchProductState {}

class FetchProductInitial extends FetchProductState {}

class FetchProductSuccess extends FetchProductState {
  final List<Product> productList;

  FetchProductSuccess(this.productList);
}

class FetchProductLoading extends FetchProductState {}

class FetchProductError extends FetchProductState {
  final String errorMessage;

  FetchProductError(this.errorMessage);
}
