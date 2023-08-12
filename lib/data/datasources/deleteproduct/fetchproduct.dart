import 'package:ecommerce_admin/utils/image_picker_phone.dart';

import '../../../constants/firebaseconstants.dart';

class Deleteroducts {
  void deleteProducts({documentId, context}) async {
    try {
      await firestore.collection('Products').doc(documentId).delete();
      Utilis().showSnackBar(context, "Item Deleted Successfully");
    } catch (e) {
      rethrow;
    }
  }
}
