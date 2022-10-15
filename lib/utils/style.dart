import 'package:eeese_hackathon/utils/dimensions.dart';
import 'package:flutter/material.dart';

//custom styles for theme and texts

class MyInputTheme {
  static InputDecoration mytheme(String hint) => InputDecoration(
        hintText: hint,
        hintStyle: MyTextStyle().mediumText(Colors.black45),
        border: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(Dimensions.radius15)),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.4),
              width: 1,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(Dimensions.radius15)),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1,
            )),
      );

  // Method for generating the Text Style
  TextStyle _buildTextStyle(Color color, {double size = 16.0}) {
    return TextStyle(
      color: color,
      fontSize: size,
    );
  }

  // Method for generating the Border style

  OutlineInputBorder _buildOutlineBorder(Color color) {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: color,
          width: 1,
        ));
  }

  InputDecorationTheme theme() => InputDecorationTheme(
        //Basic paramerters
        contentPadding: const EdgeInsets.all(15),
        filled: true,
        fillColor: Colors.white.withOpacity(0.5),
        isDense: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,

        //Borders
        enabledBorder: _buildOutlineBorder(Colors.grey),
        errorBorder: _buildOutlineBorder(Colors.red),
        focusedBorder: _buildOutlineBorder(Colors.white),
        focusedErrorBorder: _buildOutlineBorder(Colors.red),
        disabledBorder: _buildOutlineBorder(Colors.grey),
        // text
        suffixStyle: _buildTextStyle(Colors.black),
        counterStyle: _buildTextStyle(Colors.white),
        floatingLabelStyle: _buildTextStyle(Colors.black, size: 14),
        errorStyle: _buildTextStyle(Colors.red, size: 14),
        helperStyle: _buildTextStyle(Colors.white, size: 14),
        hintStyle: _buildTextStyle(Colors.black),
        labelStyle: _buildTextStyle(Colors.black),
        prefixStyle: _buildTextStyle(Colors.black),
      );
}

class MyTextStyle {
  TextStyle bigText(Color? color) =>
      TextStyle(fontSize: Dimensions.font26, color: color);
  TextStyle mediumText(Color? color) =>
      TextStyle(fontSize: Dimensions.font16, color: color);
}
