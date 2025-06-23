  


import 'package:base_project/app/export.dart';


class LocalSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreferenceManger>(
      () => PreferenceManger(),
      fenix: true,
    );
  }
}
