import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../config/console.dart';
import '../config/utils.dart';

class FirebaseService<T> {
  final String collectionName;
  final T Function(Map<String, dynamic> data) fromJson;
  final Map<String, dynamic> Function(T item) toJson;

  FirebaseService({
    required this.collectionName,
    required this.fromJson,
    required this.toJson,
  });

  Future<bool> create(String id, T item) async {
    try {
      await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(id)
          .set(toJson(item));
      return true;
    } catch (e) {
      Fluttertoast.showToast(msg: "Unable to Store ${T.runtimeType}: $e");
      throw Exception('Error creating document: $e');
    }
  }

  Future<void> update(String id, T item) async {
    try {
      await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(id)
          .update(toJson(item));
    } catch (e) {
      throw Exception('Error updating document: $e');
    }
  }

  Future<T?> getById(String id) async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(id)
          .get();
      if (doc.exists) {
        return fromJson(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      log(e.toString());
      throw Exception('Error fetching document: $e');
    }
  }

  Future<List<T>> getAll() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection(collectionName).get();
      return querySnapshot.docs
          .map((doc) => fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      console(e, type: DebugType.error);
      throw Exception('Error fetching all documents: $e');
    }
  }

  Stream<List<T>> getAllStream() {
    return FirebaseFirestore.instance
        .collection(collectionName)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => fromJson(doc.data())).toList());
  }

  Future<void> delete(String id) async {
    try {
      if (await _exist(id)) {
        await FirebaseFirestore.instance
            .collection(collectionName)
            .doc(id)
            .delete();
      } else {
        throw Exception("Document Doesn't Exist");
      }
    } catch (e) {
      throw Exception('Error deleting document: $e');
    }
  }

  Future<String?> uploadImage(File image, String uploadPath) async {
    try {
      Reference storageRef =
          FirebaseStorage.instance.ref('/images').child(uploadPath);
      UploadTask uploadTask = storageRef.putFile(image);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadURL = await taskSnapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      log('Error uploading image: $e');
      return null;
    }
  }

  Future<bool> _exist(String id) async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(id)
        .get();
    return snapshot.exists;
  }
}
