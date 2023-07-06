import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

import '../../models/productmodel.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;

class UploadProduct {
  CollectionReference products =
      FirebaseFirestore.instance.collection('Products');
  uploadProducts(Product productsModal, url) {
    products.add({
      'p_name': productsModal.pName,
      'p_price': productsModal.pPrice,
      'p_quantity': productsModal.pQuantity,
      'P_rating': '',
      'p_catagory': productsModal.pCatagory,
      'p_imgs': [],
      'p_rating': '0',
      'p_img': url,
      'p_seller': '',
      'p_subcatagory': '',
      'p_desc': productsModal.pDesc,
    }).then((value) => {});
  }

  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    // creating location to our firebase storage

    Reference ref = _storage.ref().child(childName);

    // putting in uint8list format -> Upload task like a future but not future
    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
