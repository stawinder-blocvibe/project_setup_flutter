

import 'package:base_project/app/export.dart';

import '../controllers/chat_controller.dart';

class ChatScreen extends GetView<ChatController> {
  final controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: CustomAppBar(),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(0, 1),
                    blurRadius: 1,
                    spreadRadius: 2)
              ]),
              child: Row(
                children: [
                  NetworkImageWidget(
                    imageUrl: controller.userImage.value,
                    imageHeight: height_40,
                    imageWidth: height_40,
                    radiusAll: height_60,
                  ).paddingOnly(right: margin_10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(controller.userName.value,
                            textStyle: textStyleTitleLarge()
                                .copyWith(color: appColor)),
                      ],
                    ),
                  ),
                ],
              ).paddingOnly(
                  left: margin_15,
                  right: margin_15,
                  bottom: margin_15,
                  top: margin_5),
            ),
            Expanded(child: _chatMessageList()),
            _sendTextField()
          ],
        ),
      ),
    );
  }

  /* Widget _chatMessageList() => GetBuilder<ChatController>(builder: (context) {
        return Expanded(
          child: GroupedListView<ChatList, DateTime>(
            padding: EdgeInsets.symmetric(
                vertical: margin_10, horizontal: margin_15),
            elements: controller.chatList,
            controller: controller.scrollController,
            order: GroupedListOrder.ASC,
            groupBy: (ChatList element) => //from_id
                DateTime.now() ?? DateTime.parse(element.createdOn),
            groupSeparatorBuilder: _createGroupHeader,
            itemBuilder: (_, ChatList element) =>
                element.fromId == controller.loginDataModel.value.id
                    ? _sentMsg(element)
                    : _receivedMsg(element),
          ),
        );
      });*/
  Widget _chatMessageList() => Obx(() => controller.chatList.value.isEmpty
      ? Center(
          child: TextView(keyNoDataFound.tr,
              textStyle: textStyleBodyMedium().copyWith(color: Colors.black)),
        )
      : GroupedListView<ChatList, DateTime>(
          padding:
              EdgeInsets.symmetric(vertical: margin_10, horizontal: margin_15),
          elements: controller.chatList,
          controller: controller.scrollController,
          order: GroupedListOrder.ASC,
          reverse: true,
          groupBy: (ChatList element) => DateTime(
            DateTime.parse(element.sendOn).year,
            DateTime.parse(element.sendOn).month,
            DateTime.parse(element.sendOn).day,
          ),
          groupSeparatorBuilder: _createGroupHeader,
          itemBuilder: (_, ChatList element) =>
              element.fromId == controller.loginDataModel.value.id
                  ? _sentMsg(element)
                  : _receivedMsg(element),
        ));

  Widget _createGroupHeader(DateTime value) => Text(
        DateFormat(dayFormatter).format(value) ==
                DateFormat(dayFormatter).format(DateTime.now())
            ? keyToday.tr
            : DateTime.now().difference(value).inDays == 1
                ? keyYesterday.tr
                : DateFormat(dateMonthFormatter).format(value).toLowerCase(),
        style: textStyleBodySmall()
            .copyWith(color: Colors.black87, fontWeight: FontWeight.w400),
        textAlign: TextAlign.center,
      ).paddingOnly(bottom: margin_15);

  _receivedMsg(ChatList element) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: Get.width * 0.75,
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: margin_5),
                  padding: EdgeInsets.all(margin_8),
                  decoration: BoxDecoration(
                      color: chatReceiveColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(radius_10),
                        bottomLeft: Radius.circular(radius_10),
                        bottomRight: Radius.circular(radius_10),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(element.message ?? "",
                              maxLines: 120,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: textStyleBodyLarge())
                          .paddingOnly(bottom: margin_3),
                      Text(
                          '${element.createdOn}' ??
                              '12:11 AM' ??
                              timeFormat(element.createdOn.toString()),
                          textAlign: TextAlign.start,
                          style: textStyleBodySmall().copyWith(
                            fontSize: font_9,
                            color: Colors.black87,
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ).paddingOnly(bottom: margin_5);
  }

  _sentMsg(ChatList element) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: Get.width * 0.75,
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: margin_5),
                  padding: EdgeInsets.all(margin_8),
                  decoration: BoxDecoration(
                      color: chatSendColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(radius_10),
                        bottomLeft: Radius.circular(radius_10),
                        bottomRight: Radius.circular(radius_10),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(element.message ?? "",
                              maxLines: 120,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: textStyleBodyLarge())
                          .paddingOnly(bottom: margin_3),
                      Text(
                          '${element.createdOn}' ??
                              displayTimeAgoFromTimestamp(
                                  element.createdOn.toString()) ??
                              '12:11 AM' ??
                              timeFormat(element.createdOn.toString()),
                          textAlign: TextAlign.end,
                          style: textStyleBodySmall().copyWith(
                            fontSize: font_9,
                            color: Colors.black87,
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ).paddingOnly(bottom: margin_5);
  }

  _sendTextField() => Padding(
        padding: EdgeInsets.symmetric(horizontal: margin_8)
            .copyWith(bottom: margin_10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: TextFieldWidget(
                textController: controller.messageTextController,
                fillColor: messageTextFieldColor,
                hint: keyMessage.tr,
                contentPadding: EdgeInsets.symmetric(
                    vertical: 14.7.w, horizontal: margin_15),
                radius: radius_0,
                maxLines: 4,
                hintStyle: textStyleBodyMedium().copyWith(
                    color: greyTextColor, fontWeight: FontWeight.w500),
              ),
            ),
            InkWell(
              onTap: () {
                controller.hitSendMessageApiCall();
              },
              child: AssetImageWidget(iconsIcSendMessage,
                  imageHeight: height_47,
                  imageWidth: height_50,
                  radiusAll: radius_50,
                  imageFitType: BoxFit.cover),
            ).marginOnly(left: 10),
          ],
        ),
      );
}
