import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createProfile(
      String userId, Map<String, dynamic> profileData) async {
    await _firestore
        .collection('users')

        /// Reference to the "users" collection
        .doc(userId)

        /// Specific user's document
        .collection('profiles')

        /// "profiles" subcollection
        .doc(userId)

        /// Document ID within "profiles"
        .set(profileData);

    /// Set profile data
  }

  Future<dynamic> createItems(
      String userId, Map<String, dynamic> itemData) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('profiles')
        .doc(userId)
        .collection('items')
        .doc(userId)
        .set(itemData);
  }

  /// Get a profile from the "profiles" subcollection
  Future<Map<String, dynamic>?> getProfile(String userId) async {
    DocumentSnapshot doc = await _firestore
        .collection('users')

        /// Reference to the "users" collection
        .doc(userId)

        /// Specific user's document
        .collection('profiles')

        /// "profiles" subcollection
        .doc(userId)

        /// Document ID within "profiles"
        .get();

    return doc.data() as Map<String, dynamic>?;
  }
}
