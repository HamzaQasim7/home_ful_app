import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/item_model.dart';

class ItemService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

// Method to create a new item for a specific user
  Future<String> addItem(String userId, Map<String, dynamic> itemData) async {
    try {
      return await _firestore.runTransaction<String>((transaction) async {
        // Check for existing item
        // QuerySnapshot existingItems = await _firestore
        //     .collection('users')
        //     .doc(userId)
        //     .collection('profiles')
        //     .doc(userId)
        //     .collection('items')
        //     .where('itemName', isEqualTo: itemData['itemName'])
        //     .get();
        //
        // if (existingItems.docs.isNotEmpty) {
        //   throw Exception("Item with the same name already exists");
        // }
        // print(
        //     "Existing items found: ${existingItems.docs.map((doc) => doc.data())}");
        // Create new item
        DocumentReference newItemRef = _firestore
            .collection('users')
            .doc(userId)
            .collection('profiles')
            .doc(userId)
            .collection('items')
            .doc();

        transaction.set(newItemRef, itemData);

        return newItemRef.id;
      });
    } catch (e) {
      print("Error creating item: $e");
      rethrow;
    }
  }

  Future<String> createItem(
      String userId, Map<dynamic, dynamic> itemData) async {
    try {
      DocumentReference docRef = _firestore
          .collection('users')
          .doc(userId)
          .collection('profiles')
          .doc(userId)
          .collection('items')
          .doc(); // Auto-generate a document ID

      // Save the item data to Firestore
      await docRef.set(itemData);

      // Return the document ID
      return docRef.id;
    } catch (e) {
      print("Error creating item: $e");
      rethrow;
    }
  }

  // Method to update an item
  Future<void> updateItem(
      String userId, String itemId, Map<String, dynamic> itemData) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('profiles')
        .doc(userId)
        .collection('items')
        .doc(itemId)
        .update(itemData);
  }

  // Method to get a specific item by its ID
  Future<ItemModel?> getItemById(String userId, String itemId) async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection('users')
          .doc(userId)
          .collection('profiles')
          .doc(userId)
          .collection('items')
          .doc(itemId)
          .get();

      if (doc.exists) {
        return ItemModel.fromMap(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching item: $e');
    }
    return null;
  }

  // Method to fetch all items for a specific user
  Future<List<ItemModel>> getItems(String userId) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('profiles')
          .doc(userId)
          .collection('items')
          .get();

      List<ItemModel> items = querySnapshot.docs
          .map((doc) => ItemModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      return items;
    } catch (e) {
      print('Error fetching items: $e');
      return [];
    }
  }
}
