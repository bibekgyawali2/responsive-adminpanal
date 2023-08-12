import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

import '../../models/productmodel.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;

class UploadProduct {
  CollectionReference products =
      FirebaseFirestore.instance.collection('Products');
  Future<void> uploadProducts(Product productsModal, String url) async {
    try {
      // Create a new document reference
      DocumentReference newProductRef = products.doc();

      // Get the generated document ID
      String productId = newProductRef.id;

      // Set the 'productId' field before creating the document
      productsModal.productId = productId;

      // Use a map to represent the data to be added to Firestore
      Map<String, dynamic> productData = {
        'p_name': productsModal.pName,
        'p_price': productsModal.pPrice,
        'p_quantity': productsModal.pQuantity,
        'P_rating': '',
        'p_catagory': productsModal.pCatagory,
        'p_imgs': [],
        'p_rating': '0',
        'p_img': url, // Use the provided url parameter
        'p_seller': '',
        'p_subcatagory': '',
        'p_desc': productsModal.pDesc,
        'productId': productId,
      };

      // Add the data to Firestore
      await newProductRef.set(productData);

      print('Product uploaded successfully with ID: $productId');
    } catch (e) {
      print('Error uploading product: $e');
      rethrow;
    }
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
