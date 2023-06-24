import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../constants/firebaseconstants.dart';
import '../../models/productmodel.dart';

class FetchProducts {
  Future<List<Product>> fetchData() async {
    try {
      QuerySnapshot snapshot = await firestore.collection('Products').get();
      List<DocumentSnapshot> documents = snapshot.docs;
      List<Product> productList = documents.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        return Product.fromJson(data);
      }).toList();
      return productList;
    } catch (e) {
      rethrow;
    }
  }
}
