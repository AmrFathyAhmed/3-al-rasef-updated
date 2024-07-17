import 'package:flutter/material.dart';

import '../../constent.dart';

class CustomTextField extends StatefulWidget
{
   CustomTextField({Key? key, this.hintText, this.iconData, this.obscureText =false , this.onChanged, this.validator, this.onTap}) : super(key: key);
  final String? hintText;
  final IconData? iconData;
  final bool? obscureText;
  final Function(String)? onChanged;
  final Function()? onTap;
  String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText:widget.obscureText!,
        validator: widget.validator,

        onChanged: widget.onChanged,
      textAlign: TextAlign.right,

     decoration: InputDecoration(
       border: InputBorder.none,

       hintText: '${widget.hintText}',
       hintStyle: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.w400,color: Color(0xff707070),fontSize: 18),
       prefixIcon: GestureDetector(child: Icon(widget.iconData),onTap: widget.onTap),
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
     )

    );
  }
}



//==========================================================================
class CustomTextField2 extends StatefulWidget
{
  CustomTextField2({Key? key, this.hintText, this.iconData, this.obscureText =false , this.onChanged, this.validator, this.onTap, this.maxLine, this.controller, this.onSubmit}) : super(key: key);
  final String? hintText;
  final int? maxLine;
  final IconData? iconData;
  final bool? obscureText;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  final Function()? onTap;
  final TextEditingController? controller;

  String? Function(String?)? validator;

  @override
  State<CustomTextField2> createState() => _CustomTextField2State();
}

class _CustomTextField2State extends State<CustomTextField2> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(

        obscureText:widget.obscureText!,
        validator: widget.validator,

        onChanged: widget.onChanged,
        textAlign: TextAlign.right,
        maxLines: widget.maxLine,
        controller: widget.controller,
        decoration: InputDecoration(

          prefixIconColor: kPrimaryColor,
          filled: true,
          fillColor: Colors.black12,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(32)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32), // Border radius
            borderSide: BorderSide(
              color: Colors.white,
              // Custom enabled border color
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32), // Border radius
            borderSide: BorderSide(
              color: kPrimaryColor,
              width: 2

              // Custom enabled border color
            ),

          ),

hoverColor: kPrimaryColor,

          hintText: '${widget.hintText}',
          hintStyle: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.w400,color: Color(0xff707070),fontSize: 18),
          prefixIcon: GestureDetector(child: Icon(widget.iconData),onTap: widget.onTap),
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
        cursorColor: kPrimaryColor,

    );
  }
}
