import 'package:flutter_html/flutter_html.dart';
import 'package:base_project/app/export.dart';

String mainDateFormatter = "yyyy-MM-dd HH:mm:ss";
String showDayFormatter = "yyyy-MM-dd";

Center resultNotFound({message}) => Center(
      child: Text(
        message ?? keyNoResultFound.tr,
        style: textStyleBodyMedium(),
      ),
    );

Widget loadingWidget() => Center(
        child: CircularProgressIndicator(
      color: colorAppColor,
      backgroundColor: Colors.white,
    ));

utcToLocalLatest(var date, var format) {
  DateTime dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(date, true);
  var df = DateFormat(format).format(dateTime);
  return df;
}

String changeDateIntoString(DateTime date, String? formatter) {
  try {
    String formattedDate =
        DateFormat(formatter ?? mainDateFormatter).format(date);
    return formattedDate;
  } catch (e) {
    return "";
  }
}

Widget html({required String data}) {
  return Html(
    data: data,
  );
}

Widget readMoreWidget({required normalOrHtmlText, bool showReadMore = true}) =>
    ReadMoreTextWidget(
      normalOrHtmlText
              .replaceAll(RegExp(r'<[^>]*>'), '')
              .trim()
              .toString()
              .capitalizeFirst ??
          "" + " ",
      lessStyle: TextStyle(color: colorAppColor),
      moreStyle: TextStyle(color: colorAppColor),
      trimLines: showReadMore ? 1 : 100,
      trimMode: TrimType.Line,
      style: TextStyle(color: Colors.grey.shade600),
      textAlign: TextAlign.justify,
    );
