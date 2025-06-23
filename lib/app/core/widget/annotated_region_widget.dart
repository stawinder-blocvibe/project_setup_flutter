  


import '../../export.dart';

class AnnotatedRegionWidget extends StatelessWidget {
  final Widget child;
  final Color statusBarColor;
  final Brightness statusBarBrightness;

  const AnnotatedRegionWidget(
      {Key? key,
      required this.child,
      this.statusBarColor = Colors.black,
      required this.statusBarBrightness})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: statusBarColor,
            statusBarBrightness: statusBarBrightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark, // ios
            statusBarIconBrightness: statusBarBrightness),
        child: ColorfulSafeArea(
          color: statusBarColor,
          child: child,
          bottom: Platform.isAndroid ? true : false,
        ));
  }
}
