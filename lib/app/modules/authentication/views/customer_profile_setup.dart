import 'package:base_project/app/core/widget/image_pickerr_dialog.dart';
import 'package:base_project/app/export.dart';
import 'package:base_project/app/modules/authentication/controllers/customer_profile_setup_controller.dart';

import '../../../core/widget/country_picker.dart';
import '../../../core/widget/single_select_dropdown.dart';

class CustomerProfileSetupScreen
    extends GetView<CustomerProfileSetupController> {
  final controller = Get.put(CustomerProfileSetupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height_25,
          ),
          _profileSetupText(),
          profileView(),
          form(context),
          if (Get.previousRoute != AppRoutes.customerMainScreen) sendButton()
        ],
      ).marginSymmetric(horizontal: margin_20, vertical: margin_30),
    );
  }

  Widget appBar() {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Icon(
        Icons.arrow_back,
        size: height_25,
        color: Colors.white,
      ),
    ).marginOnly(top: margin_25);
  }

  Widget _profileSetupText() {
    return TextView(
        Get.previousRoute == AppRoutes.customerProfileScreen
            ? keyUpdateProfile.tr
            : keyProfileSetup.tr,
        textStyle: textStyleBody1().copyWith(
            color: applyFilterColor,
            fontSize: font_20,
            fontWeight: FontWeight.w600));
  }

  Widget profileView() => Obx(() => Center(
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.transparent),
              ),
              child: controller.profileImage.value.contains("http")
                  ? _networkImage()
                  : _selectedImage(),
            ),
            if (Get.previousRoute != AppRoutes.customerMainScreen)
              Positioned(
                right: controller.profileImage.isEmpty ? margin_2 : margin_2,
                bottom: 8,
                child: InkWell(
                    onTap: () {
                      Get.bottomSheet(ImagePickerDialogg(
                        galleryFunction: () {
                          Get.back();
                          controller.updateImageFile(imageFromGallery());
                        },
                        cameraFunction: () {
                          Get.back();
                          controller.updateImageFile(imageFromCamera());
                        },
                        // title: selectProfileImage,
                      ));
                    },
                    child: AssetImageWidget(iconCamera,
                        imageHeight: height_22, imageWidth: height_22)),
              )
          ],
        ),
      ).paddingOnly(top: margin_15));

  _networkImage() {
    return Obx(
      () => NetworkImageWidget(
        imageUrl: currentUserDataModel.value.detail?.profileFile ?? '',
        imageHeight: height_80,
        imageWidth: height_80,
        radiusAll: radius_60,
        // placeHolder: iconProfile,
        imageFitType: BoxFit.cover,
      ),
    );
  }

  _selectedImage() {
    return controller.profileImage.value.isEmpty
        ? AssetImageWidget(
            iconsIcProfileSelected,
            imageHeight: height_80,
            imageWidth: height_80,
            radiusAll: radius_60,
            imageFitType: BoxFit.contain,
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(radius_60),
            child: Image.file(
              File(controller.profileImage.value),
              fit: BoxFit.fill,
              height: height_80,
              width: height_80,
            ),
          );
  }

  Widget form(BuildContext context) {
    return Form(
      key: controller.globalKey,
      child: Column(
        children: [
          _firstNameTextField(),
          _lastNameTextField(),
          _genderDropDown(),
          _dobTextField(context),
          controller.isSocial == null ? _mobileNumberTextField() : phoneNo()
        ],
      ),
    ).marginOnly(top: margin_30);
  }

  _firstNameTextField() => TextFieldWidget(
        hint: keyFirstName.tr,
        isShadow: false,
        fillColor: Colors.white,
        formatter: [
          FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
        ],
        contentPadding:
            EdgeInsets.symmetric(horizontal: margin_15, vertical: margin_13),
        labelText: keyFirstName.tr,
        hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
        validate: (data) =>
            Validator.fieldChecker(value: data, message: keyFirstName.tr),
        textController: controller.firstNameTextController,
        focusNode: controller.firstNameFocusNode,
        maxLength: 35,
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
      ).paddingOnly(top: margin_3);

  _lastNameTextField() => TextFieldWidget(
        hint: keyLastName.tr,
        isShadow: false,
        formatter: [
          FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
        ],
        fillColor: Colors.white,
        contentPadding:
            EdgeInsets.symmetric(horizontal: margin_15, vertical: margin_13),
        labelText: keyLastName.tr,
        hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
        validate: (data) =>
            Validator.fieldChecker(value: data, message: keyLastName.tr),
        textController: controller.lastNameTextController,
        focusNode: controller.lastNameFocusNode,
        maxLength: 35,
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
      ).paddingOnly(top: margin_15);

  _genderDropDown() {
    return SingleSelectDropdown(
      validate: (value) {
        if (controller.genderTextController.text == '' && value == null) {
          return '${keyGender.tr} ${keyCannotEmpty.tr}';
        }
        return null;
      },
      hint: controller.genderTextController.text != ''
          ? controller.genderTextController.text
          : keySelectGender.tr,
      icon: const Icon(
        Icons.keyboard_arrow_down_outlined,
        color: Colors.black,
      ),
      dropdownMenuItems: controller.genderType.map((selectedType) {
        return DropdownMenuItem(
          value: selectedType,
          child: Text(
            selectedType,
            style: TextStyle(color: Colors.black, fontSize: font_14),
          ),
        );
      }).toList(),
      onChanged: (newValue) {
        controller.genderTextController.text = newValue.toString();
        var index =
            controller.genderType.indexWhere((element) => element == newValue);
        controller.selectGender.value = index.toString();
      },
    ).marginOnly(top: margin_15);
  }

  _dobTextField(BuildContext context) => TextFieldWidget(
        hint: keyDateOfBirthHint.tr,
        isShadow: false,
        fillColor: Colors.white,
        contentPadding:
            EdgeInsets.symmetric(horizontal: margin_15, vertical: margin_13),
        labelText: keyDateOfBirth.tr,
        hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
        validate: (data) =>
            Validator.fieldChecker(value: data, message: keyDateOfBirth.tr),
        textController: controller.dobTextController,
        focusNode: controller.dobFocusNode,
        readOnly: true,
        onTap: () {
          _selectDoB(context);
        },
        maxLength: 35,
        suffixIcon: Icon(
          Icons.calendar_month,
          color: Colors.grey,
          size: height_20,
        ).marginOnly(right: margin_8),
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
      ).marginOnly(top: margin_13);

  _selectDoB(BuildContext context) async {
    DateTime dateTime = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: colorAppColor, // header background color
                onPrimary: Colors.white, // header text color
                onSurface: Colors.black, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: colorAppColor, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        firstDate: DateTime(1970),
        initialDate: DateTime(1998),
        lastDate: DateTime(2010),
        initialDatePickerMode: DatePickerMode.day);
    if (picked != null) {
      dateTime = picked;
      controller.selectedDate = changeDateIntoString(dateTime, dayFormatter);
      controller.dobTextController.text =
          changeDateIntoString(dateTime, showDayFormatter);
      controller.update();
    } else {
      showInSnackBar(message: keyDateNotSelected.tr);
    }
  }

  _mobileNumberTextField() => TextFieldWidget(
        hint: keyMobileNumber.tr,
        isShadow: false,
        fillColor: Colors.white,

        contentPadding:
            EdgeInsets.symmetric(horizontal: margin_15, vertical: margin_13),
        labelText: keyMobileNumber.tr,
        hintStyle: TextStyle(color: Colors.grey),
        validate: (data) =>
            Validator.fieldChecker(value: data, message: keyMobileNumber.tr),
        textController: controller.mobileNumberTextController,
        focusNode: controller.mobileNumberFocusNode,
        readOnly: true,
        // maxLength: 35,
        inputType: TextInputType.number,
        inputAction: TextInputAction.next,
      ).paddingOnly(top: margin_15);

  phoneNo() {
    return Obx(
      () => CountryPickerr(
        onChange: (phone) {
          if (phone.number == "0") {
            controller.mobileNumberTextController.text = "";
          }
        },
        prefixIcon: true,
        borderColor: true,
        readOnly: (controller.isSocial == 1 || controller.isSocial == true)
            ? false
            : true,
        selectedCountry: controller.selectedCountry?.value,
        textController: controller.mobileNumberTextController,
        countryController: controller.mobileNumberTextController,
        focusNode: controller.mobileNumberFocusNode,
        onCountryChanged: (country) {
          controller.selectedCountry?.value = country;
          controller.selectedCountry?.refresh();
        },
      ).marginOnly(top: margin_8),
    );
  }

  Widget sendButton() {
    return GestureDetector(
      onTap: () {
        if (controller.profileImage.value == "") {
          showInSnackBar(message: keyUploadProfileImage.tr);
        } else {
          controller.validateForm();
        }
      },
      child: Container(
        width: Get.width,
        height: height_45,
        decoration: BoxDecoration(
          color: appColor,
          borderRadius: BorderRadius.circular(radius_10),
        ),
        child: Center(
          child: TextView(
            Get.previousRoute == AppRoutes.customerProfileScreen
                ? keyUpdate.tr
                : keySave.tr,
            textStyle: textStyleBodyMedium()
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ).marginOnly(top: margin_30),
    );
  }
}
