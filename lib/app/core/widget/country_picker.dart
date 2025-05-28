import 'package:intl_phone_field/phone_number.dart';

import '../../export.dart';
import 'intl_phone_fieldd.dart';

class CountryPickerr extends StatelessWidget {
  Country? selectedCountry;
  final onCountryChanged;
  final onChange;
  final readOnly;
  final String? labelText;
  final headingColor;
  final borderRadius;
  bool? prefixIcon;
  final borderColor;
  final decoration;
  final dropdownIconPosition;
  final isShadow;
  bool? showCountryFlag;
  final fillColor;
  final FutureOr Function(PhoneNumber?)? validator;
  final TextEditingController? textController;
  final FocusNode? focusNode;
  final TextEditingController? countryController;

  CountryPickerr(
      {Key? key,
      this.showCountryFlag,
      this.readOnly,
      this.headingColor,
      this.borderRadius,
      this.borderColor = false,
      this.decoration,
      this.fillColor,
      this.validator,
      this.isShadow = false,
      required this.selectedCountry,
      required this.textController,
      required this.focusNode,
      required this.countryController,
      required this.onCountryChanged,
      this.labelText,
      this.onChange,
      this.dropdownIconPosition,
      this.prefixIcon = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(keyMobileNumber.tr,
            textStyle: textStyleLabelSmall().copyWith(
                color: headingColor ?? Colors.grey,
                fontWeight: FontWeight.w400)),
        IntlPhoneFieldd(
          cursorColor: Colors.grey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          showCountryFlag: showCountryFlag ?? true,
          showDropdownIcon: true,
          dropdownIcon: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.grey,
          ),
          dropdownIconPosition: dropdownIconPosition ?? IconPosition.trailing,
          readOnly: readOnly ?? false,
          keyboardType: TextInputType.number,
          validator: (data) => PhoneNumberValidate.validatePhoneNumber(
              textController?.text ?? data.toString(), selectedCountry),
          initialCountryCode: selectedCountry?.code,
          enabled: readOnly == true ? false : true,
          invalidNumberMessage: '     ${keyInvalidMobileNumber.tr}',
          dropdownTextStyle: textStyleHeadlineSmall().copyWith(
            color: Colors.grey,
            fontSize: font_16,
          ),
          controller: textController,
          focusNode: focusNode,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          style: textStyleTitleSmall()
              .copyWith(color: Colors.black, fontSize: font_15),
          decoration: InputDecoration(
            isCollapsed: true,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: margin_10),
            filled: false,
            prefixIcon: prefixIcon!
                ? SizedBox(
                    width: height_2,
                    height: height_15,
                    child: VerticalDivider(
                      color: Colors.grey,
                      thickness: margin_1,
                    ),
                  )
                : SizedBox(),
            counterText: "",
            errorMaxLines: 2,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            errorStyle: Theme.of(Get.context!).textTheme.bodySmall!.copyWith(
                fontSize: font_10,
                fontWeight: FontWeight.w400,
                color: Colors.red),
            fillColor: Colors.white,
            labelText: labelText ?? '',
            labelStyle: textStyleBody1().copyWith(color: Colors.black),
            hintText: keyMobileNumber.tr,
            hintStyle: textStyleBody1().copyWith(
                color: Colors.grey.shade400,
                fontSize: font_13,
                fontWeight: FontWeight.w400),
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
                  borderSide: BorderSide(color: Colors.grey.shade400),
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
          ),
          onChanged: onChange ?? (phone) {},
          onCountryChanged: onCountryChanged ??
              (country) {
                selectedCountry = country;
                countryController?.text = selectedCountry!.name;
                textController?.clear();
              },
        ).marginOnly(top: margin_6, bottom: margin_12),
      ],
    );
  }
}
