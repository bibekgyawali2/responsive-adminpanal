import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'upload_product_state.dart';

class UploadProductCubit extends Cubit<UploadProductState> {
  UploadProductCubit() : super(UploadProductInitial());
}
