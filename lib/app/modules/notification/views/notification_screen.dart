/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'package:base_project/app/core/utils/helper_function.dart';
import 'package:base_project/app/export.dart';

class NotificationScreen extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            localStorage.read(PreferenceManger.roleId) == roleCustomer
                ? Colors.white
                : bgColor,
        appBar: CustomAppBar(),
        body: Obx(() => controller.isLoading.value ? AppBar() : _bodyWidget()));
  }

  Column _bodyWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextView(keyNotifications.tr, textStyle: textStyleHeadlineMedium()),
            controller.notificationsList.isNotEmpty
                ? GetInkWell(
                    onTap: () {
                      controller.hitClearAllNotificationAPI();
                    },
                    child: TextView(keyClear.tr,
                        textStyle: textStyleBodyLarge().copyWith(
                            color: appColor, fontWeight: FontWeight.w600)),
                  )
                : Container(),
          ],
        ).marginSymmetric(horizontal: margin_15, vertical: margin_5),
        _notificationList()
      ],
    );
  }

  _notificationList() => Expanded(
        child: controller.notificationsList.isEmpty
            ? noResultFoundWidget()
            : ListView.builder(
                    shrinkWrap: true,
                    controller: controller.scrollController,
                    itemCount: controller.notificationsList.length,
                    itemBuilder: (context, int index) =>
                        _notificationView(index))
                .marginSymmetric(vertical: margin_15),
      );

  _notificationView(index) => GestureDetector(
        /*  onTap: () {
          debugPrint(
              "NotificationScreenClickIndex ${controller.notificationsList.value[index].toJson()}");
          controller.notificationRedirection(
              controller.notificationsList.value[index].toJson());
        },*/
        onTap: () {
          final notificationData =
              controller.notificationsList.value[index].toJson();
          debugPrint("NotificationScreenClickIndex $notificationData");

          debugPrint(
              "State ID: ${notificationData['state_id']}, Order Status: ${notificationData['model_type']}");

          if (notificationData['model_type']?.toString().trim() ==
                  "app\\modules\\chat\\models\\Chat" &&
              notificationData['state_id'] == 0) {
            controller.notificationsList.removeAt(index);

            controller.notificationsList.refresh();

            debugPrint(
                "✅ Chat notification removed as order is delivered and state_id is 0");

            return;
          }

          Future.delayed(Duration(milliseconds: 300), () {
            controller.notificationRedirection(notificationData);
          });
        },
        child: Container(
          width: Get.width,
          margin:
              EdgeInsets.symmetric(horizontal: margin_15, vertical: margin_7),
          padding:
              EdgeInsets.symmetric(horizontal: margin_15, vertical: margin_10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                spreadRadius: 1,
                color: Colors.grey.shade300,
              ),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              handleImageLogic(
                  index: index,
                  isOrderPlaceSuccess: controller
                              .notificationsList.value[index].typeId
                              .toString() ==
                          "0" &&
                      controller.notificationsList.value[index].stateId
                              .toString() ==
                          "0"),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(controller.notificationsList[index].title ?? '',
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        textStyle: textStyleBodyLarge()),
                    TextView(
                        "${proUtcToLocalLatest(controller.notificationsList[index].createdOn, 'hh:mm a')} ${HelperFunction.timeDescription(DateTime.parse(controller.notificationsList[index].createdOn!))}",
                        /*   HelperFunction.timeAgo(DateTime.parse(
                            controller.notificationsList[index].createdOn!)),*/
                        textAlign: TextAlign.left,
                        textStyle: textStyleBodySmall()
                            .copyWith(color: textFieldColor)),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget handleImageLogic(
      {required int index, required bool isOrderPlaceSuccess}) {
    if (isOrderPlaceSuccess) {
      return AssetImageWidget(
        iconOrderDelivered,
        imageHeight: height_40,
        imageWidth: height_40,
      ).paddingOnly(right: margin_10);
    } else if ((controller
                .notificationsList.value[index].imageFile?.isNotEmpty ==
            true &&
        controller.notificationsList.value[index] != null)) {
      return NetworkImageWidget(
        imageUrl: controller.notificationsList.value?[index].imageFile ?? "",
        imageHeight: height_40,
        imageWidth: height_40,
        radiusAll: radius_50,
      ).paddingOnly(right: margin_10);
    } else {
      return AssetImageWidget(
        iconsIcNotificationTick,
        imageHeight: height_40,
        imageWidth: height_40,
      ).paddingOnly(right: margin_10);
    }
  }
}
