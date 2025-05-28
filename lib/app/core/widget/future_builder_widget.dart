import 'package:base_project/app/export.dart';

class FutureBuilderWidget extends StatelessWidget {
  final Future future;
  final Widget loadingWidget;
  final Widget successWidget;
  final Widget errorWidget;

  const FutureBuilderWidget({
    Key? key,
    required this.loadingWidget,
    required this.successWidget,
    required this.errorWidget,
    required this.future,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, result) {
        debugPrint("result ${result.connectionState}");
        switch (result.connectionState) {
          case ConnectionState.waiting:
            return loadingWidget;
          case ConnectionState.active:
            return SizedBox();
          case ConnectionState.done:
            {
              return successWidget;
            }
          case ConnectionState.none:
            return errorWidget;
          default:
            return errorWidget;
        }
      },
    );
  }
}
