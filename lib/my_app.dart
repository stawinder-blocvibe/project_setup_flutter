

import 'package:base_project/app/export.dart';
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Safely retrieve the route arguments

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: ScreenUtilInit(
        useInheritedMediaQuery: true,
        builder: (context, widget) => GetMaterialApp(
          theme: ThemeConfig.lightTheme,
          initialRoute: AppPages.INITIAL,

          navigatorObservers: [NavigationHistoryObserver()],
          initialBinding: InitialBinding(),
          getPages: AppPages.routes,
          scaffoldMessengerKey: scaffoldMessengerState,
          navigatorKey: navState,
          debugShowCheckedModeBanner: false,
          enableLog: true,
          logWriterCallback: LoggerX.write,
          builder: EasyLoading.init(),
          defaultTransition: Transition.cupertino,

          // translations: TranslationService(),
          locale: Get.deviceLocale,
          fallbackLocale: Locale(localKey),
        ),
      ),
    );
  }
}
