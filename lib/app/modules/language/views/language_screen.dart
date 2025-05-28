import 'package:base_project/app/export.dart';
import 'package:base_project/app/modules/language/controller/language_controller.dart';


class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  late LanguageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Get.find<LanguageController>();
    _loadDefaultLanguage();
  }

  Future<void> _loadDefaultLanguage() async {
    var defaultLanguage = await PreferenceManger().getDefaultLanguage();
    debugPrint('defaultLanguage $defaultLanguage');

    if (defaultLanguage == "en") {
      Get.updateLocale(TranslationService.localeEN_US);
      _controller.selectedIndex = 0;
    } else if (defaultLanguage == "fa") {
      Get.updateLocale(TranslationService.localeDari);
      _controller.selectedIndex = 1;
    } else if (defaultLanguage == "ps") {
      Get.updateLocale(TranslationService.localePS);
      _controller.selectedIndex = 2;
    }
    _controller.update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingColor: appColor,
      ),
      body: body(),
    );
  }

  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          keyLanguage.tr,
          textStyle: textStyleLabelMeduim()
              .copyWith(color: appColor, fontSize: font_18),
        ),
        SizedBox(
          height: height_15,
        ),
        languageSelect()
      ],
    ).marginSymmetric(horizontal: margin_15);
  }

  Widget languageSelect() {
    return GetBuilder<LanguageController>(
      builder: (controller) {
        return ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(
              height: height_15,
            );
          },
          itemCount: controller
              .languageList.length, // Use the length of the language list
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                controller.selectedIndex = index;
                controller.update();
                String selectedLanguage = controller.languageCodes[index];
                await PreferenceManger().saveLanguage(selectedLanguage);
                localKey = await PreferenceManger().getDefaultLanguage();
                debugPrint("localKey ${localKey}");
                Get.updateLocale(Locale(selectedLanguage)).then((value) {
                  Get.offAllNamed(AppRoutes.customerMainScreen);
                });
              },
              child: Container(
                padding: EdgeInsets.all(margin_15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius_10),
                  border:
                      Border.all(color: Colors.grey.shade400, width: width_1),
                  color: controller.selectedIndex == index
                      ? Colors.blue.shade100
                      : Colors.white, // Highlight selected item
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      controller.languageList[index],
                      textStyle: textStyleLabelMeduim()
                          .copyWith(color: Colors.black87, fontSize: font_12),
                    ),
                    if (controller.selectedIndex == index)
                      AssetImageWidget(
                        localKey == "en"
                            ? iconsIcCompleted
                            : iconsIcCompletedRtl,
                        imageHeight: height_17,
                        imageWidth: height_17,
                        radiusAll: 90,
                        imageFitType: BoxFit.cover,
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
