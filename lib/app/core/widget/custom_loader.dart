  


import '../../export.dart';

class CustomLoader {
  static CustomLoader? _loader;

  CustomLoader._createObject();

  factory CustomLoader() {
    if (_loader != null) {
      return _loader!;
    } else {
      _loader = CustomLoader._createObject();
      return _loader!;
    }
  }

  OverlayState? _overlayState;
  OverlayEntry? _overlayEntry;
  String? _message;

  _buildLoader() {
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              child: buildLoader(),
              color: Colors.black.withOpacity(.3),
            )
          ],
        );
      },
    );
  }

  show(context, {String? message}) {
    hide(); //to hide the current loader if exists
    _overlayState = Overlay.of(context);
    _message = message;
    _buildLoader();
    _overlayState!.insert(_overlayEntry!);
  }

  hide() {
    try {
      if (_overlayEntry != null) {
        _overlayEntry!.remove();
        _overlayEntry = null;
        _message = null;
      }
    } catch (_) {}
  }

  buildLoader({isTransparent = false}) {
    return WillPopScope(
      onWillPop: () {
        customLoader.hide();
        return Future.value(true);
      },
      child: Center(
        child: Container(
          color: isTransparent ? Colors.transparent : Colors.transparent,
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: appColor,
                backgroundColor: Colors.white,
              ),
              if (_message != null) ...[
                Text(
                  _message!,
                  style: textStyleBodyMedium().copyWith(color: Colors.white),
                ).paddingOnly(top: margin_15)
              ]
            ],
          )), //CircularProgressIndicator(),
        ),
      ),
    );
  }
}
