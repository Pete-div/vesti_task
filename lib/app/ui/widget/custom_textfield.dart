// import 'package:anywork_mobile_app/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    this.hintStyle,
    this.suffixIcon,
    this.enabled = true,
    this.controller,
    this.prefixIcon,
    this.keyboardType,
    this.hintText,
    this.labelTxt,
    this.error = false,
    this.borderColor,
    this.isEnabledColor = true,
    this.maxline,
    this.contentPadding,
    this.obscureText,
    this.ispassword = false,
    this.validator,
    this.readOnly = false,
    this.onchanged,
    this.errorText,
    this.onTap,
    this.textCapitalization,
    this.autofillHints,
  }) : super(key: key);
  final void Function()? onTap;
  final bool? enabled;
  final Iterable<String>? autofillHints;
  final String? Function(String?)? validator;
  final String? errorText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;
  final String? labelTxt;
  final TextCapitalization? textCapitalization;
  final Color? borderColor;
  final bool? error;
  final TextInputType? keyboardType;
  final bool? isEnabledColor;
  final bool? obscureText;
  final bool? readOnly;
  final bool ispassword;
  final TextStyle? hintStyle;
  final int? maxline;
  final EdgeInsetsGeometry? contentPadding;
  final Function(String value)? onchanged;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode focusNode = FocusNode();
  bool isFocused = false;

  void onFocusChange() {
    setState(() {
      isFocused = focusNode.hasFocus ? true : false;
    });
  }

  @override
  void initState() {
    focusNode.addListener(onFocusChange);
    super.initState();
  }

  @override
  void dispose() {
    focusNode.removeListener(onFocusChange);
    super.dispose();
  }

  bool showpassword = true;
  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    InputBorder inputBorder = OutlineInputBorder(
      gapPadding: 8,
      borderSide: const BorderSide(
        color: Color(0xff7cc858),
      ),
      borderRadius: BorderRadius.circular(4),
    );
    return TextFormField(
      style: Theme.of(context)
          .textTheme
          .bodySmall!
          .copyWith(fontSize: 14, color: const Color(0xff566b4b)),
      textCapitalization:
          widget.textCapitalization ?? TextCapitalization.sentences,
      keyboardType: widget.keyboardType,
      onTap: widget.onTap,
      onFieldSubmitted: (value) {
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      onEditingComplete: () => TextInput.finishAutofillContext(),
      autofillHints: widget.autofillHints,
      validator: widget.validator,
      controller: widget.controller,
      readOnly: widget.readOnly ?? false,
      focusNode: focusNode,
      maxLines: widget.maxline ?? 1,
      obscureText: widget.obscureText ?? false,
      enabled: widget.enabled,
      onChanged: widget.onchanged ?? (value) {},
      decoration: InputDecoration(
        hintStyle: widget.hintStyle ??
            Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 14, color: const Color(0xFF6F865D)),
        prefixIcon: widget.prefixIcon,
        disabledBorder: inputBorder.copyWith(
          borderSide: BorderSide(
            color: widget.borderColor ?? const Color(0xffF7FFF3),
          ),
        ),
        labelText: widget.labelTxt,
        labelStyle: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(fontSize: 14, color: const Color(0xFF51AE16)),
        helperStyle: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(fontSize: 14, color: const Color(0xFF6DB249)),
        contentPadding: const EdgeInsets.only(top: 30, left: 12),
        errorText: widget.errorText,
        errorStyle: const TextStyle(
          color: Colors.redAccent,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        // errorText: widget.errorText,
        hintText: widget.hintText,
        suffixIcon: widget.suffixIcon ?? const SizedBox.shrink(),
        enabledBorder: inputBorder,
        filled: true,
        fillColor: widget.isEnabledColor == false
            ? const Color(0xffF7FFF3)
            : const Color(0xffF7FFF3),
        border: OutlineInputBorder(
          gapPadding: 8,
          borderSide: const BorderSide(
            color: Color(0xFF67A948),
          ),
          borderRadius: BorderRadius.circular(4),
        ),

        errorBorder: widget.error == true
            ? inputBorder.copyWith(
                borderSide: const BorderSide(
                color: Colors.redAccent,
              ))
            : inputBorder,
        focusedBorder: OutlineInputBorder(
          gapPadding: 8,
          borderSide: const BorderSide(
            color: Color(0xFF67A948),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
