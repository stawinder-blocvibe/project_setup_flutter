

import 'package:base_project/app/export.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    RepositoryBindings().dependencies();
    LocalSourceBindings().dependencies();
    SplashBinding().dependencies();
  }
}
