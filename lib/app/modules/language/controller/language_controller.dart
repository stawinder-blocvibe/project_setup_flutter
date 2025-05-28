import 'package:base_project/app/export.dart';

class LanguageController extends GetxController {
  // Property to keep track of the selected language index

  int selectedIndex = 0; // Initially, no language is selected
  RxList<String> languageList = ["English", "Dari", "Pashto"].obs;
  // List of language codes (these are used by the Get.updateLocale function)
  List<String> languageCodes = ['en', 'fa', 'ps'];
}
