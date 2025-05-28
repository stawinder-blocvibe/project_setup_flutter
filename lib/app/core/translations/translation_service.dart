/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'package:base_project/app/export.dart';

import 'language/fa_AF.dart';
import 'language/ps_AF.dart';

class TranslationService extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'zn_CN': zn_CN,
        'ps': ps_AF,
        'fa': fa_AF,
      };

  static Locale get localeEN_US => const Locale('en_US');
  static Locale get localeZN_CN => const Locale('zn_CN');
  static Locale get localeDari => const Locale('fa');
  static Locale get localePS => const Locale('ps');
}
