import '../../export.dart';

class SingleSelectDropdown extends StatelessWidget {
  final FocusNode? focusNode;
  final String? hint;
  final List<DropdownMenuItem<String>> dropdownMenuItems;
  final String? Function(Object?)? validate;
  final Function(Object?) onChanged;
  RxBool isFocused = false.obs;
  final Widget? icon;
  final InputBorder? border;
  final String? itemSelected;
  final Color? color;
  final BorderSide? borderSide;
  final Padding? padding;
  final String? labelText;
  final InputDecoration? decoration;

  SingleSelectDropdown({
    Key? key,
    this.hint,
    this.focusNode,
    this.itemSelected,
    required this.dropdownMenuItems,
    this.validate,
    this.icon,
    required this.onChanged,
    this.color,
    this.borderSide,
    this.border,
    this.padding,
    this.labelText,
    this.decoration,
  }) {
    isFocused.value = focusNode?.hasFocus == true;
    focusNode?.addListener(() {
      isFocused.value = focusNode?.hasFocus == true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(keyGender.tr,
            textStyle: textStyleLabelMeduim().copyWith(
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w400,
                fontSize: font_12)),
        SizedBox(
          height: height_3,
        ),
        DropdownButtonFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          focusNode: focusNode,
          validator: validate,
          isDense: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: margin_20, vertical: margin_12),
            labelText: labelText,
            fillColor: mobileNumberColor,
            filled: false,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius_10)),
                borderSide: BorderSide(color: Colors.grey.shade400)),
            focusedBorder: border ??
                OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(radius_10)),
                    borderSide: BorderSide(color: Colors.grey.shade400)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius_10)),
                borderSide: BorderSide(color: Colors.grey.shade400)),
            errorMaxLines: 1,
            errorStyle: textStyleBodyMedium()
                .copyWith(fontSize: font_11, color: Colors.red),
            isDense: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius_10),
                borderSide:
                    BorderSide(color: Colors.grey.shade500, width: margin_0)),
          ),
          dropdownColor: Colors.white,
          hint: Text(
            hint ?? "Select Item",
            style: textStyleBody1().copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: font_15),
          ),
          style: Theme.of(Get.context!).textTheme.headlineSmall!.copyWith(
              fontSize: font_14,
              fontWeight: FontWeight.w500,
              color: Colors.white),

          icon: icon ??
              Transform.rotate(
                  angle: 4.71239,
                  child: const Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.black,
                  )),
          // iconSize: margin_18,
          iconEnabledColor: color ?? Colors.grey,
          value: itemSelected,
          items: dropdownMenuItems,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
