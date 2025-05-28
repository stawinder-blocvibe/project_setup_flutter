import '../../../core/utils/helper_function.dart';
import '../../../export.dart';
import '../controller/support_chat_controller.dart';
import '../data_mdoel/message_data_model.dart';

class SupportChatScreen extends GetView<SupportChatController> {
  final controller = Get.put(SupportChatController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.back();

        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          leadingColor: appColor,
          bgColor: Colors.white,
          onTap: () {
            Get.back();
          },
        ),
        body: listWidget(),
      ),
    );
  }

  listWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          keyChatSupport.tr,
          style: TextStyle(
              color: appColor, fontSize: font_20, fontWeight: FontWeight.w500),
        ),
        Obx(() => controller.isLoading.value
            ? Expanded(
                child: Center(
                  child: CircularProgressIndicator(
                    color: appColor,
                  ),
                ),
              )
            : controller.chatList.isEmpty
                ? Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AssetImageWidget(
                            iconsIcMessage,
                            imageHeight: height_50,
                          ),
                          SizedBox(
                            height: height_25,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(radius_15),
                                color: Colors.grey),
                            child: TextView(
                              keyHowHelp.tr,
                              textStyle: TextStyle(
                                  color: Colors.white, fontSize: font_13),
                            ).marginSymmetric(
                                horizontal: margin_10, vertical: margin_7),
                          ),
                        ],
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                    reverse: true,
                    controller: controller.scrollController,
                    itemCount: controller.chatList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      MessageDataModel message = controller.chatList[index];
                      return Container(
                        width: Get.width,
                        child: Column(
                          children: [
                            message.fromId != controller.userDataModel.id
                                ? leftSideMessage(message)
                                : rightSideMessage(message)
                          ],
                        ),
                      );
                    },
                  ).marginOnly(bottom: margin_5))),
        SizedBox(
          height: height_10,
        ),
        TextField(
              focusNode: controller.messageFocusNode,
              controller: controller.messageController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade300,
                // Grey background color
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(radius_30), // Increased radius
                  borderSide: BorderSide.none, // No border line
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(radius_30), // Increased radius
                  borderSide: BorderSide.none, // No border line when enabled
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(radius_30), // Increased radius
                  borderSide: BorderSide.none, // No border line when focused
                ),
                hintText: keyTypeYourMessage.tr,
                contentPadding: EdgeInsets.symmetric(horizontal: margin_10),
                hintStyle: TextStyle(color: Colors.grey[600]),
                // Hint text color

                suffixIcon: GestureDetector(
                  onTap: () {
                    debugPrint("localKey===$localKey");
                    controller.hitSendMessageApiCall();
                  },
                  child: AssetImageWidget(
                    localKey == "en"
                        ? iconsIcSendMessage
                        : iconsIcSendMessageRtl,
                    imageHeight: height_15,
                    imageWidth: height_35,
                    radiusAll: 90,
                    imageFitType: BoxFit.cover,
                  ),
                ).marginAll(margin_4),
              ),
            ).paddingOnly(bottom: margin_20) ??
            Row(
              children: [
                SizedBox(
                  width: Get.width * .85,
                  child: TextFieldWidget(
                    textController: controller.messageController,
                    hint: 'Type your message...',
                    contentPadding: EdgeInsets.symmetric(
                        vertical: margin_15, horizontal: margin_12),
                    fillColor: Colors.grey.shade100,
                    maxLength: 1000,
                    minLine: 1,
                    decoration: DecoratedInputBorder(
                      child: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(margin_10),
                          borderSide: BorderSide(color: Colors.transparent)),
                      shadow: BoxShadow(
                          color: Colors.transparent,
                          blurRadius: margin_0,
                          spreadRadius: radius_1),
                    ),

                    // textController: ,
                  ).marginOnly(
                      bottom: margin_10, left: margin_13, right: margin_13),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    if (controller.messageController.text.trim() != '') {
                      controller.hitSendMessageApiCall();
                    }
                  },
                  child: AssetImageWidget(
                    iconsIcSent,
                    imageWidth: width_30,
                  ).paddingOnly(bottom: margin_5),
                )
              ],
            )
      ],
    ).marginSymmetric(horizontal: margin_12);
  }

/*  leftSideMessage(MessageDataModel message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile Image
        AssetImageWidget(
          iconProfileSelected,
          radiusAll: height_35,
          imageHeight: height_35,
          imageWidth: height_35,
        ),
        // Message Container
        Container(
          width: Get.width * .6,
          decoration: BoxDecoration(
              // color: settingCardColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              border: Border.all(color: appColor)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  child: TextView(
                    message.message ?? "",
                    maxLines: 1000,
                    textAlign: TextAlign.start,
                    textStyle: textStyleBodyMedium()
                        .copyWith(color: Colors.black, fontSize: font_13),
                  ).marginAll(margin_10),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: TextView(
                  message.createdOn,
                  textStyle: textStyleBodyMedium()
                      .copyWith(color: Colors.black, fontSize: font_11),
                ).marginSymmetric(horizontal: margin_5),
              ),
            ],
          ),
        ).marginOnly(top: margin_14, left: margin_4),
      ],
    );
  }

  rightSideMessage(MessageDataModel message) {
    return Container(
      width: Get.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: Get.width * .6,
                margin: EdgeInsets.only(right: margin_2, bottom: margin_7),
                padding: EdgeInsets.all(margin_8),
                decoration: BoxDecoration(
                    // color: settingCardColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(radius_10),
                      bottomLeft: Radius.circular(radius_10),
                      bottomRight: Radius.circular(radius_10),
                    ),
                    border: Border.all(color: Colors.green)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Message Text
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        child: Text(
                          message.message ?? "",
                          maxLines: 1000,
                          style: textStyleBodyMedium().copyWith(
                            color: Colors.black,
                            fontSize: font_13,
                          ),
                        ).paddingOnly(bottom: margin_3, right: margin_10),
                      ),
                    ),
                    // Align the timestamp to the right
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        message.createdOn,
                        style: textStyleBodyMedium().copyWith(
                          fontSize: font_10,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ).marginOnly(top: margin_15),
          // Profile Image
          NetworkImageWidget(
            placeHolder: iconsIcPerson,
            imageUrl: controller.userDataModel.profileFile ?? '',
            imageHeight: height_42,
            imageWidth: width_45,
            radiusAll: 90,
          )
        ],
      ).paddingOnly(bottom: margin_5),
    );
  }*/

  leftSideMessage(MessageDataModel message) {
    return Row(
      children: [
        // Profile Image
        // AssetImageWidget(
        //   iconAdmin,
        //   radiusAll: height_35,
        //   imageHeight: height_35,
        //   imageWidth: height_35,
        // ),
        // Message Container
        Container(
          padding: EdgeInsets.all(margin_5),
          constraints: BoxConstraints(minWidth: 0, maxWidth: Get.width * 0.8),
          decoration: BoxDecoration(
            color: searchTextFieldColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  message.message ?? "",
                  maxLines: 1000,
                  textAlign: TextAlign.start,
                  textStyle: textStyleBodyMedium()
                      .copyWith(color: Colors.black, fontSize: font_13),
                ).marginAll(margin_5),
                Align(
                  alignment: Alignment.topLeft,
                  child: TextView(
                    HelperFunction.parseDateTimeNew(message.createdOn)
                            .toString() ??
                        handleTime(time: message.createdOn) ??
                        displayTimeAgoFromTimestamp(message.createdOn) ??
                        extractTime(message.createdOn),
                    textStyle: textStyleBodyMedium().copyWith(
                      color: Colors.black,
                      fontSize: font_11,
                    ),
                  ).marginSymmetric(horizontal: margin_5),
                ),
              ],
            ),
          ),
        ).marginOnly(top: margin_14, left: margin_4),
      ],
    );
  }

  rightSideMessage(MessageDataModel message) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(minWidth: 0, maxWidth: Get.width * 0.8),
          padding: EdgeInsets.all(margin_8),
          decoration: BoxDecoration(
            color: promoBorderColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius_10),
              bottomLeft: Radius.circular(radius_10),
              bottomRight: Radius.circular(radius_10),
            ),
          ),
          child: IntrinsicWidth(
            child: GestureDetector(
              onTap: () {
                debugPrint(
                    'tesCase--->${HelperFunction.parseDateTimeNew(message.createdOn)}');
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Message Text
                  Text(
                    message.message ?? "",
                    maxLines: 1000,
                    style: textStyleBodyMedium().copyWith(
                      color: Colors.black,
                      fontSize: font_13,
                    ),
                  ).paddingOnly(bottom: margin_3, right: margin_10),
                  // Align the timestamp to the right
                  Text(
                    HelperFunction.parseDateTimeNew(message.createdOn)
                            .toString() ??
                        '${message.createdOn.toString()}',
                    /*      handleTime(time: message.createdOn) ??
                        "${proUtcToLocalLatest(message.createdOn, 'hh:mm a')} ${HelperFunction.timeDescription(DateTime.parse(message.createdOn))}" ??
                        extractTime(message.createdOn),*/
                    style: textStyleBodyMedium().copyWith(
                      fontSize: font_10,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ).marginOnly(top: margin_15),
        // Profile Image
        ///for future use
        /* NetworkImageWidget(
          placeHolder: iconsIcPerson,
          imageUrl: controller.userDataModel.restaurantData?.imageFile ?? '',
          imageHeight: height_42,
          imageWidth: width_45,
          radiusAll: 90,
        )*/
      ],
    ).paddingOnly(bottom: margin_5);
  }

  String extractTime(String dateTimeString) {
    List<String> parts = dateTimeString.split(' ');
    return '${parts[0]} ${parts[1]}'; // Return "hh:mm AM/PM"
  }

  handleTime({required String time}) {
    return "${proUtcToLocalLatest(time, 'hh:mm a')} ${HelperFunction.timeDescription(DateTime.parse(time))}";
  }

  profileHead() {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: NetworkImageWidget(
            imageUrl: iconsIcPerson,
            imageHeight: height_40,
            imageWidth: height_40,
            radiusAll: height_50,
          ).paddingOnly(right: margin_10),
        ),
        TextView('Test',
                textStyle: textStyleBodyMedium().copyWith(color: Colors.white))
            .paddingOnly(bottom: margin_10)
      ],
    ).paddingSymmetric(horizontal: margin_15);
  }
}
