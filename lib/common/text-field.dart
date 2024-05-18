// ignore_for_file: file_names

import 'package:duwith_social/common/custom-text.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:flutter/material.dart';

import '../utils/sizes.dart';

class InputTextField extends StatefulWidget {
  final bool obscureText;
  final int differentiate;
  final Color innerColor;
  final IconData prefixIcon;
  final Color textColor;
  final bool password;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final bool textInputAction;
  final String? hintText;
  final int? maxlines;

  const InputTextField({
    Key? key,
    required this.obscureText,
    this.textInputAction = false,
    this.controller,
    this.password = false,
    this.validator,
    this.hintText,
    this.keyboardType,
    this.maxlines,
    required this.prefixIcon,
    this.onChanged,
    required this.innerColor,
    required this.textColor,
    required this.differentiate,
  }) : super(key: key);

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightSize(50),
      decoration: ShapeDecoration(
        color: const Color(0xFF111112),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: TextFormField(
        style: TextStyle(
            fontFamily: UsedFonts.poppins,
            fontWeight: FontWeight.w400,
            color: const Color(0xFFB4B4B4),
            fontSize: fontSize(20)),
        controller: widget.controller,
        onChanged: widget.onChanged,
        validator: widget.validator,
        textAlign: TextAlign.left,
        keyboardType: widget.keyboardType,
        maxLines: widget.obscureText == false ? widget.maxlines : 1,
        textInputAction: !widget.textInputAction
            ? TextInputAction.next
            : TextInputAction.done,
        obscureText: widget.obscureText ? !_passwordVisible : false,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.innerColor,
          hintText: widget.hintText,
          hintStyle: TextStyle(
              fontSize: fontSize(13),
              fontWeight: FontWeight.w400,
              fontFamily: UsedFonts.poppins,
              color: textColor3),
          prefixIcon: Icon(
            widget.prefixIcon,
            color: textColor,
            size: heightSize(16),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.innerColor),
              borderRadius: BorderRadius.circular(16)),
          suffixIcon: widget.password
              ? IconButton(
                  icon: _passwordVisible
                      ? Icon(
                          Icons.visibility_outlined,
                          color: const Color(0xFF4D4D4D),
                          size: heightSize(23),
                        )
                      : Icon(
                          Icons.visibility_off_outlined,
                          color: const Color(0xFF4D4D4D),
                          size: heightSize(23),
                        ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                )
              : null,
          contentPadding:
              EdgeInsets.only(left: widthSize(5), top: heightSize(4)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: widget.innerColor),
          ),
        ),
      ),
    );
  }
}
