import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/common/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import 'base/base_stateful_widget.dart';
import 'material_text_field.dart';

class PasswordFieldWidget extends StatefulWidget{
  final TextEditingController ?  controller ;
  final ValueChanged<String> ? onChange ;
  final FormFieldValidator<String>? validator;
  final String  ? hintText ;
  final EdgeInsetsGeometry? margin ;

  const PasswordFieldWidget({Key? key,  this.controller,  this.onChange, this.validator, this.hintText, this.margin}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
   return _PasswordFieldState();
  }

}
class _PasswordFieldState extends BaseState<PasswordFieldWidget>{
  bool obscureText =true;
  @override
  Widget build(BuildContext context) {
    return MaterialTextField(
      inputDecoration: kTextFieldDecoration.copyWith(
          hintText:widget.hintText?? strings.enter_password,
          suffixIconConstraints: const BoxConstraints(maxWidth: 90),
          prefixIconConstraints: const BoxConstraints(maxWidth: 50),
          prefixIcon:const Padding(
            padding: EdgeInsetsDirectional.only(start: 16,end: 12),
            child: Icon(Icons.lock_outline_rounded),
          ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(onTap:(){
            setState(() {
              obscureText = !obscureText ;
            });
          },child: Icon(obscureText ? Icons.visibility_off: Icons.visibility),),
        )
      ),
      margin: widget.margin,
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      validator:widget.validator ?? (value) {
        if (value!.isNullOrEmpty()) {
          return strings.please_entry_password;
        } else if (value.length<6) {
          return strings.invalid_password;
        }
        return null;
      },
      onChanged: widget.onChange,
    );

  }

}