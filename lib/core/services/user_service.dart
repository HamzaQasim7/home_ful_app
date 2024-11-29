import '../../models/user.dart';
import 'firebase_service.dart';

class UserService extends FirebaseService<User> {
  UserService()
      : super(
          collectionName: "users",
          fromJson: User.fromJson,
          toJson: (drug) => drug.toJson(),
        );

  Future<User?> getUserById(String id) async {
    return await getById(id);
  }

  Future<List<User>> getUsers() async {
    List<User> users = await getAll();
    return users;
  }

  createUser(String id, User item) {
    create(id, item);
  }

  updateUser(String id, User item) {
    update(id, item);
  }

  deleteUser(String id) {
    delete(id);
  }
}
