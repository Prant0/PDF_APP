import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(40),
        ),
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        onPressed: onClicked,
      );
}


class CustomeTextField extends StatelessWidget {
  const CustomeTextField(
  {super.key,
  required this.controller,
  this.validator,
  this.hintText,
  this.keyType,
  this.prefixIcon,
  this.onEditingComplete,
  this.focusNode,
  this.onTap,
  this.maxLine,
  this.textInputAction,
  this.onChangeFunction});

  final TextEditingController controller;
  final String? hintText;
  final TextInputType? keyType;
  final dynamic validator;
  final dynamic prefixIcon;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final Function? onChangeFunction;
  final VoidCallback? onEditingComplete;
  final int? maxLine;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        focusNode: focusNode,
        textInputAction: textInputAction,
        onEditingComplete: onEditingComplete,
        onTap: onTap,
        keyboardType: keyType,
        validator: validator,
        maxLines:null,
        controller: controller,
        style: myStyle(14.0, Colors.black54),
        decoration: InputDecoration(
          errorStyle: myStyle(12, Colors.red),
          border: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: "$hintText",
          labelText: hintText,
          hintStyle: myStyle(14, Colors.black54),
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(8.0),
          ),
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
        ));
  }
}

myStyle (double size,[Color? color,FontWeight ?fw]){
  return TextStyle(
      fontSize: size,
      color: color,
      fontWeight: fw,
      height: 1.1
  );
}
