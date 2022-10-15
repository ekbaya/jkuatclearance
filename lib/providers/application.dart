import 'package:flutter/foundation.dart';
import 'package:student_clearance/constants/pages.dart';

class Application with ChangeNotifier {
  String activepage = requestsPage;
  String selectedPage = requestsPage;

  switchPage(String page) {
    selectedPage = page;
    notifyListeners();
  }

  switchActivePage(String page) {
    activepage = page;
    notifyListeners();
  }
}
