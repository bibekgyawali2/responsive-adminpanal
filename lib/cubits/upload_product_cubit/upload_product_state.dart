part of 'upload_product_cubit.dart';

@immutable
abstract class UploadProductState {}

class UploadProductInitial extends UploadProductState {}

class UploadProductLoading extends UploadProductState {}

class UploadProductFailure extends UploadProductState {}

class UploadProducSuccess extends UploadProductState {}
