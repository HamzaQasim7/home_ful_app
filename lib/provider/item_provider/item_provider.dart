import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../core/services/items_services.dart';
import '../../core/services/profile_service.dart';
import '../../models/item_model.dart';

class ItemProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ProfileService _itemServices = ProfileService();
  final ItemService _itemService = ItemService();
  final CollectionReference _itemsCollection =
      FirebaseFirestore.instance.collection('items');
  ItemModel _item = ItemModel();

  ItemModel get item => _item;
  List<ItemModel> _items = [];

  List<ItemModel> get items => _items;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void updateItem(ItemModel updatedItem) {
    _item = updatedItem;
    notifyListeners();
  }

  void resetItem() {
    _item = ItemModel();
    notifyListeners();
  }

  Future<void> deleteItemById(String itemId) async {
    try {
      await _itemsCollection.doc(itemId).delete();
      _items.removeWhere((item) => item.id == itemId);
      notifyListeners();
    } catch (e) {
      print('Error deleting item: $e');
    }
  }

  Future<void> fetchItems(String userId) async {
    try {
      // Fetch items from the specific user's items subcollection
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('users') // Root collection for users
          .doc(userId) // Document for the specific user
          .collection('profiles') // Profiles subcollection
          .doc(
              userId) // Specific profile document (assuming the document ID is userId)
          .collection('items') // Items subcollection
          .get();

      // Convert the documents in the snapshot to a list of ItemModel instances
      _items = snapshot.docs
          .map((doc) => ItemModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      notifyListeners(); // Notify listeners that the items list has been updated
    } catch (e) {
      print('Error fetching items: $e');
      // Handle errors accordingly
    }
  }

  Future<void> fetchItemss(String userId) async {
    try {
      final QuerySnapshot snapshot =
          await _itemsCollection.where('id', isEqualTo: userId).get();
      _items = snapshot.docs
          .map((doc) => ItemModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      notifyListeners();
    } catch (e) {
      print('Error fetching items: $e');
      // Handle errors accordingly
    }
  }

  Future<void> fetchItemsByCategory(String category) async {
    try {
      final QuerySnapshot snapshot = await _itemsCollection
          .where('itemCategory', isEqualTo: category)
          .get();

      _items = snapshot.docs
          .map((doc) => ItemModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      notifyListeners();
    } catch (e) {
      print('Error fetching items by category: $e');
      // Handle errors accordingly
    }
  }

  Future<void> fetchAllItems() async {
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        _items = await _itemService.getItems(user.uid);
        notifyListeners();
      } catch (e) {
        print('Error fetching items: $e');
      }
    }
  }

  // Future<void> fetchAllItems() async {
  //   User? user = _auth.currentUser;
  //   try {
  //     _items = await _itemServices.getItems(user!.uid.toString());
  //     notifyListeners();
  //   } catch (e) {
  //     print('Error fetching items: $e');
  //   }
  // }

  bool isFirstPageComplete() {
    return _item.itemName != null &&
        _item.itemCategory != null &&
        _item.itemQuantity != null &&
        _item.itemDescription != null;
  }

  bool isSecondPageComplete() {
    return _item.itemImageUrls != null &&
        _item.selectedDate != null &&
        _item.startTime != null &&
        _item.endTime != null &&
        _item.pickupInstruction != null;
  }

  bool isThirdPageComplete() {
    return _item.organizationName != null &&
        _item.address != null &&
        _item.locationImageUrl != null;
  }
}
