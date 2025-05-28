/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'app_exception.dart';

abstract class BaseApiException extends AppException {
  final int httpCode;
  final String status;

  BaseApiException({this.httpCode = -1, this.status = "", String message = ""})
      : super(message: message);
}
