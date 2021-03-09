import 'package:flutter/material.dart';
import 'package:interviewVoiceApp/properties/colors.dart';
import 'package:interviewVoiceApp/properties/strings.dart';

Widget textFieldWidget({
  @required String hintText,
  String labelText,
  String validateMsg = REQUIREDFIELDMSG,
  IconData icon,
  IconData prefixIcon,
  Color iconColor = BLACK,
  Color prefixIconColor = BLACK,
  Color cursorColor,
  Color textColor = BLACK,
  @required TextEditingController controller,
  bool validate = true,
  bool suggestion = false,
  TextInputType inputType = TextInputType.text,
  int maxLine = 1,
  int minLine = 1,
  bool validateEmail = false,
  double width,
  enable = true,
  bool removeBorder = false,
  void Function() onIconTap,
  TextInputAction inputAction,
  void Function() onEditingComplete,
  void Function(String text) onChanged,
  @required FocusNode focusNode,
  TextAlign textAlign = TextAlign.left,
}) {
  return Container(
    width: width,
    child: TextFormField(
      enabled: enable,
      enableSuggestions: suggestion,
      keyboardType: inputType,
      controller: controller,
      minLines: minLine,
      maxLines: maxLine,
      focusNode: focusNode,
      autofocus: false,
      textInputAction: inputAction,
      cursorColor: cursorColor,
      textAlign: textAlign,
      style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
      onEditingComplete: () {
        print(controller.text);
        focusNode.unfocus();
        onEditingComplete();
      },
      onChanged: (String text) => onChanged(text),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: ASHDEEP),
        labelText: labelText,
        labelStyle: TextStyle(color: BLACK),
        prefixIcon: prefixIcon == null
            ? null
            : Icon(prefixIcon, color: prefixIconColor),
        suffixIcon: icon == null
            ? null
            : GestureDetector(
                onTap: onIconTap,
                child: Icon(icon, color: iconColor),
              ),
        enabledBorder: removeBorder
            ? InputBorder.none
            : OutlineInputBorder(
                borderSide: BorderSide(color: BLACK, width: .5),
              ),
        focusedBorder: removeBorder
            ? InputBorder.none
            : OutlineInputBorder(
                borderSide: BorderSide(color: BLACK, width: .5),
              ),
        border: removeBorder
            ? InputBorder.none
            : OutlineInputBorder(
                borderSide: BorderSide(color: BLACK, width: .5),
              ),
        errorStyle: TextStyle(
          color: Colors.red,
        ),
      ),
      validator: (value) {
        RegExp regex = new RegExp(PATTERN);
        if (value.isEmpty && validate) {
          return validateMsg;
        } else if (validateEmail && !regex.hasMatch(value)) {
          return "Please enter a valid email address";
        }
        return null;
      },
    ),
  );
}
