import 'package:base_project/app/export.dart';
import 'package:base_project/app/modules/language/controller/language_controller.dart';

class LanguageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguageController>(() => LanguageController());
  }
}
