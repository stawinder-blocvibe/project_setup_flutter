/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'package:base_project/app/export.dart';
import 'package:logger/logger.dart';

int defaultItemCount = 10;

var preLoginNestedId = 1;
var postLoginNestedId = 2;

var log = Logger();
GetStorage storage = GetStorage();

final GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerState =
    GlobalKey<ScaffoldMessengerState>();

cardDecoration({Color? bgColor}) => BoxDecoration(
    color: bgColor ?? Colors.white,
    boxShadow: [
      BoxShadow(color: Colors.black12, blurRadius: 2, spreadRadius: 2)
    ],
    borderRadius: BorderRadius.circular(radius_20));

/// For testing Purpose
double testLat = 30.7579402;
double testLng = 76.6715911;

const String mapApiKey = googleApiKey;

RxInt notificationCount = 0.obs;
