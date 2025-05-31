

import '../../export.dart';

class DropDownWidget extends StatelessWidget {
  final String? hint;
  final FocusNode? focusNode;
  final dynamic itemSelected;
  final dynamic validator;
  final dynamic dropdownMenuItems;
  final Color? color;
  final dynamic icon;
  final dynamic onChanged;

  const DropDownWidget({
    Key? key,
    this.hint,
    this.focusNode,
    this.itemSelected,
    this.validator,
    this.dropdownMenuItems,
    this.color,
    this.icon,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            focusNode: focusNode,
            validator: validator,
            isDense: true,
            decoration: InputDecoration(
              fillColor: Colors.transparent,
              filled: true,
              isDense: false,
              contentPadding: EdgeInsets.only(
                  right: margin_10, top: height_10, bottom: height_10),
            ),
            style: textStyleBodyMedium().copyWith(color: colorHintGrey),
            hint: Text(hint!,
                style: textStyleBodyMedium()
                    .copyWith(color: color ?? Colors.grey)),
            isExpanded: true,
            icon: icon ??
                Transform.rotate(
                    angle: 4.71239,
                    child: Icon(
                      Icons.arrow_back_ios_outlined,
                      size: margin_18,
                      color: Colors.black,
                    )),
            iconSize: margin_18,
            iconEnabledColor: color ?? Colors.grey,
            value: itemSelected,
            items: dropdownMenuItems,
            onChanged: onChanged));
  }
}
