import 'package:bloc/bloc.dart';
import 'package:ecommerce_admin/data/datasources/fetchproducts/fetchproduct.dart';

import '../../data/models/productmodel.dart';

part 'fetch_product_state.dart';

class FetchProductCubit extends Cubit<FetchProductState> {
  final FetchProducts fetchProduct;

  FetchProductCubit(this.fetchProduct) : super(FetchProductInitial());

  void fetchProducts() async {
    try {
      emit(FetchProductLoading());

      final productList = await fetchProduct.fetchData();

      emit(FetchProductSuccess(productList));
    } catch (e) {
      emit(FetchProductError('Failed to fetch products'));
    }
  }
}
