/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'dart:io';

import 'package:base_project/app/data/repository/exceptions/base_api_exception.dart';

class UnauthorizedException extends BaseApiException {
  UnauthorizedException(String message)
      : super(
            httpCode: HttpStatus.unauthorized,
            message: message,
            status: "unauthorized");
}
