/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'package:base_project/app/export.dart';
import 'package:base_project/app/modules/chat/controllers/life_needs_chat_list_controller.dart';

class LifeNeedsChatListScreen extends GetView<LifeNeedsChatListController> {
  const LifeNeedsChatListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(children: [
        ScreenHeading(
          title: keyChats.tr,
        ),
        Obx(
          () => Expanded(
            child:controller.chatLists.isEmpty?noResultFoundWidget(): ListView.separated(
              itemCount: controller.chatLists.length,
              shrinkWrap: true,
              padding: EdgeInsets.all(margin_15),
              itemBuilder: (context, index) {
                return GetInkWell(
                  onTap: () async{
                await    Get.toNamed(AppRoutes.chatRoute, arguments: {
                      argUserNameId: controller.chatLists[index].id,
                      argUserName: controller.chatLists[index].fullName,
                      argUserProfile: controller.chatLists[index].profileFile,
                    });
                controller.chatLists[index].unreadMessageCount=0;
                controller.chatLists.refresh();
                  },
                  child: Row(
                    children: [
                      _userImage(controller.chatLists[index].profileFile ?? ""),
                      _nameAndMessage(index),
                      _timeAndUnreadCount(index),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: height_15,
                );
              },
            ),
          ),
        )
      ]),
    );
  }

  _userImage(String profileFile) {
    return NetworkImageWidget(
      imageUrl: profileFile,
      imageWidth: width_50,
      imageHeight: width_50,
      radiusAll: radius_50,
      imageFitType: BoxFit.cover,
    );
  }

  _nameAndMessage(int index) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(controller.chatLists[index].fullName ?? "",
              textStyle:
                  textStyleBodyLarge().copyWith(fontWeight: FontWeight.w600)),
          TextView(controller.chatLists[index].lastMessage ?? "",
                  textStyle: textStyleBodySmall())
              .marginOnly(left: margin_5)
              .marginOnly(top: margin_5),
        ],
      ).marginOnly(left: margin_10),
    );
  }

  _timeAndUnreadCount(int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextView(timeFormat(controller.chatLists[index].lastMessageTime),
            textStyle: textStyleBodyMedium().copyWith(
                color: controller.chatLists[index].unreadMessageCount != null &&
                        controller.chatLists[index].unreadMessageCount != "" &&
                        controller.chatLists[index].unreadMessageCount
                                .toString() !=
                            "0"
                    ? appColor
                    : Colors.black,
                fontWeight: FontWeight.w500)),
        controller.chatLists[index].unreadMessageCount != null &&
                controller.chatLists[index].unreadMessageCount != "" &&
                controller.chatLists[index].unreadMessageCount.toString() != "0"
            ? Container(
                padding: EdgeInsets.all(margin_5),
                decoration: BoxDecoration(
                    color: controller.chatLists[index].unreadMessageCount !=
                                null &&
                            controller.chatLists[index].unreadMessageCount !=
                                "" &&
                            controller.chatLists[index].unreadMessageCount
                                    .toString() !=
                                "0"
                        ? appColor
                        : Colors.transparent,
                    shape: BoxShape.circle),
                child: TextView(
                    controller.chatLists[index].unreadMessageCount != null &&
                            controller.chatLists[index].unreadMessageCount != ""
                        ? controller.chatLists[index].unreadMessageCount
                            .toString()
                        : "",
                    textStyle: textStyleBodySmall().copyWith(
                        color: controller.chatLists[index].unreadMessageCount !=
                                    null &&
                                controller
                                        .chatLists[index].unreadMessageCount !=
                                    "" &&
                                controller.chatLists[index].unreadMessageCount
                                        .toString() !=
                                    "0"
                            ? Colors.white
                            : Colors.transparent,
                        fontSize: font_10)),
              )
            : SizedBox(),
      ],
    );
  }
}
