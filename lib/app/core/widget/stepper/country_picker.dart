

import '../../../export.dart';
import '../intl_phone_fieldd.dart';

class CountryPicker extends StatelessWidget {
  Country? selectedCountry;
  final onCountryChanged;
  final readOnly;
  final borderRadius;
  final decoration;
  bool? prefixIcon;
  final borderColor;
  final headingColor;
  final TextEditingController? mobileNumberTextController;
  final TextEditingController? countryController;

  CountryPicker(
      {Key? key,
      this.readOnly,
      this.decoration,
      this.headingColor,
      this.borderRadius,
      this.prefixIcon = false,
      this.borderColor = false,
      required this.selectedCountry,
      required this.mobileNumberTextController,
      required this.countryController,
      required this.onCountryChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextView(keyMobileNumber.tr,
            textStyle: textStyleLabelMeduim().copyWith(
                color: headingColor ?? greyColor, fontWeight: FontWeight.w600)),
        IntlPhoneFieldd(
          cursorColor: Colors.white,
          showCountryFlag: true,
          showDropdownIcon: true,
          readOnly: readOnly ?? false,
          dropdownIcon: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
          keyboardType: TextInputType.number,
          validator: (data) => Validator.validatePhoneNumber(
              value:mobileNumberTextController?.text ?? data.toString(),
              selectedCountry: selectedCountry),
          initialCountryCode: selectedCountry?.code,
          invalidNumberMessage: keyInvalidMobileNumber.tr,
          dropdownTextStyle: textStyleHeadlineSmall()
              .copyWith(color: Colors.white, fontSize: font_15),
          controller: mobileNumberTextController,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          style: textStyleHeadlineSmall()
              .copyWith(color: Colors.white, fontSize: font_15),
          decoration: InputDecoration(
              fillColor: mobileNumberColor,
              filled: true,
              prefixIcon: prefixIcon!
                  ? SizedBox(
                      width: height_2,
                      height: height_15,
                      child: VerticalDivider(
                        color: Colors.white,
                        thickness: margin_1,
                      ).marginSymmetric(horizontal: margin_5),
                    ).paddingOnly(
                      right: margin_4,
                    )
                  : SizedBox(),
              counterText: "",
              errorMaxLines: 2,
              errorStyle: Theme.of(Get.context!).textTheme.bodySmall!.copyWith(
                  fontSize: font_10,
                  fontWeight: FontWeight.w500,
                  color: Colors.red),
              hintText: keyEnteryourMobileNumber.tr,
              hintStyle: textStyleTitleSmall().copyWith(color: hintTextColor),
              focusedErrorBorder: decoration ??
                  OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(borderRadius ?? radius_10),
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
              errorBorder: decoration ??
                  OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(borderRadius ?? radius_10),
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
              enabledBorder: decoration ??
                  OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(borderRadius ?? radius_10),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
              border: decoration ??
                  OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(borderRadius ?? radius_10),
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
              disabledBorder: decoration ??
                  OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(borderRadius ?? radius_10),
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
              focusedBorder: decoration ??
                  OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(borderRadius ?? radius_10),
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
              contentPadding: EdgeInsets.only(
                bottom: margin_8,
                top: margin_10,
              )),
          onChanged: (phone) {},
          onCountryChanged: onCountryChanged ??
              (country) {
                selectedCountry = country;
                countryController?.text = selectedCountry!.name;
                mobileNumberTextController?.clear();
              },
        ),
      ],
    );
  }
}
