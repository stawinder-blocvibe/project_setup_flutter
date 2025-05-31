/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

export 'dart:async';
export 'dart:convert';
export 'dart:io';

export 'package:another_xlider/another_xlider.dart';
export 'package:another_xlider/models/handler.dart';
export 'package:another_xlider/models/tooltip/tooltip.dart';
export 'package:another_xlider/models/trackbar.dart';
export 'package:colorful_safe_area/colorful_safe_area.dart';
export 'package:coupon_uikit/coupon_uikit.dart';
export 'package:device_info_plus/device_info_plus.dart';
/*============================================ third parties libraries ====================================*/

export 'package:dio/dio.dart';
export 'package:dotted_border/dotted_border.dart';
export 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
export 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
export 'package:file_picker/file_picker.dart';
export 'package:firebase_core/firebase_core.dart';
export 'package:flutter/cupertino.dart' hide RefreshCallback;
export 'package:flutter/foundation.dart';
/* =============================================dart, flutter and getx =====================================*/

export 'package:flutter/gestures.dart';
export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'package:flutter_animate/flutter_animate.dart'
    hide ScaleEffect, SwapEffect, SlideEffect;
export 'package:flutter_dash/flutter_dash.dart';
export 'package:flutter_easyloading/flutter_easyloading.dart';
export 'package:flutter_rating_bar/flutter_rating_bar.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
/*================================================== application binding =====================================*/

export 'package:base_project/app/bindings/initial_binding.dart';
export 'package:base_project/app/bindings/local_source_bindings.dart';
export 'package:base_project/app/bindings/repository_bindings.dart';
/*=============================================== base exports =============================================*/

export 'package:base_project/app/core/base/base_view.dart';
export 'package:base_project/app/core/base/page_state.dart';

export 'package:base_project/app/core/utils/debouncer.dart';
export 'package:base_project/app/core/utils/distance_provider.dart';
export 'package:base_project/app/core/utils/helper_widget.dart';
export 'package:base_project/app/core/utils/image_picker.dart';
export 'package:base_project/app/core/utils/show_place_picker.dart';
export 'package:base_project/app/core/utils/url_launcher.dart';
export 'package:base_project/app/core/utils/validator.dart';
export 'package:base_project/app/core/values/app_assets.dart';
export 'package:base_project/app/core/values/app_colors.dart';
export 'package:base_project/app/core/values/app_constants.dart';
export 'package:base_project/app/core/values/app_global_values.dart';
export 'package:base_project/app/core/values/app_theme.dart';
/* ================================================app constants ===========================================*/

export 'package:base_project/app/core/values/app_values.dart';
export 'package:base_project/app/core/values/route_arguments.dart';
export 'package:base_project/app/core/values/text_styles.dart';
export 'package:base_project/app/core/widget/alert_dialog_widget.dart';
export 'package:base_project/app/core/widget/annotated_region_widget.dart';
export 'package:base_project/app/core/widget/asset_image.dart';
export 'package:base_project/app/core/widget/bounce_widget.dart';
export 'package:base_project/app/core/widget/button_widget.dart';
export 'package:base_project/app/core/widget/custom_appbar.dart';
export 'package:base_project/app/core/widget/custom_flashbar.dart';
export 'package:base_project/app/core/widget/custom_inkwell.dart';
export 'package:base_project/app/core/widget/custom_loader.dart';
export 'package:base_project/app/core/widget/double_back_press.dart';
/*=================================================== widgets =============================================*/

export 'package:base_project/app/core/widget/edit_text_widget.dart';
export 'package:base_project/app/core/widget/image_picker_dialog.dart';
export 'package:base_project/app/core/widget/images_videos_widget.dart';
export 'package:base_project/app/core/widget/logout_dialog.dart';
export 'package:base_project/app/core/widget/mask_formatter.dart';
export 'package:base_project/app/core/widget/network_image.dart';
export 'package:base_project/app/core/widget/no_result_found_widget.dart';
export 'package:base_project/app/core/widget/out_of_stock_not_available.dart';
export 'package:base_project/app/core/widget/read_more_widget.dart';
export 'package:base_project/app/core/widget/screen_heading.dart';
export 'package:base_project/app/core/widget/stepper/country_picker.dart';
export 'package:base_project/app/core/widget/stepper/dot_provider.dart';
export 'package:base_project/app/core/widget/stepper/stepper_model.dart';
export 'package:base_project/app/core/widget/stepper/stepper_widget.dart';
export 'package:base_project/app/core/widget/stepper/ticket_painter_widget.dart';
export 'package:base_project/app/core/widget/stepper/ticket_widget.dart';
export 'package:base_project/app/core/widget/text_field_dialog_widget.dart';
export 'package:base_project/app/core/widget/text_view.dart';
export 'package:base_project/app/core/widget/time_formatter.dart';
/*==================================================== local services =====================================*/

export 'package:base_project/app/data/local/prefrences/preference.dart';
export 'package:base_project/app/data/models/error_response_model.dart';
export 'package:base_project/app/data/models/google_response_models/google_time_response_model.dart';
export 'package:base_project/app/data/models/links_self_meta_model.dart';
/* =========================================== response model=====================================================*/

export 'package:base_project/app/data/models/message_response_model.dart';
// notifications and firebase
export 'package:base_project/app/data/push_notification_manager.dart';
/*================================================== dio client ======================================*/

export 'package:base_project/app/data/repository/api_repository.dart';
/* =========================================== request model=====================================================*/

export 'package:base_project/app/data/repository/auth_request_model.dart';
export 'package:base_project/app/data/repository/dio_client.dart';
export 'package:base_project/app/data/repository/endpoint.dart';
export 'package:base_project/app/data/repository/network_exceptions.dart';
export 'package:base_project/app/export.dart';
export 'package:base_project/app/logger/logger_utils.dart';

export 'package:base_project/app/routes/app_pages.dart';
export 'package:base_project/app/routes/app_routes.dart';
export 'package:base_project/main.dart';
/*============================================== application screens =====================================*/
export 'package:base_project/my_app.dart';
export 'package:get/get.dart'
    hide Response, HeaderValue, MultipartFile, FormData;
export 'package:get/instance_manager.dart';
export 'package:get_storage/get_storage.dart';
export 'package:grouped_list/grouped_list.dart';
 export 'package:image_picker/image_picker.dart';
export 'package:intl/intl.dart' hide TextDirection;
export 'package:intl_phone_field/countries.dart';
export 'package:lottie/lottie.dart';
export 'package:media_kit/media_kit.dart';
export 'package:media_kit_video/media_kit_video.dart';
export 'package:mime/mime.dart';
export 'package:navigation_history_observer/navigation_history_observer.dart';
export 'package:package_info_plus/package_info_plus.dart';
export 'package:path_provider/path_provider.dart';
export 'package:photo_view/photo_view.dart';
export 'package:pinput/pinput.dart';
export 'package:smooth_page_indicator/smooth_page_indicator.dart';


export 'package:base_project/app/core/base/keys.dart';
