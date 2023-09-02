import 'package:flutter_bloc/flutter_bloc.dart';

enum DashboardItem {
  dashboard,
  productscreen,
  order,
  // Add more items for each item in the side menu
}

class DashboardCubit extends Cubit<DashboardItem> {
  DashboardCubit()
      : super(DashboardItem.dashboard); // Set the initial state as item_1

  void selectItem(DashboardItem item) {
    emit(item); // Emit the selected item to update the state
  }
}
