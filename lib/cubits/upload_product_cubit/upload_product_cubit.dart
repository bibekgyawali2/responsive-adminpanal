import 'package:bloc/bloc.dart';

part 'upload_product_state.dart';

class UploadProductCubit extends Cubit<UploadProductState> {
  UploadProductCubit() : super(UploadProductInitial());
}
