  


import '../../presentation/modules/splash/bindings/splash_binding.dart';
import '../export.dart';


class InitialBinding implements Bindings {
  @override
  void dependencies() {
    RepositoryBindings().dependencies();
    LocalSourceBindings().dependencies();
    SplashBinding().dependencies();
  }
}
