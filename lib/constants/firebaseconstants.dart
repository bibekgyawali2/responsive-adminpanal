import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
User? currentUser = auth.currentUser;

const usersCollections = "users";
const productsCollections = 'Products';
const cartCollections = 'Cart';
const addressCollections = 'Address';
const orderCollections = 'Order';
