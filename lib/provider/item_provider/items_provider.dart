import 'dart:developer';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import '../../core/services/items_services.dart';
import '../../models/item_model.dart';
import '../auth_provider/auth_provider.dart';

class AddItemProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static final User? _user = auth.currentUser;

  static User? get user => _user;
  static FirebaseAuth auth = FirebaseAuth.instance;
  final ItemService _itemService = ItemService();
  final ItemModel currentItem = ItemModel();
  final List<ItemModel> _items = [];
  final AuthenticationProvider userAuth = AuthenticationProvider();
  List<ItemModel> get items => _items;

  ItemModel get item => currentItem;
  final User? _currentUserId = auth.currentUser;

  User? get currentUserId => _currentUserId;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  String getFormattedDate(DateTime? date) {
    if (date == null) return '';
    return DateFormat('MMMM d, yyyy').format(date);
  }

  Future<bool> checkIfItemExists(String itemName) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return false;

    QuerySnapshot querySnapshot = await _firestore
        .collection('users')
        .doc(user.uid)
        .collection('profiles')
        .doc(user.uid)
        .collection('items')
        .where('itemName', isEqualTo: itemName)
        .get();

    return querySnapshot
        .docs.isNotEmpty; // True if an item with the same name exists
  }

  // Create a new item
  /*
  Future<String> createItem(ItemModel item) async {
    setLoading(true);
    try {
      if (user == null) {
        throw Exception("User not authenticated");
      }

      String itemId = await _itemService.addItem(user!.uid, item.toMap());
      item.id = itemId;
      _items.add(item);
      notifyListeners();
      return itemId;
    } catch (e) {
      if (kDebugMode) {
        print('Error creating item: $e');
      }
      rethrow;
    } finally {
      setLoading(false);
    }
  }
   */
  Future<String> createItems(ItemModel item) async {
    setLoading(true);
    try {
      final user = FirebaseAuth.instance.currentUser;
      print('Current user Id: ${user!.uid}');
      if (user == null) {
        throw Exception("User not authenticated");
      }

      // Generate a unique ID for the item
      String uniqueItemId = DateTime.now().microsecondsSinceEpoch.toString();

      // Set the generated ID to the item
      item.id = uniqueItemId;

      // Create the item in Firestore using the generated ID
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('profiles')
          .doc(user.uid)
          .collection('items')
          .doc(uniqueItemId)
          .set(item.toMap());

      // Add the item to the local list
      _items.add(item);

      notifyListeners();

      return uniqueItemId;
    } catch (e) {
      if (kDebugMode) {
        print('Error creating item: $e');
      }
      rethrow;
    } finally {
      setLoading(false);
    }
  }

  Future<String> createItem(ItemModel item) async {
    setLoading(true);
    try {
      final user = FirebaseAuth.instance.currentUser;
      print('Current user Id: ${user!.uid}');
      if (user == null) {
        throw Exception("User not authenticated");
      }

      // Generate a unique ID for the item
      String uniqueItemId =
          '${DateTime.now().microsecondsSinceEpoch}_${Random().nextInt(10000)}';

      // Set the generated ID to the item
      item.id = uniqueItemId;

      // Reference to the items collection
      CollectionReference itemsCollection = FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('profiles')
          .doc(user.uid)
          .collection('items');

      // Check if this is the first item
      QuerySnapshot itemsSnapshot = await itemsCollection.limit(1).get();
      bool isFirstItem = itemsSnapshot.docs.isEmpty;

      if (isFirstItem) {
        // If it's the first item, use set()
        await itemsCollection.doc(uniqueItemId).set(item.toMap());
      } else {
        // If it's not the first item, use add()
        await itemsCollection.add(item.toMap());
      }

      // Add the item to the local list
      items.add(item);

      notifyListeners();

      return uniqueItemId;
    } catch (e) {
      if (kDebugMode) {
        print('Error creating item: $e');
      }
      rethrow;
    } finally {
      setLoading(false);
    }
  }

// Get an item by ID and return as a list
  Future<List<ItemModel>> getItemById(String id) async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection('users')
          .doc(user!.uid)
          .collection('profiles')
          .doc(user!.uid)
          .collection('items')
          .doc(user!.uid)
          .get();
      if (doc.exists) {
        return [ItemModel.fromMap(doc.data() as Map<String, dynamic>)];
      }
      return [];
    } catch (e) {
      print('Error getting item: $e');
      rethrow;
    }
  }

  Future<void> updateItem(ItemModel updatedItem) async {
    setLoading(true); // Assuming setLoading is part of your state management
    final user = FirebaseAuth.instance.currentUser;

    try {
      // Check if user is authenticated
      if (user == null) {
        throw Exception("User not authenticated");
      }

      // Validate item ID
      if (updatedItem.id == null || updatedItem.id!.isEmpty) {
        throw Exception("Invalid item ID");
      }

      // Firestore service update
      await _itemService.updateItem(
        user.uid,
        updatedItem.id!, // Unwrap id, since you already checked it's not null
        updatedItem.toMap(),
      );

      // Optionally: if transaction-based updates are needed, uncomment this part
      // DocumentReference itemRef = _firestore
      //   .collection('users')
      //   .doc(user.uid)
      //   .collection('profiles')
      //   .doc(user.uid)
      //   .collection('items')
      //   .doc(updatedItem.id);
      // await _firestore.runTransaction((transaction) async {
      //   transaction.update(itemRef, updatedItem.toMap());
      // });

      // Update local list of items
      int index = _items.indexWhere((item) => item.id == updatedItem.id);
      if (index != -1) {
        _items[index] = updatedItem;
      } else {
        _items.add(
            updatedItem); // Add item if not found (depending on your logic)
      }

      notifyListeners(); // Notify UI of changes

      if (kDebugMode) {
        print('Item updated successfully: ${updatedItem.id}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error updating item: $e');
      }
      rethrow; // Re-throw the exception after logging it
    } finally {
      setLoading(false); // End loading state
    }
  }

  Future<void> deleteItem(String itemId) async {
    setLoading(true);
    final user = FirebaseAuth.instance.currentUser;
    try {
      if (user == null) {
        throw Exception("User not authenticated");
      }

      if (itemId.isEmpty) {
        throw Exception("Invalid item ID");
      }

      // Reference to the item document

      DocumentReference itemRef = _firestore
          .collection('users')
          .doc(user.uid)
          .collection('profiles')
          .doc(user.uid)
          .collection('items')
          .doc(itemId);

      // Check if the item exists
      DocumentSnapshot itemSnapshot = await itemRef.get();
      if (!itemSnapshot.exists) {
        throw Exception("Item not found");
      }

      // Perform the deletion in a transaction to ensure data consistency
      await _firestore.runTransaction((transaction) async {
        transaction.delete(itemRef);
      });

      // Remove the item from the local list
      _items.removeWhere((item) => item.id == itemId);

      notifyListeners();

      if (kDebugMode) {
        print('Item deleted successfully: $itemId');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error deleting item: $e');
      }
      rethrow;
    } finally {
      setLoading(false);
    }
  }

  Future<void> deleteItemById(String itemId) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await _firestore
          .collection('users')
          .doc(user!.uid)
          .collection('profiles')
          .doc(user.uid)
          .collection('items')
          .doc(itemId)
          .delete();
      _items.removeWhere((item) => item.id == itemId);
      notifyListeners();
    } catch (e) {
      print('Error deleting item: $e');
    }
  }

  // Get all items
  Future<List<ItemModel>> getAllItems() async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .doc(user!.uid)
          .collection('profiles')
          .doc(user!.uid)
          .collection('items')
          .get();
      return querySnapshot.docs
          .map((doc) => ItemModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      if (kDebugMode) {
        print('Error getting all items: $e');
      }
      rethrow;
    }
  }

// Stream items only for the current user
  Stream<List<ItemModel>> streamItemsByCurrentUser() {
    // if (user == null) {
    //   log("User is not authenticated. Cannot stream items.");
    //   return const Stream<List<ItemModel>>.empty();
    // }

    // Log the current user's ID for debugging
    final user = FirebaseAuth.instance.currentUser;
    print("Streaming items created by User ID: ${user!.uid}");
    return _firestore
        .collection('users')
        .doc(user.uid)
        .collection('profiles')
        .doc(user.uid)
        .collection('items')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => ItemModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    });
  }

  // Stream of all items (real-time updates)
  Stream<List<ItemModel>> streamAllItems() {
    if (user == null) {
      return const Stream<List<ItemModel>>.empty();
    }
    print("Userid: ${user!.uid}");
    return _firestore
        .collection('users')
        .doc(user!.uid)
        .collection('profiles')
        .doc(user!.uid)
        .collection('items')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => ItemModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    });
  }

  // Get items by category
  Future<List<ItemModel>> getItemsByCategory(List<String> categories) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .doc(user!.uid)
          .collection('profiles')
          .doc(user!.uid)
          .collection('items')
          .where('itemCategory', whereIn: categories)
          .get();

      return querySnapshot.docs
          .map((doc) => ItemModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error getting items by category: $e');
      rethrow;
    }
  }

  // Stream items by category (real-time updates)
  Stream<List<ItemModel>> streamItemsByCategory(List<String> categories) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // Handle the null user case, for example, by returning an empty stream or an error stream
      return const Stream<List<ItemModel>>.empty();
    }
    return _firestore
        .collection('users')
        .doc(user.uid)
        .collection('profiles')
        .doc(user.uid)
        .collection('items')
        .where('itemCategory', whereIn: categories)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => ItemModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    });
  }
}
