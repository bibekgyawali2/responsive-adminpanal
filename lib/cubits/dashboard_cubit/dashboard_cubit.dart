import 'package:flutter_bloc/flutter_bloc.dart';

enum DashboardItem {
  item_1,
  item_2,
  // Add more items for each item in the side menu
}

class DashboardCubit extends Cubit<DashboardItem> {
  DashboardCubit() : super(DashboardItem.item_1); // Set the initial state as item_1

  void selectItem(DashboardItem item) {
    emit(item); // Emit the selected item to update the state
  }
}
