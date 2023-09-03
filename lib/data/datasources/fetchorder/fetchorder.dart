import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../constants/firebaseconstants.dart';
import '../../models/ordermodal.dart';

class FetchOrder {
  Future<List<OrderModal>> fetchData() async {
    try {
      QuerySnapshot snapshot = await firestore.collection('Order').get();
      List<DocumentSnapshot> documents = snapshot.docs;

      List<OrderModal> orderList = documents.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        return OrderModal.fromJson(data);
      }).toList();
      return orderList;
    } catch (e) {
      rethrow;
    }
  }
}
