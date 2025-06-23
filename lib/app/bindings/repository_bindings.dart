  



import 'package:base_project/app/export.dart';


class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<APIRepository>(
      () => APIRepository(),
      fenix: true,
    );
  }
}
