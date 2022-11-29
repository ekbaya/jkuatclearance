import 'package:student_clearance/models/account.dart';
import 'package:student_clearance/utils/appconfig.dart';

class UsersServices {
  String collection = "users";

  void registerUser(Account currentUser) {
    AppConfig.firebaseFiretore
        .collection(collection)
        .doc(currentUser.id)
        .set(currentUser.toMap());
  }

  void updateUserData(Map<String, dynamic> values) {
    AppConfig.firebaseFiretore
        .collection(collection)
        .doc(values['id'])
        .update(values);
  }

  Future<Account> getUserById(String id) => AppConfig.firebaseFiretore
          .collection(collection)
          .doc(id)
          .get()
          .then((doc) {
        return Account.fromMap(doc.data() as Map<dynamic, dynamic>);
      });
}
