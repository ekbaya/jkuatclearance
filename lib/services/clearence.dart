import 'package:student_clearance/models/clearence.dart';
import 'package:student_clearance/utils/appconfig.dart';

class ClearenceServices {
  String collection = "requests";

  void createClearenceRequest(Clearance form) {
    AppConfig.firebaseFiretore
        .collection(collection)
        .doc(form.id)
        .set(form.toMap());
  }

  void updateClearanceData(Map<String, dynamic> values) async {
    AppConfig.firebaseFiretore
        .collection(collection)
        .doc(values['id'])
        .update(values);

    //update request status
    await updateClearenceFormStatus(values['id']);
  }

  Future<Clearance> getClearanceById(String id) => AppConfig.firebaseFiretore
          .collection(collection)
          .doc(id)
          .get()
          .then((doc) {
        return Clearance.fromMap(doc.data() as Map<dynamic, dynamic>);
      });

  Future updateClearenceFormStatus(String id) async {
    final clearance = await getClearanceById(id);

    if (clearance.chairmanStatus == "completed" &&
        clearance.facultyStatus == "completed" &&
        clearance.libraryStatus == "completed" &&
        clearance.houseKeeperStatus == "completed" &&
        clearance.deanStatus == "completed" &&
        clearance.sportsStatus == "completed" &&
        clearance.registrarStatus == "completed" &&
        clearance.financeStatus == "completed") {
      Map<String, dynamic> data = {
        "id": id,
        "status": "completed",
      };

      AppConfig.firebaseFiretore.collection(collection).doc(id).update(data);
    }
  }
}
