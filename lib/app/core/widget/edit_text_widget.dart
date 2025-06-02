
import '../../export.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hint;
  final String? labelText;
  final double? labelMargin;
  final double? maxHeight;
  final Color? fillColor;
  final Color? courserColor;
  final validate;
  final hintStyle;
  final style;
  final bool? borderEnabled;
  final bool? isBorderColor;
  final labelTextStyle;
  final EdgeInsets? contentPadding;
  final TextInputType? inputType;
  final TextEditingController? textController;
  final FocusNode? focusNode;
  final Function(String value)? onFieldSubmitted;
  final Function()? onTap;
  final TextInputAction? inputAction;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines;
  final decoration;
  final borderRadius;
  final int? minLine;
  final int? maxLength;
  final bool readOnly;
  final bool? autoFocus;
  final Color? borderColor;
  final bool? obscureText;
  final suffixIconConstraints;
  final bool? isShadow;
  final radius;
  final Function(String value)? onChange;
  final List<TextInputFormatter>? formatter;
  final bgColor;

  const TextFieldWidget({
    this.hint,
    this.labelText,
    this.bgColor,
    this.style,
    this.inputType,
    this.textController,
    this.hintStyle,
    this.labelMargin,
    this.labelTextStyle,
    this.courserColor,
    this.borderEnabled = false,
    this.validate,
    this.onChange,
    this.decoration,
    this.focusNode,
    this.maxHeight,
    this.readOnly = false,
    this.onFieldSubmitted,
    this.formatter,
    this.inputAction,
    this.borderRadius,
    this.contentPadding,
    this.maxLines = 1,
    this.minLine = 1,
    this.borderColor,
    this.maxLength,
    this.isBorderColor = false,
    this.fillColor,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixIconConstraints,
    this.radius,
    this.obscureText,
    this.isShadow = false,
    this.onTap,
    this.autoFocus,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText != null
            ? TextView(labelText ?? "",
                    textStyle: labelTextStyle ??
                        textStyleLabelSmall().copyWith(
                            color:
                                isShadow == true ? Colors.black87 : Colors.grey,
                            fontWeight: FontWeight.w400))
                .paddingOnly(bottom: labelMargin ?? margin_2)
            : Container(),
        TextFormField(
            autofocus: autoFocus ?? false,
            readOnly: readOnly,
            onTap: onTap,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: obscureText ?? false,
            controller: textController,
            focusNode: focusNode,
            keyboardType: inputType,
            maxLength: maxLength,
            onChanged: onChange,
            cursorColor: courserColor ?? appColor,
            inputFormatters: formatter,
            maxLines: maxLines,
            minLines: minLine,
            obscuringCharacter: "*",
            textInputAction: inputAction,
            onFieldSubmitted: onFieldSubmitted,
            validator: validate,
            style: style ??
                textStyleTitleMedium()
                    .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
            decoration:
                isShadow == true ? shadowDecoration() : inputDecoration()),
      ],
    );
  }

  shadowDecoration() => InputDecoration(
        errorMaxLines: 3,
        hoverColor: appColor,
        filled: true,
        isCollapsed: true,
        enabled: true,
        isDense: true,
        counterText: '',
        contentPadding: contentPadding ??
            EdgeInsets.only(
                bottom: margin_10,
                right: isShadow == true ? margin_10 : margin_5,
                left: isShadow == true ? margin_10 : margin_0,
                top: isShadow == true ? margin_10 : margin_0),
        prefixIcon: prefixIcon,
        prefixIconConstraints: BoxConstraints(maxHeight: height_15),
        suffixIcon: suffixIcon,
        suffixIconConstraints: suffixIconConstraints != null
            ? suffixIconConstraints
            : BoxConstraints(
                maxHeight: maxHeight ?? height_18, maxWidth: height_18),
        hintText: hint,
        hintStyle:
            hintStyle ?? textStyleTitleSmall().copyWith(color: hintTextColor),
        labelText: "",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        errorStyle: Theme.of(Get.context!).textTheme.bodySmall!.copyWith(
            fontSize: font_11, fontWeight: FontWeight.w400, color: Colors.red),
        fillColor: fillColor ?? mobileNumberColor,
        border: decoration ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.yellow),
              borderRadius: BorderRadius.circular(borderRadius ?? 50),
            ),
    enabledBorder:decoration ?? OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.yellow),
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
    ),
    focusedBorder: decoration ??OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.yellow, width: 1.5),
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
    ),
    errorBorder:  decoration ?? OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
    ),
    focusedErrorBorder: decoration ??OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
    ),
      );

  inputDecoration() => InputDecoration(
        errorMaxLines: 3,
        hoverColor: appColor,
        filled: true,
        isCollapsed: true,
        isDense: true,
        errorStyle: Theme.of(Get.context!).textTheme.bodySmall!.copyWith(
            fontSize: font_11, fontWeight: FontWeight.w400, color: Colors.red),
        counterText: '',
        contentPadding: contentPadding ??
            EdgeInsets.only(
                bottom: margin_10,
                right: isShadow == true ? margin_10 : margin_5,
                left: isShadow == true ? margin_10 : margin_0,
                top: isShadow == true ? margin_10 : margin_0),
        prefixIcon: prefixIcon,
        prefixIconConstraints: BoxConstraints(maxHeight: height_15),
        suffixIcon: suffixIcon,
        suffixIconConstraints: suffixIconConstraints != null
            ? suffixIconConstraints
            : BoxConstraints(
                maxHeight: maxHeight ?? height_23, maxWidth: height_23),
        hintText: hint,
        hintStyle:
            hintStyle ?? textStyleTitleSmall().copyWith(color: hintTextColor),
        labelText: "",
        fillColor: fillColor ?? mobileNumberColor,
        floatingLabelBehavior: FloatingLabelBehavior.always,
    border: decoration ??
        OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.yellow,width: 1.5),
          borderRadius: BorderRadius.circular(borderRadius ?? 50),
        ),
    enabledBorder:decoration ?? OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.yellow,width: 1.5),
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
    ),
    focusedBorder: decoration ??OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.yellow, width: 1.5),
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
    ),
    errorBorder:  decoration ?? OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red,width: 1.5),
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
    ),
    focusedErrorBorder: decoration ??OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red,width: 1.5),
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
    ),
      );
}





class DecoratedInputBorder extends InputBorder {
  DecoratedInputBorder({
    required this.child,
    required this.shadow,
  }) : super(borderSide: child.borderSide);

  final InputBorder child;

  final BoxShadow shadow;

  @override
  bool get isOutline => child.isOutline;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      child.getInnerPath(rect, textDirection: textDirection);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) =>
      child.getOuterPath(rect, textDirection: textDirection);

  @override
  EdgeInsetsGeometry get dimensions => child.dimensions;

  @override
  InputBorder copyWith(
      {BorderSide? borderSide,
      InputBorder? child,
      BoxShadow? shadow,
      bool? isOutline}) {
    return DecoratedInputBorder(
      child: (child ?? this.child).copyWith(borderSide: borderSide),
      shadow: shadow ?? this.shadow,
    );
  }

  @override
  ShapeBorder scale(double t) {
    final scalledChild = child.scale(t);

    return DecoratedInputBorder(
      child: scalledChild is InputBorder ? scalledChild : child,
      shadow: BoxShadow.lerp(null, shadow, t)!,
    );
  }

  @override
  void paint(Canvas canvas, Rect rect,
      {double? gapStart,
      double gapExtent = 0.0,
      double gapPercentage = 0.0,
      TextDirection? textDirection}) {
    final clipPath = Path()
      ..addRect(const Rect.fromLTWH(-5000, -5000, 10000, 10000))
      ..addPath(getInnerPath(rect), Offset.zero)
      ..fillType = PathFillType.evenOdd;
    canvas.clipPath(clipPath);

    final Paint paint = shadow.toPaint();
    final Rect bounds = rect.shift(shadow.offset).inflate(shadow.spreadRadius);

    canvas.drawPath(getOuterPath(bounds), paint);

    child.paint(canvas, rect,
        gapStart: gapStart,
        gapExtent: gapExtent,
        gapPercentage: gapPercentage,
        textDirection: textDirection);
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is DecoratedInputBorder &&
        other.borderSide == borderSide &&
        other.child == child &&
        other.shadow == shadow;
  }

  @override
  int get hashCode => Object.hash(borderSide, child, shadow);

  @override
  String toString() {
    return '${objectRuntimeType(this, 'DecoratedInputBorder')}($borderSide, $shadow, $child)';
  }
}


/*class TextFieldWidget extends StatelessWidget {
  final String? hint;
  final String? labelText;
  final double? labelMargin;
  final Color? fillColor;
  final Color? courserColor;
  final validate;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final TextEditingController? textController;
  final FocusNode? focusNode;
  final Function()? onTap;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines;
  final double? borderRadius;
  final int? minLine;
  final int? maxLength;
  final bool readOnly;
  final bool? autoFocus;
  final bool? obscureText;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? formatter;
  final EdgeInsets? contentPadding;
  final BoxConstraints? suffixIconConstraints;

  const TextFieldWidget({
    super.key,
    this.hint,
    this.labelText,
    this.fillColor,
    this.courserColor,
    this.validate,
    this.hintStyle,
    this.style,
    this.textController,
    this.focusNode,
    this.onTap,
    this.inputType,
    this.inputAction,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLines = 1,
    this.minLine = 1,
    this.borderRadius,
    this.maxLength,
    this.readOnly = false,
    this.autoFocus = false,
    this.obscureText,
    this.onChanged,
    this.formatter,
    this.contentPadding,
    this.suffixIconConstraints,
    this.labelMargin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Padding(
            padding: EdgeInsets.only(bottom: labelMargin ?? 6.0),
            child: Text(
              labelText ?? '',
              style: const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
            ),
          ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: textController,
          focusNode: focusNode,
          readOnly: readOnly,
          obscureText: obscureText ?? false,
          autofocus: autoFocus ?? false,
          keyboardType: inputType,
          textInputAction: inputAction,
          maxLength: maxLength,
          maxLines: maxLines,
          minLines: minLine,
          inputFormatters: formatter,
          cursorColor: courserColor ?? Colors.white,
          onChanged: onChanged,
          onTap: onTap,
          validator: validate,
          style: style ?? const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle:
            hintStyle ?? const TextStyle(color: Colors.white70, fontSize: 15),
            fillColor: fillColor ?? const Color(0xFF1D3B1D),
            filled: true,
            contentPadding: contentPadding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            counterText: '',
            prefixIcon: prefixIcon,
            prefixIconConstraints: const BoxConstraints(minWidth: 40),
            suffixIcon: suffixIcon,
            suffixIconConstraints: suffixIconConstraints,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 12.5),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.yellow),
              borderRadius: BorderRadius.circular(borderRadius ?? 30),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.yellow, width: 1.5),
              borderRadius: BorderRadius.circular(borderRadius ?? 30),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(borderRadius ?? 30),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(borderRadius ?? 30),
            ),
          ),
        ),
      ],
    );
  }
}*/

