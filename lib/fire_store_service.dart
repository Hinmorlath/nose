import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  static final FireStoreService _instance = FireStoreService._internal();

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  factory FireStoreService() {
    return _instance;
  }

  FireStoreService._internal();

  Stream<QuerySnapshot> getData(String collection) {
    return _firestore.collection(collection).snapshots();
  }

  Future<void> insertData(String collection, Map<String, dynamic> data) {
    return _firestore.collection(collection).add(data);
  }
}
